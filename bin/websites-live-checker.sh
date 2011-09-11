#!/bin/bash
# Script to check webpages to see if websites/machines are live

# Uses a source file (specified on command line) with format:
# http://website.address key\ words --additional=options --for=wget
# for more info run with -h

# note that it is configured at present to make 10 (c loop) attempts
# and to timeout after 12 seconds (-T 12) on each attempt, with pauses
# starting at 1 secs and increasing to max 10 secs before any retries
# [Note that wget -w and --wait option does not seem to work]

VERSION=1.0624
function check_site () { 
	for (( c=1; c<=10; c++ )) do
		FOUND=`wget $WGETPARAMS -t 1 -T 12 -O - --no-check-certificate "$1" 2>&1|grep -c "$KEYTEXT"`
		if [ "$FOUND" -gt 0 ]; then break; fi
		[ -n "$VERBOSE" ] && echo -n ".">/dev/tty
		sleep $c
	done
	echo $FOUND
}

while getopts ":qhv" optname; do
    case "$optname" in
		"q")	QUIET=y;;
		"h")	HELP=y;;
		"v")	VERBOSE=y;;
		"?")	echo "Unknown option $OPTARG"; exit 1;;
		":")	echo "No argument value for option $OPTARG"; exit 1;;
		*)	echo "Unknown error while processing options"; exit 1;;
    esac
done
shift $(($OPTIND-1))

