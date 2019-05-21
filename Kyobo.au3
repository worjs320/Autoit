#NoTrayIcon
#AutoIt3Wrapper_Change2CUI=y
#include <Array.au3>
#include <IE.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>
;Kyobo('APPM_WEB','-','192.168.2.78','http://www.kyobobook.co.kr/login/login.laf?Kc=GNHHNOlogin&orderClick=c03&retURL=http%3A//www.kyobobook.co.kr/index.laf%3FOV_REFFER%3Dhttps%3A//www.google.com/','8443','worjs320','dkssud!23','-','yes','yes','-')

$count =0
$accountid = "worjs320"
$password = "dkssud!23"

ShellExecute(@ProgramFilesDir & "\internet explorer\iexplore.exe","http://www.kyobobook.co.kr/login/login.laf?Kc=GNHHNOlogin&orderClick=c03&retURL=http%3A//www.kyobobook.co.kr/index.laf%3FOV_REFFER%3Dhttps%3A//www.google.com/", @SW_HIDE)

Func GetTitle($titlename)

	Local $count = 0

	while 1
	  $sTitle = WinGetTitle("[active]")
	  if $sTitle = $titlename Then
		 ExitLoop
	  EndIf
	  Sleep(10)
	  if $count > 6000 Then
		 MsgBox($MB_SYSTEMMODAL, "Form Info", $count)
		 Exit(-1)
	  Else
		 $count = $count + 1
	  EndIf
	WEnd

	Global $oIE = _IEAttach("", "embedded") ;브라우저에 연결

	_IELoadWait($oIE) ;브라우저가 로드될때까지 기다림

	Return $oIE
EndFunc

GetTitle("로그인 - 인터넷교보문고 - Internet Explorer")

;$oForm = _IEFormGetObjByName($oIE,"loginForm")

;Local $oUsername = _IEFormElementGetObjByName($oForm, "memid")
;Local $oPassword = _IEFormElementGetObjByName($oForm, "pw")

;_IEFormElementSetValue($oUsername, $accountid)
;_IEFormElementSetValue($oPassword, $password)

;$tags = $oIE.document.GetElementsByTagName("input")
;For $tag in $tags
;   $class_value = $tag.GetAttribute("type")
;   ;MsgBox($MB_SYSTEMMODAL, "Form Info", $class_value)
;   If $class_value = "submit" Then
;	 $tag.click()
;   EndIf
;Next

;로그인까지 완료

;GetTitle("꿈을 키우는 세상 - 인터넷교보문고 - Internet Explorer")

;$tags = $oIE.document.GetElementsByTagName("a")
;For $tag in $tags
;   $class_value = $tag.GetAttribute("href")
;   ;MsgBox($MB_SYSTEMMODAL, "Form Info", $class_value)
;   If $class_value = "http://www.kyobobook.co.kr/event/dailyCheckSpci.laf?orderClick=c1j" Then;
;	 $tag.click()
;   EndIf
;Next

GetTitle("출석체크 x 문장수집 - 인터넷교보문고 - Internet Explorer")

$tags = $oIE.document.GetElementsByTagName("a")
For $tag in $tags
   $class_value = $tag.GetAttribute("href")

   If $class_value = "/killingpart/myRecords.laf?gb=" Then
	   MsgBox($MB_SYSTEMMODAL, "Form Info", $class_value)
	 $tag.click()
   EndIf
Next










































