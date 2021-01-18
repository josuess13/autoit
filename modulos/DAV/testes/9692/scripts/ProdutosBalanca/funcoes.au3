#include<ScreenCapture.au3>
#include<ScreenCapture.au3>
Global $tela_retaguarda = "Sistema Fácil Retaguarda"
Global $tela_configuracoes = "Configurações"
Global $tela_dav = "Sistema Fácil Retaguarda - Módulo DAV"
Global $tela_venda = "Fácil Sistemas - Módulo de DAV"
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

Func config_preco_total($flag = "")
    
    WinWaitActive($tela_retaguarda)
    MouseClick("left", 700, 40)
    MouseClick("left", 737, 103)
    WinWaitActive($tela_configuracoes)
    ControlClick($tela_configuracoes, "", "TPageControl1", "left", 1, 567, 12)
    WinWaitActive($tela_configuracoes, "Criar Arquivo de Conexão")
    ControlClick($tela_configuracoes, "", "TPageControl2", "left", 1, 178, 11)
    WinWaitActive($tela_configuracoes, "Configurações do Código de Barras da Balança")
    If $flag == "Preço" Then
        ControlCommand($tela_configuracoes, "", "TCheckBox1", "Check")
        $config = "Preço"
    EndIf
    If $flag == "Peso" Then
        ControlCommand($tela_configuracoes, "", "TCheckBox1", "UnCheck")
        $config = "Peso"
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

Func Venda_balanca($cliente = 0, $cod_balanca = 0, $total_esperado_venda = "", $preco = "")
    
    WinWaitActive($tela_dav)
    ControlClick($tela_dav, "", "TPanel1", "left", 1, 44, 29)
    WinWaitActive($tela_venda, "Sair (ESC)")
    ; Inserindo cliente
	ControlSetText($tela_venda, "", "TMyEdit3", $cliente)
	ControlClick($tela_venda, "", "TMyEdit3", "left", 1)
	Send("{Enter}")
	Sleep(500)
	If WinExists ("Confirmação") Then
		senha_adm()
		WinWaitActive($tela_venda)
		Sleep(500)
    EndIf
    ;inserindo produto codigo balança
    ControlSetText($tela_venda, "", "TMyEdit15", $cod_balanca)
    ControlClick($tela_venda, "", "TMyEdit15", "left", 1)
    Send("{ENTER}")
    Sleep(2000)
    ;Capturando o valor total da venda
    $valor_total_venda = ControlGetText($tela_venda, "", "TPanel13")
	If $valor_total_venda <> $total_esperado_venda Then
		_ScreenCapture_Capture($config & $preco & " (Erro_valor_Total_diferente_esperado).png")
    EndIf
    _ScreenCapture_Capture($config & $preco & ".png")
    IniWrite("ProdutosBalanca"& $config & ".txt", $preco , "Esperado:" & $total_esperado_venda & " ", " Resultado:" & $valor_total_venda)
    

EndFunc

Func finalizar()

	Sleep(2000)
	WinWaitActive($tela_venda, "Sair (ESC)")
	ControlClick($tela_venda, "Finalizar", "TBitBtn2", "left", 1)
	WinWaitActive($tela_venda, "F2 - Dinheiro")
	ControlClick($tela_venda, "F2 - Dinheiro", "TBitBtn12", "left", 1)
	WinWaitActive("Titulos - Valor Recebido", "OK")
	ControlClick("Titulos - Valor Recebido", "OK", "TButton2", "left", 1)
	WinWaitActive($tela_venda, "Confirmar")
	ControlClick($tela_venda, "Confirmar", "TBitBtn9", "left", 1)
	confirmacao("Sim")
	confirmacao("Não")
	WinWaitActive($tela_venda, "Sair (ESC)")
	ControlClick($tela_venda, "Sair (ESC)", "TBitBtn1", "left", 1)
	confirmacao("Sim")
	WinWaitActive($tela_dav)
	Send("{esc}")
    confirmacao("Sim")

EndFunc
