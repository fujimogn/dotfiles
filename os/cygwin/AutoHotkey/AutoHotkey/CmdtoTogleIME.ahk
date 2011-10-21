; Cmd_to_ToggleIME.ahk
; Cmd (Win Key) to toggle IME mode.


LWin::
getIMEMode := IME_Get()
if (%getIMEMode% = 0) {
	IME_SET(1)
	return
}
else {
	IME_SET(0)
	return
}
LWin & LWin::return
+LWin::IME_SetConvMode(25,"A")


RWin::
getIMEMode := IME_Get()
if (%getIMEMode% = 0) {
	IME_SET(1)
	return
}
else {
	IME_SET(0)
	return
}
RWin & RWin::return
+RWin::IME_SetConvMode(25,"A")