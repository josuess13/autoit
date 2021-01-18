;Função Logar no Fácil DAV

;Caminho do executável na pasta configurada do Retaguarda
Global $exe = "C:\Facil\Retaguarda\Facil DAV.exe"

Global $tela_login = "Fácil DAV"
Global $login = "TESTE"
Global $senha = 123

Func logar_dav()

	Run($exe)
	WinWaitActive($tela_login, "Login")
	ControlSetText($tela_login, "", "Edit1", $login)
	ControlSetText($tela_login, "", "TEdit1", $senha)
	ControlClick($tela_login, "Login", "TJvXPButton1", "left", 1)

EndFunc
