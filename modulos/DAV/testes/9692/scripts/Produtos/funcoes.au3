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

Func venda($cliente =0, $produto = 0, $cod_prod = 0, $preco_esperado = "", $total_esperado_venda = "", $preco_produto_exporta = "")

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
; Inserindo Produto
	ControlClick($tela_venda, "", "TMyEdit16", "left", 1)
	ControlSend($tela_venda, "", "TMyEdit16", $produto)
	Send("{enter}")
	ControlClick($tela_venda, "", "TMyEdit15", "left", 1)
	ControlSend($tela_venda, "", "TMyEdit15", $cod_prod)
	Send("{enter}")
	ControlClick($tela_venda, "", "TMyEdit14", "left", 1)
	Send("{enter}")
	ControlClick($tela_venda, "", "TMyEdit10", "left", 1)
	Send("{enter}")
	Sleep(1000)
; Capturando preço produto
	$preco_produto = ControlGetText($tela_venda, "","TMyEdit10")
	If $preco_produto <> $preco_esperado Then
		_ScreenCapture_Capture($preco_produto_exporta & $produto & "(Erro_valor_diferente_esperado).png")
	EndIf
; Inserindo produto
	ControlClick($tela_venda, "Inserir Produto (F2)", "TJvXPButton3", "left", 1)
; Capturando valor total da venda
	$valor_total_venda = ControlGetText($tela_venda, "", "TPanel13")
	If $valor_total_venda <> $total_esperado_venda Then
		_ScreenCapture_Capture($preco_produto_exporta & $produto & "(Erro_valor_Total_diferente_esperado).png")
	EndIf
; Salvando arquivo de texto com os valores
	IniWrite($preco_produto_exporta&".txt", "Produto " & $preco_produto_exporta, "Produto " & $produto & "- Esperado item", $preco_esperado)
	IniWrite($preco_produto_exporta&".txt", "Produto " & $preco_produto_exporta, "Produto " & $produto & "- Carregado item", $preco_produto)
	IniWrite($preco_produto_exporta&".txt", "Produto " & $preco_produto_exporta, "Produto " & $produto & "- Esperado total", $total_esperado_venda)
	IniWrite($preco_produto_exporta&".txt", "Produto " & $preco_produto_exporta, "Produto " & $produto & "- Inserido total", $valor_total_venda)

EndFunc

Func venda_atacado($cliente =0, $produto = 0, $cod_embalagem = 0, $preco_esperado = "", $total_esperado_venda = "", $preco_embalagem = "")

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
; Inserindo produto
    ControlClick($tela_venda, "", "TMyEdit15", "left", 1)
	ControlSend($tela_venda, "", "TMyEdit15", $cod_embalagem)
	ControlClick($tela_venda, "", "TMyEdit15", "left", 1)
    Send("{enter}")
    Local $cpreco = "Confirmação de Preço"
    WinWaitActive($cpreco)
    If $preco_embalagem == "Configurado" Then
        ControlClick($cpreco, "", "TJvXPButton2", "left", 1)
    EndIf
    If $preco_embalagem == "Atacado" Then
        ControlClick($cpreco, "", "TJvXPButton1", "left", 1)
    EndIf
    WinWaitActive($tela_venda)
; Capturando preço produto
	$preco_produto = ControlGetText($tela_venda, "","TMyEdit10")
	If $preco_produto <> $preco_esperado Then
		_ScreenCapture_Capture("Atacado - " & $preco_embalagem & "(Erro_valor_diferente_esperado).png")
	EndIf
; Inserindo produto
	ControlClick($tela_venda, "Inserir Produto (F2)", "TJvXPButton3", "left", 1)
; Capturando valor total da venda
	$valor_total_venda = ControlGetText($tela_venda, "", "TPanel13")
	If $valor_total_venda <> $total_esperado_venda Then
		_ScreenCapture_Capture("Atacado - " & $preco_embalagem & "(Erro_valor_Total_diferente_esperado).png")
	EndIf
; Salvando arquivo de texto com os valores
	IniWrite("Atacado.txt", "Produto " & $preco_embalagem, "Produto " & $produto & "- Esperado item", $preco_esperado)
	IniWrite("Atacado.txt", "Produto " & $preco_embalagem, "Produto " & $produto & "- Carregado item", $preco_produto)
	IniWrite("Atacado.txt", "Produto " & $preco_embalagem, "Produto " & $produto & "- Esperado total", $total_esperado_venda)
	IniWrite("Atacado.txt", "Produto " & $preco_embalagem, "Produto " & $produto & "- Inserido total", $valor_total_venda)
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
