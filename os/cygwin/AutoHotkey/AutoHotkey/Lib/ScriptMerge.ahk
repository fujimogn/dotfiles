;#NoTrayIcon

;--------------------------------------------------------------------------------------
; Function:		Unjoin
;				Recreate original file system heerarchy of Joined script file.
;
; Parameters:
;		pFileName	-	File name that is product of Join function.
;						It will be scanned for Join related data and original
;						file system hierarchy will be created, recursively.
;
;		pCreated	-   Output, list of files that are created.
;
; Returns:
;		AHK source with original includes. 
;       Creates file system hierarchy of original source file
;
; Example:
;>      Unjoin("MyScript-NoInc.ahk", created, text)
;>		FileAppend %text%, MyScript.ahk
;
Unjoin( pFileName, ByRef pCreated, firstCall=1 ) {
;	static reS := ";=+[ ]START([ ]DIR)?[:][ ]([ \t]*#include[\t ]*,?[\t ]+(?:\*i[\t ]+)?([^:]+?)\s*):B1AD529B-BF4E-477F-8B9F-3080CAC55AE3"
	static reS := ";=+[ ]START([ ]DIR)?[:][ ]([ \t]*#include[\t ,][ \t]*(?:\*i[ \t]+)?(.+?)(?:[ \t]*|(?: [ \t]*;.+?)?)):B1AD529B-BF4E-477F-8B9F-3080CAC55AE3"
	static reE := ";=+[ ]END(?:\1)?[:][ ]\2:B1AD529B-BF4E-477F-8B9F-3080CAC55AE3`n"
	static sDir
	re = `ais)%reS%\R(.+?)\R%reE%		; 1 - DIR
										; 2 - original line with include
										; 3 - file path
										; 4 - text of the file
	if (firstCall){
		SplitPath, pFileName,,sDir,,,sDrive		
		if sDrive =
			pFileName := A_ScriptDir "\" pFileName		; pFileName was relative
		SplitPath, pFileName,,sDir,,,sDrive		

		FileRead, text, *t %pFileName%
		firstCall := false
	}
	else text := pFileName				; first parameter is used internaly after first call

	j := 1
	loop 
	{
		j := RegExMatch(text, re, out, j)			; find file
		if !j
			break
		incPath := out3

	;is it the dir switch include
		if (out1 = " DIR") {
			SplitPath, incPath,,,,,drive				
			if (drive = "")
				if chr(*&incPath)="\" {
					SplitPath, A_ScriptDir,,,,,drive
 					sDir := drive incPath
				}
				else	sDir .= "\" incPath
			
			text := RegExReplace(text, re, "$2", cnt, 1, j)

			FileCreateDir, %sDir%
			continue
		}

	;create dir's
		SplitPath, incPath,,incDir
		FileCreateDir, %sDir%\%incDir%

	;create file
		out4 := Unjoin(out4, pCreated, false)
		FileAppend, %out4%, %sDir%\%incPath%
		pCreated .= incPath "`n"

	;remove from the source
		text := RegExReplace(text, re, "$2", cnt, 1, j)
	}
	return text
}


;--------------------------------------------------------------------------------------
; Function:		Join
;				Join AHK script includes into the single script	with no includes
;
; Parameters:
;		pFileName	-	File name that is to be recursively resolved of its dependencies.
;						It will be treated the same way as if the .ahk file was 
;						started by double clicking on it. Includes that reference
;						to non-existing file names will be removed.
;
;		pInluded	-	Output, list of files that are included. Files that do not 
;						exist will have the sentence "! REMOVED" after the file name.
;
; Returns:
;		AHK source without includes
;
; Notes:
;		Function doesn't handle AHK variables in #include, for instance:
;>		%A_ScriptDir%\Library.ahk
;
; Example:
;>		res := Join("MyScript.ahk", included)
;>		FileAppend %res%, MyScript-NoIncludes.ahk
;
Join( pFileName, ByRef pIncluded, firstCall=1){
	static line := ";==================== X :B1AD529B-BF4E-477F-8B9F-3080CAC55AE3`n"
	static sDir, sDrive
;	static re := "im)^[ \t]*#include[\t ]*,?[\t ]+(?:\*i[\t ]+)?(.+?)[\t ]*$"
	static re := "`aim)^[ \t]*#include[\t ,][ \t]*(?:\*i[ \t]+)?(.+?)(?:[ \t]*|(?:[ \t]+;.+)?)$"	;must use `a for the same reason as *t bellow. Only this combination worked on all files... ??!

 ;first call
	if (firstCall){
		SplitPath, pFileName,,sDir,,,sDrive
		if sDrive =
			pFileName := A_ScriptDir "\" pFileName			; pFileName was relative

		SplitPath, pFileName,,sDir,,,sDrive					; Do it again with absolute name
		pIncluded := ""										; Clear include list as function expects it to be empty on start
	}

 ;check if file exists
	if !FileExist( pFileName ) {
		pIncluded .= pFileName  "  ! REMOVED" "`n"
		return
	}

	FileRead, text, *t %pFileName%							; must use *t becuase some files have problems with new lines ?!
	j := 1
	loop {

		j := RegExMatch(text, re, out, j)					; Try to find next include
		if !j
			break
		incPath := out1

	;convert relative paths to absolute
		SplitPath, incPath, ,,,,drive
		if (drive=""){
			if chr(*&incPath)="\"
				 incPath := sDrive incPath
			else incPath := sDir "\" incPath
		}

	;check is it dir   
		FileGetAttrib, attrib, %incPath%
		if InStr(attrib, "D") {
			sDir := incPath
			SplitPath, incPath ,,,,,sDrive

			rep  := RegExReplace(line,"X", "START DIR: " out) . "`n" . RegExReplace(line, "X", "END DIR: " out)
			text := RegExReplace(text, re, rep, cnt, 1, j)	; Delete dir switch include

			j+=StrLen(out)									; Don't delete it, but leave it, and skip it
			continue
		}

	;is it already included ?
		if !InStr( pIncluded, out1) 	{
			 pIncluded .= out1 "`n"							
			 rep := RegExReplace(line,"X", "START: " out)
				  . Join( incPath, pIncluded, false) . "`n"  
				  . RegExReplace(line,"X", "END: " out)
		}
		else rep := ""

		rep  := RegExReplace(rep, "[$]", "$$$$", dolarCount)	; Problem in replacement with $ replacement metachar
		text := RegExReplace(text, re, rep, cnt, 1, j)
		j += Strlen(rep) - dolarCount
	}
	
	return text
}
