#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Designcontest-Casino-Plum.ico
#AutoIt3Wrapper_Outfile_x64=StartMenuLayout.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Staff Start Menu layout
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.0
#AutoIt3Wrapper_Res_CompanyName=Carm0
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>

$File = 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\defaultlayouts.xml'
;FileWrite($File, 'Test')
_FileRename($File, 'defaultlayouts.xml.bak')
;If @error Then MsgBox(0, "Error", @error)
;FileDelete('C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\defaultlayouts.xml')
; https://www.autoitscript.com/wiki/Snippets_(_Files_%26_Folders_)#FileRename

If Not FileExists('C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml') Then
	DirCreate('C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\')
	FileInstall('DefaultLayouts.xml', 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml', 1) ; student start menu layout
ElseIf FileExists('C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml') Then
	$File = 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml'
	_FileRename($File, 'LayoutModification.xml.bak')
	FileInstall('DefaultLayouts.xml', 'C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml', 1) ; student start menu layout
EndIf

FileCreateShortcut("C:\Program Files\internet explorer\iexplore.exe",'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Internet Explorer.lnk'); this is done because placing the IR shortcut in the user profile and then referencing it in LayoutModification.xml if flaky as far as it showing up or not

; https://www.autoitscript.com/wiki/Snippets_(_Files_%26_Folders_)#FileRename
Func _FileRename($sFile, $sRename, $iOverWrite = 0)
	Local Const $FILENOTEXIST = 2
	If Not FileExists($sFile) Then Return SetError($FILENOTEXIST, 0, 0)
	Local $_StringLen = StringLen($sFile)
	Local $_StringInStr = StringInStr($sFile, "\", 0, -1, $_StringLen)
	Local $_Count = $_StringLen - $_StringInStr
	Local $_Dir = StringLeft($sFile, $_StringInStr)
	Local $_NewFile = $_Dir & $sRename
	Local $_NewFileExists = FileExists($_NewFile)
	Local $_FileMove = FileMove($sFile, $_NewFile, $iOverWrite)
	Return SetError(Not $_FileMove, $_NewFileExists, $_FileMove)
EndFunc   ;==>_FileRename
