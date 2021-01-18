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
 
Func venda($preco_venda = "", $cliente =0, $produto = 0, $cod_prod = 0, $preco_esperado = "", $total_esperado_venda = "", $preco_produto_exporta = "", $tipo_venda = "",  $cod_balanca = 0)
    
    WinWaitActive($tela_dav)
    ControlClick($tela_dav, "", "TPanel1", "left", 1, 45, 32)
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
; Preço usado    
    WinWaitActive($tela_venda, "Sair (ESC)")
    Send("^p")
    Sleep(300)
    If $preco_venda = "Custo" Then
        Send("{Down}")
        Send("{ENTER}")
    endif
    If $preco_venda = "Venda" Then
        Send("{Down}")
        Send("{Down}")
        Send("{ENTER}")
    endif
    If $preco_venda = "Promocional" Then
        Send("{Down}")
        Send("{Down}")
        Send("{Down}")
        Send("{ENTER}")
    endif
    If $preco_venda = "Consignado" Then
        Send("{Down}")
        Send("{Down}")
        Send("{Down}")
        Send("{Down}")
        Send("{ENTER}")
    endif
    If $preco_venda = "Atacado" Then
        Send("{Down}")
        Send("{Down}")
        Send("{Down}")
        Send("{Down}")
        Send("{Down}")
        Send("{ENTER}")
    endif
    Sleep(300)
    If WinExists("Autenticação de Senha Administrativa") Then
        local $autenticacao = "Autenticação de Senha Administrativa"
	    WinWaitActive($autenticacao)
	    ControlClick($autenticacao, "", "TDBLookupComboBox1", "left", 1)
	    Send("{down}")
	    Send("{enter}")
	    ControlSend($autenticacao, "", "TMaskEdit1", "123")
        ControlClick($autenticacao, "", "TJvXPButton2", "left", 1)
    EndIf
    Sleep(500)

; Inserindo Produto
    If $tipo_venda == "normal" Then
	    ControlClick($tela_venda, "", "TMyEdit16", "left", 1)
	    ControlSend($tela_venda, "", "TMyEdit16", $produto)
	    Send("{enter}")
	    ControlClick($tela_venda, "", "TMyEdit15", "left", 1)
	    ControlSetText($tela_venda, "", "TMyEdit15", $cod_prod)
	    Send("{enter}")
	    ControlClick($tela_venda, "", "TMyEdit14", "left", 1)
	    ControlClick($tela_venda, "", "TMyEdit10", "left", 1)
        Sleep(1000)
    EndIf

;Inserindo produto balança
    If $tipo_venda == "balanca" Then
        ControlSetText($tela_venda, "", "TMyEdit15", $cod_balanca)
        ControlClick($tela_venda, "", "TMyEdit15", "left", 1)
        Send("{ENTER}")
        Sleep(2000)
    EndIf
; Capturando preço produto
	$preco_produto = ControlGetText($tela_venda, "","TMyEdit10")
	If $preco_produto <> $preco_esperado and $tipo_venda == "normal" Then
		_ScreenCapture_Capture($preco_venda & $produto & "(Erro_valor_diferente_esperado).png")
	EndIf
; Inserindo produto
    ControlClick($tela_venda, "Inserir Produto (F2)", "TJvXPButton3", "left", 1)
; Capturando valor total da venda
	$valor_total_venda = ControlGetText($tela_venda, "", "TPanel13")
	If $valor_total_venda <> $total_esperado_venda Then
		_ScreenCapture_Capture($preco_venda & $produto & "(Erro_valor_Total_diferente_esperado).png")
    EndIf
    If $tipo_venda == "balanca" Then
        _ScreenCapture_Capture($preco_venda & $cod_balanca & ".png")
    endif
; Salvando arquivo de texto com os valores
    If $tipo_venda == "normal" Then
	    IniWrite($preco_venda&".txt", "Produto Preço " & $preco_produto_exporta, "Produto " & $produto & "- Esperado item", $preco_esperado)
        IniWrite($preco_venda&".txt", "Produto Preço " & $preco_produto_exporta, "Produto " & $produto & "- Carregado item", $preco_produto)
    EndIf
	IniWrite($preco_venda&".txt", "Produto Preço " & $preco_produto_exporta, "Produto " & $produto & "- Esperado total", $total_esperado_venda)
	IniWrite($preco_venda&".txt", "Produto Preço " & $preco_produto_exporta, "Produto " & $produto & "- Inserido total", $valor_total_venda)

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

