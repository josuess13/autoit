;Logar no Fácil DAV

Global $exe = "C:\Facil\Retaguarda\Facil DAV.exe"
Global $exe_retaguarda = "C:\Facil\Retaguarda\Retaguarda.exe"
Global $tela_login = "Fácil DAV"
Global $tela_login_retaguarda = "Fácil Retaguarda"
Global $login = "TESTE"
Global $senha = 123

Func logar_dav()

	Run($exe)
	WinWaitActive($tela_login, "Login")
	ControlSetText($tela_login, "", "Edit1", $login)
	ControlSetText($tela_login, "", "TEdit1", $senha)
	ControlClick($tela_login, "Login", "TJvXPButton1", "left", 1)

EndFunc

Func logar_retaguarda()

	Run($exe_retaguarda)
	WinWaitActive($tela_login_retaguarda)
	ControlSetText($tela_login_retaguarda, "", "Edit1", $login)
	ControlSetText($tela_login_retaguarda, "", "TEdit1", $senha)
	ControlClick($tela_login_retaguarda, "Login", "TJvXPButton1", "left", 1)
EndFunc