if [ "$QUIET" != "y" ]; then
	THIS=`basename $0`;echo -e \\n$THIS v.$VERSION by Dominic\\n${THIS//?/=}\\n
	COLUMNS=$(stty size 2>/dev/null||echo 80); COLUMNS=${COLUMNS##* }
fi
if [ "$HELP" = "y" ] || [ "$1" = "" ]; then
	echo "Checks webpages to see if they are live and returning specified key_text. Can also be used to check machines by ping or, if port is specified, by nmap."|fold -s -w $COLUMNS
	echo -e "\nUsage  : `basename $0` [options] source_file"
	echo "Example: `basename $0` -q mylist.txt"
	echo -e "\nOptions: -h  to see this text"
	echo "         -v  verbose (debug) text output"
	echo "         -q  text output only for a failure or status change"
	echo -e "\nsource_file:"
	echo "       source_file contains text lines in Unix format each with:"
	echo "           address[:port] checkstatus reportname key_text wget_options(1-4)"
	echo "      -  if address begins with 'http' then wget is used to test for keytext,"
	echo "           else if no port is specified ping is used, else nmap is used"
	echo "      -  checkstatus is 0 to report a status failure"
	echo "                     or 1 to report a change in status"
	echo "      -  reportname is the 'friendly' name that will appear in reports"
	echo "      -  key_text is case-sensitive [not used for machines, only for websites];"
	echo "         spaces in key_text/reportname must be escaped with \\, not quotes (\")"
	echo "      -  wget_options are additional options for wget e.g:"
	echo "           --http-user=myusername --http-password=mypassword"
	echo "      -  blank lines or lines beginning with # are ignored"
	echo -e "\nA permanent log is kept at /var/log/`basename $0 .sh`.log\n"
	echo -e "$THIS checks both the page output and any output from wget - including error text - for the presence of the key_text. This means that you should not use a keyword\
 that might appear unexpectedly anywhere in wget's output, but also that you can check for specific error words. In particular,\
 for password-protected sites, you can look for keywords returned by the site upon unauthorized access. This can\
 be quicker than passing through the authorization username and password and means you do not have to\
 put this sensitive data in source_file. For example:\\n  http://my.cctv.website.com 1 MyCCTV 401\ Authorisation\ Required\\ninstead of\\n  http://my.cctv.website.com 1 MyCCTV i-Catcher --user=fred --password=bloggs\n"|fold -s -w $COLUMNS
else
	#  This looks for running processes with the same name as this, then filters out any
	#  with the same pid, parent pid or session id as this one, and then filters out any
	#  which are tagged as <defunct>
	PRIOR="`ps -C \`basename $0\` --no-headers -o "pid,ppid,sid,comm"|grep -v "$$ "|grep -v "<defunct>"`"
	if [ ! -z "$PRIOR" ]; then
		[ "$QUIET" != "y" ] && echo -e "Aborting because another instance of `basename $0` is already running"
		exit 1
	fi
	NEWLOG="/var/log/`basename $1 .txt`-new.log"
	OLDLOG="/var/log/`basename $1 .txt`-old.log"
	[ "$QUIET" != "y" ] && echo -e "Using $1\\n"
	if [ -e "$NEWLOG" ]; then mv -f "$NEWLOG" "$OLDLOG"; fi
	while read WEBSITE CHECKSTATUS REPORTNAME KEYTEXT WGETPARAMS; do
		if [ "${#WEBSITE}" -gt 1 ]; then
			if [ "${WEBSITE:0:1}" != "#" ]; then
				if [ -e "$OLDLOG" ]; then
					PREVIOUSSTATUS=`grep -F "@ $REPORTNAME @" "$OLDLOG"|awk '{print $1}'`
				else
					PREVIOUSSTATUS=
				fi
				[ "${WEBSITE:0:4}" = "http" ] && TOTEST="website" || TOTEST="machine"
				if [ -n "$VERBOSE" ]; then
					echo -e "\nTesting $TOTEST\t: $WEBSITE\nCheckstatus\t: $CHECKSTATUS\nReportname\t: $REPORTNAME"
					[ "$TOTEST" != "machine" ] && echo -e "Keytext\t\t: $KEYTEXT\nOptions\t\t: $WGETPARAMS"
					echo -e "Previous Status\t: $PREVIOUSSTATUS"
				fi
				if [ "$TOTEST" = "machine" ]; then
					# it's not a website
					WEBSITEPORT=`expr index $WEBSITE :`
					if [ $WEBSITEPORT -ne 0 ]; then
						WEBSITEPORT=${WEBSITE:$WEBSITEPORT}
						WEBSITEIP=${WEBSITE%:*}
						[ -n "$VERBOSE" ] && echo -en "Testing by nmap\nTesting IP\t:$WEBSITEIP\nPort\t\t:$WEBSITEPORT\nCurrent Status\t: "
						{ time nmap --open -p $WEBSITEPORT $WEBSITEIP|grep -c open>/var/tmp/found_site.tmp; } 2>/var/tmp/check_site.tmp
					else
						[ -n "$VERBOSE" ] && echo -en "Testing by ping\nCurrent Status\t: "
						{ time ping -c 1 $WEBSITE>/dev/null; echo $((1-$?))>/var/tmp/found_site.tmp; } 2>/var/tmp/check_site.tmp
					fi
				else
					[ -n "$VERBOSE" ] && echo -en "Current Status\t: "
					{ time check_site $WEBSITE>/var/tmp/found_site.tmp; } 2>/var/tmp/check_site.tmp
				fi
				ELAPSED=`awk '($1=="real") {print $2}' /var/tmp/check_site.tmp`
				FOUND=`cat /var/tmp/found_site.tmp`
				[ "$FOUND" -gt "0" ] && FOUND=1
				[ -n "$VERBOSE" ] && echo -en "$FOUND - "
				if [ "$FOUND" -eq 0 ]; then
					if [ "$CHECKSTATUS" = "0" -o "$CHECKSTATUS" = "1" -a "$PREVIOUSSTATUS" != "0" ]; then
						echo "Unable to find $REPORTNAME ($ELAPSED)"
						echo $(date +"%Y-%m-%d %H:%M:%S"), $FOUND, $REPORTNAME, $ELAPSED>>"/var/log/`basename $0 .sh`.log"
					fi
				else
					#FOUND=1
					if [ "$QUIET" != "y" -o "$CHECKSTATUS" = "1" -a "$PREVIOUSSTATUS" != "1" ]; then
						echo "Found $REPORTNAME ($ELAPSED)"
						echo $(date +"%Y-%m-%d %H:%M:%S"), $FOUND, $REPORTNAME, $ELAPSED>>"/var/log/`basename $0 .sh`.log"
					fi
				fi
				echo "$FOUND @ $REPORTNAME @">>"$NEWLOG"
			fi
		fi
	done<"$1"
fi
