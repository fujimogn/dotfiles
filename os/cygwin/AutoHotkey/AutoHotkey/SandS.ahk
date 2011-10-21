; SandS.ahk
; via http://d.hatena.ne.jp/edvakf/20101027/1288168554

*Space::
  ; Alt + Space for Command Lancher
  If GetKeyState("Alt", "P"){
       SendInput !{Space}
       return
  }
  SendInput {RShift Down}
  If SandS_SpaceDown = 1
  {
    Return
  }
  SandS_SpaceDown := 1
  SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
  SandS_AnyKeyPressed := 0
  ; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
  Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause} 
  SandS_AnyKeyPressed := 1
  Return


*Space Up:: 
  SendInput {RShift Up}
  SandS_SpaceDown := 0
  If SandS_AnyKeyPressed = 0
  {
    If A_TickCount - SandS_SpaceDownTime < 200
    {
      SendInput {Space}
    }
    ; Send EndKey of the "Input" command above
    ; You must use Send here since SendInput is ignored by "Input"
    Send {RShift}
  }
  Return
