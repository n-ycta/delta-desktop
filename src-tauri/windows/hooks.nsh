!macro NSIS_HOOK_POSTINSTALL
  WriteRegStr HKCU "Software\Classes\delta" "" "Delta pairing"
  WriteRegStr HKCU "Software\Classes\delta" "URL Protocol" ""
  WriteRegStr HKCU "Software\Classes\delta\shell\open\command" "" '"$INSTDIR\Delta Desktop.exe" "%1"'
!macroend
!macro NSIS_HOOK_PREUNINSTALL
  ReadRegStr $0 HKCU "Software\Classes\delta\shell\open\command" ""
  StrCmp $0 '"$INSTDIR\Delta Desktop.exe" "%1"' 0 +2
  DeleteRegKey HKCU "Software\Classes\delta"
!macroend
