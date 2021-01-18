#include<ScreenCapture.au3>

#include<ScreenCapture.au3>
Global $tela_retaguarda = "Sistema Fácil Retaguarda - Versão: 5.10.1.0  - Build: 5.10.1.30"
Global $tela_configuracoes = "Configurações"
Global $tela_dav = "Sistema Fácil Retaguarda - Módulo DAV - Versão: 5.10.1.0 - Build: 5.10.1.11 comp. 12.01.2021"
Global $tela_venda_dav = "Fácil Sistemas - Módulo de DAV"
Global $config = ""
Func confirmacao($opcao = "")
    Local $conf = "Confirmação!"
    WinWaitActive($conf)
    If $opcao == "Sim" Then 
        ControlClick($conf, "Sim", "TJvXPButton2", "left", 1) 
    EndIf
    If $opcao == "Não" Then 
        ControlClick($conf, "Não", "TJvXPButton1", "left", 1) 
    EndIf
EndFunc

Func senha_adm()
	WinWaitActive("Confirmação")
	ControlClick("Confirmação","SIM", "TButton3", "left", 1)
	local $autenticacao = "Autenticação de Senha Administrativa"
	WinWaitActive($autenticacao)
	ControlClick($autenticacao, "", "TDBLookupComboBox1", "left", 1)
	Send("{down}")
	Send("{enter}")
	ControlSend($autenticacao, "", "TMaskEdit1", "123")
	ControlClick($autenticacao, "", "TJvXPButton2", "left", 1)
EndFunc

Func config_preco_total($flag = "")
    
    WinWaitActive($tela_retaguarda)
    MouseClick("left", 700, 40)
    MouseClick("left", 737, 103)
    WinWaitActive($tela_configuracoes)
    ControlClick($tela_configuracoes, "", "TPageControl1", "left", 1, 567, 12)
    WinWaitActive($tela_configuracoes, "Criar Arquivo de Conexão")
    ControlClick($tela_configuracoes, "", "TPageControl2", "left", 1, 178, 11)
    WinWaitActive($tela_configuracoes, "Configurações do Código de Barras da Balança")
    If $flag == "Marcada" Then
        ControlCommand($tela_configuracoes, "", "TCheckBox1", "Check")
        $config = "Marcada"
    EndIf
    If $flag == "Desmarcada" Then
        ControlCommand($tela_configuracoes, "", "TCheckBox1", "UnCheck")
        $config = "Desmarcada"
    EndIf
    ControlClick($tela_configuracoes, "", "TJvXPButton2", "left", 1)
    confirmacao("Sim")
    WinWaitActive("Informação!")
    ControlClick("Informação!", "", "TJvXPButton1", "left", 1)
    WinWaitActive($tela_configuracoes)
    ControlClick($tela_configuracoes, "", "TJvXPButton1", "left", 1)
    confirmacao("Sim")
    WinWaitActive($tela_retaguarda)
    Send("{ESC}")
    confirmacao("Sim")

EndFunc

Func Venda_dav($cliente = 0, $cod_balanca = 0, $total_esperado_venda = "")
    
    WinWaitActive($tela_dav)
    ControlClick($tela_dav, "", "TPanel1", "left", 1, 44, 29)
    WinWaitActive($tela_venda_dav, "Sair (ESC)")
    ; Inserindo cliente
	ControlSetText($tela_venda_dav, "", "TMyEdit3", $cliente)
	ControlClick($tela_venda_dav, "", "TMyEdit3", "left", 1)
	Send("{Enter}")
	Sleep(500)
	If WinExists ("Confirmação") Then
		senha_adm()
		WinWaitActive($tela_venda_dav)
		Sleep(500)
    EndIf
    WinWaitActive("Informação!")
    ControlClick("Informação!", "Sim", "TJvXPButton2", "left", 1)
    Sleep(500)
    ;inserindo produto codigo balança
    ControlSetText($tela_venda_dav, "", "TMyEdit16", $cod_balanca)
    ControlClick($tela_venda_dav, "", "TMyEdit16", "left", 1)
    Send("{ENTER}")
    Sleep(2000)
    ;Capturando o valor total da venda
    $valor_total_venda = ControlGetText($tela_venda_dav, "", "TPanel13")
	If $valor_total_venda <> $total_esperado_venda Then
		_ScreenCapture_Capture($config &"-"& $cliente & " - (Erro_valor_Total_diferente_esperado).png")
    EndIf
    IniWrite("ClienteBalanca"& $config & ".txt","Cliente " & $cliente, "Esperado:" & $total_esperado_venda & " ", " Resultado:" & $valor_total_venda)
    

EndFunc

Func finalizar()

	Sleep(2000)
	WinWaitActive($tela_venda_dav, "Sair (ESC)")
	ControlClick($tela_venda_dav, "Finalizar", "TBitBtn2", "left", 1)
	WinWaitActive($tela_venda_dav, "F2 - Dinheiro")
	ControlClick($tela_venda_dav, "F2 - Dinheiro", "TBitBtn12", "left", 1)
	WinWaitActive("Titulos - Valor Recebido", "OK")
	ControlClick("Titulos - Valor Recebido", "OK", "TButton2", "left", 1)
	WinWaitActive($tela_venda_dav, "Confirmar")
	ControlClick($tela_venda_dav, "Confirmar", "TBitBtn9", "left", 1)
	confirmacao("Sim")
	confirmacao("Não")
	WinWaitActive($tela_venda_dav, "Sair (ESC)")
	ControlClick($tela_venda_dav, "Sair (ESC)", "TBitBtn1", "left", 1)
	confirmacao("Sim")
	WinWaitActive($tela_dav)
	Send("{esc}")
    confirmacao("Sim")
    
EndFunc