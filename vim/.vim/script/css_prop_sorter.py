#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''CSS Property Sorter Script
This script will sort CSS properties by defined rule. Script reads standard
input and sort it by lines if the lines are CSS property, and write them to
standard output.

CREDITS
This script is based on Kyo Nagashima's Perl script:
http://hail2u.net/blog/coding/perl-sort-css-properties.html

Author: Yu I. <Twitter @japboy>
Original author: Kyo Nagashima <kyo@hail2u.net>, http://hail2u.net/
                 xaicron, http://blog.livedoor.jp/xaicron/
License: MIT license (http://opensource.org/licenses/mit-license.php)
'''

import sys
import re

css_properties = []

# CSS 2.1
css_properties += '''
margin-top
margin-right
margin-bottom
margin-left
margin
padding-top
padding-right
padding-bottom
padding-left
padding
border-top-width
border-right-width
border-bottom-width
border-left-width
border-width
border-top-color
border-right-color
border-bottom-color
border-left-color
border-color
border-top-style
border-right-style
border-bottom-style
border-left-style
border-style
border-top
border-right
border-bottom
border-left
border
display
position
top
right
bottom
left
float
clear
z-index
direction
unicode-bidi
width
min-width
max-width
height
min-height
max-height
line-height
vertical-align
overflow
clip
visibility
content
quotes
counter-reset
counter-increment
list-style-type
list-style-image
list-style-position
list-style
page-break-before
page-break-after
page-break-inside
orphans
widows
color
background-color
background-image
background-repeat
background-attachment
background-position
background
font-family
font-style
font-variant
font-weight
font-size
font
text-indent
text-align
text-decoration
letter-spacing
word-spacing
text-transform
white-space
caption-side
table-layout
border-collapse
border-spacing
empty-cells
cursor
outline
outline-width
outline-style
outline-color
volume
speak
pause-before
pause-after
pause
cue-before
cue-after
cue
play-during
azimuth
elevation
speech-rate
voice-family
pitch
pitch-range
stress
richness
speak-punctuation
speak-numeral
speak-header
'''.lstrip('\n').splitlines()

# CSS 3 2D Transforms Module
css_properties += '''
transform
-moz-transform
-o-transform
-webkit-transform
transform-origin
-moz-transform-origin
-webkit-transform-origin
'''.lstrip('\n').splitlines()

# CSS 3 3D Transforms Module
css_properties += '''
perspective
-webkit-perspective
perspective-origin
-webkit-perspective-origin
backface-visibility
-webkit-backface-visibility
'''.lstrip('\n').splitlines()

# CSS 3 Animations Module
css_properties += '''
animation-name
-webkit-animation-name
animation-duration
-webkit-animation-duration
animation-timing-function
-webkit-animation-timing-function
animation-iteration-count
-webkit-animation-iteration-count
animation-direction
-webkit-animation-direction
animation-play-state
-webkit-animation-play-state
animation-delay
-webkit-animation-delay
animation
-webkit-animation
'''.lstrip('\n').splitlines()

# CSS 3 Backgrounds and Borders Module
css_properties += '''
background-clip
-moz-background-clip
-webkit-background-clip
background-origin
-moz-background-origin
-webkit-background-origin
background-size
-moz-background-size
-o-background-size
-webkit-background-size
border-top-right-radius
border-bottom-right-radius
border-bottom-left-radius
border-top-left-radius
border-radius
-moz-border-radius
-webkit-border-radius
border-image-source
border-image-slice
border-image-width
border-image-outset
border-image-repeat
border-image
-moz-border-image
-webkit-border-image
box-decoration-break
box-shadow
-moz-box-shadow
-webkit-box-shadow
'''.lstrip('\n').splitlines()

# CSS 3 Basic Box Model Module
css_properties += '''
overflow-x
-ms-overflow-x
overflow-y
-ms-overflow-y
overflow-style
marquee-style
-webkit-marquee-style
marquee-loop
marquee-direction
-webkit-marquee-direction
marquee-speed
-webkit-marquee-speed
-webkit-marquee
rotation
rotation-point
'''.lstrip('\n').splitlines()

# CSS 3 Basic User Interface Module
css_properties += '''
appearance
-moz-appearance
-webkit-appearance
icon
box-sizing
-moz-box-sizing
-webkit-box-sizing
outline-offset
resize
nav-index
'''.lstrip('\n').splitlines()

# CSS 3 Color Module
css_properties += '''
opacity
'''.lstrip('\n').splitlines()

# CSS 3 Fonts Module
css_properties += '''
font-stretch
font-size-adjust
src
unicode-range
'''.lstrip('\n').splitlines()

# CSS 3 Generated Content for Paged Media Module
css_properties += '''
string-set
bookmark-level
bookmark-label
bookmark-target
bookmark-state
'''.lstrip('\n').splitlines()

# CSS 3 Grid Positioning Module
css_properties += '''
grid-columns
grid-rows
'''.lstrip('\n').splitlines()

# CSS 3 Hyperlink Presentation Module
css_properties += '''
target-name
target-new
target-position
target
'''.lstrip('\n').splitlines()

# CSS 3 Image Values and Replaced Content Module
css_properties += '''
linear-gradient
-moz-linear-gradient
-webkit-gradient
image-resolution
'''.lstrip('\n').splitlines()

# CSS 3 Line Box Module
css_properties += '''
line-stacking-strategy
line-stacking-ruby
line-stacking-shift
line-stacking
alignment-baseline
alignment-adjust
baseline-shift
inline-box-align
drop-initial-size
drop-initial-value
drop-initial-before-align
drop-initial-before-adjust
drop-initial-after-align
drop-initial-after-adjust
'''.lstrip('\n').splitlines()

# CSS 3 Multi-column Layout Module
css_properties += '''
column-width
-moz-column-width
-webkit-column-width
column-count
-moz-column-count
-webkit-column-count
columns
-webkit-columns
column-gap
-moz-column-gap
-webkit-column-gap
column-rule-color
-moz-column-rule-color
-webkit-column-rule-color
column-rule-style
-moz-column-rule-style
-webkit-column-rule-style
column-rule-width
-moz-column-rule-width
-webkit-column-rule-width
column-rule
-moz-column-rule
-webkit-column-rule
column-span
column-fill
'''.lstrip('\n').splitlines()

# CSS 3 Paged Media Module
css_properties += '''
size
page
image-orientation
fit
fit-position
'''.lstrip('\n').splitlines()

# CSS 3 Presentation Levels Module
css_properties += '''
presentation-level
'''.lstrip('\n').splitlines()

# CSS 3 Ruby Module
css_properties += '''
ruby-position
ruby-align
ruby-overhang
ruby-span
'''.lstrip('\n').splitlines()

# CSS 3 Speech Module
css_properties += '''
voice-volume
voice-balance
rest-before
rest-after
rest
voice-rate
voice-pitch
voice-range
voice-stress
voice-duration
'''.lstrip('\n').splitlines()

# CSS 3 Text Module
css_properties += '''
bikeshedding
word-break
-ms-word-break
hyphens
hyphenate-character
hyphenate-resource
text-wrap
word-wrap
-ms-word-wrap
text-align-last
-ms-text-align-last
text-justify
-ms-text-justify
text-shadow
text-indent
hanging-punctuation
text-emphasis
text-shadow
text-outline
'''.lstrip('\n').splitlines()

# CSS 3 Transitions Module
css_properties += '''
transition-property
-webkit-transition-property
transition-duration
-webkit-transition-duration
transition-timing-function
-webkit-transition-timing-function
transition-delay
-webkit-transition-delay
transition
-webkit-transition
'''.lstrip('\n').splitlines()

def prioritify(line_buffer):
    '''Prioritizer Function
    This function will return argument's priority. Priority will be integer and
    smaller number will be higher priority.
    '''

    priority = 9999

    for css_property in css_properties:
        if line_buffer.find(css_property + ':') != -1:
            priority = css_properties.index(css_property)
            break

    return priority

def sort_properties(stdin_buffer):
    '''CSS Property Sorter Function
    This function will read buffer argument, split it to a list by lines,
    sort it by defined rule, and return sorted buffer if it's CSS property.
    This function depends on 'prioritify' function.
    '''

    pattern = re.compile(r'(.*?{\r?\n?)(.*?)(}.*?)', re.DOTALL + re.MULTILINE)
    matched_patterns = pattern.findall(stdin_buffer)
    sorted_patterns = []
    sorted_buffer = stdin_buffer

    if len(matched_patterns) != 0:
        for matched_groups in matched_patterns:
            sorted_patterns += matched_groups[0].splitlines(True)
            sorted_patterns += sorted(matched_groups[1].splitlines(True),
                                      key=prioritify)
            sorted_patterns += matched_groups[2].splitlines(True)

        sorted_buffer = ''.join(sorted_patterns)

    return sorted_buffer

if __name__ == '__main__':
    sorted_buffer = sort_properties(sys.stdin.read())

    if not isinstance(sorted_buffer, str):
        sys.stderr.write('Error')
        sys.exit(2)

    sys.stdout.write(sorted_buffer)
