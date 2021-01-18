#include<ScreenCapture.au3>
Global $tela_dav = "Sistema Fácil Retaguarda - Módulo DAV"
Global $tela_venda_dav = "Fácil Sistemas - Módulo de DAV"


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

Func venda_convenio($cliente = 0, $produto = 0, $cod_prod = 0, $preco_esperado = 0, $desconto_esperado =0, $preco_esperado_total = 0, $preco_cliente = 0, $nome_produto = 0)

    WinWaitActive($tela_dav)
    ControlClick($tela_dav, "", "TPanel1", "left", 1, 45, 30)
    WinWaitActive($tela_venda_dav, "Sair (ESC)")
    ; Inserindo cliente
    ControlSetText($tela_venda_dav, "", "TMyEdit3", $cliente)
	ControlClick($tela_venda_dav, "", "TMyEdit3", "left", 1)
    Send("{Enter}")
    Sleep(500)
    If WinExists ("Confirmação") Then
		senha_adm()
		WinWaitActive($tela_venda_dav)
    EndIf
    WinWaitActive("Informação!")
    ControlClick("Informação!", "Sim", "TJvXPButton2", "left", 1)
    Sleep(500)
    ; Inserindo produto
	ControlClick($tela_venda_dav, "", "TMyEdit16", "left", 1)
	ControlSend($tela_venda_dav, "", "TMyEdit16", $produto)
	;Send("{enter}")
	ControlClick($tela_venda_dav, "", "TMyEdit15", "left", 1)
	ControlSend($tela_venda_dav, "", "TMyEdit15", $cod_prod)
	ControlClick($tela_venda_dav, "", "TMyEdit15", "left", 1)
	Send("{enter}")
	Sleep(1000)
; Capturando preço produto
    $caminhoImagens = "imagens/"
    $preco_produto = ControlGetText($tela_venda_dav, "","TMyEdit10")
    If $preco_produto <> $preco_esperado Then
		_ScreenCapture_Capture($caminhoImagens & $produto & "- Cliente" & $cliente & "(Erro_valor_diferente_esperado).png")
	EndIf
; Capturando desconto
    $desconto = ControlGetText($tela_venda_dav, "","TMyEdit8")
    If $desconto_esperado <> $desconto Then
        _ScreenCapture_Capture($caminhoImagens & $produto & "- Cliente" & $cliente & "(Erro_valor_desconto_diferente_esperado).png")
    EndIf
; Inserindo produto
	ControlClick($tela_venda_dav, "Inserir Produto (F2)", "TJvXPButton3", "left", 1)
; Capturando valor total da venda
	$valor_total_venda = ControlGetText($tela_venda_dav, "", "TPanel13")
	If $valor_total_venda <> $preco_esperado_total Then
		_ScreenCapture_Capture($caminhoImagens & $produto & $preco_cliente &"(Erro_valor_Total_diferente_esperado).png")
    EndIf
; Salvando arquivo de texto com os valores
    ;preço item
	IniWrite($preco_cliente & ".txt", "Produto Preço " & $nome_produto, "Produto " & $produto & "- Esperado item", $preco_esperado)
    IniWrite($preco_cliente & ".txt", "Produto Preço " & $nome_produto, "Produto " & $produto & "- Carregado item", $preco_produto)
    ;preço desconto
    IniWrite($preco_cliente & ".txt", "Produto Preço " & $nome_produto, "Produto " & $produto & "- Esperado desconto", $desconto_esperado)
    IniWrite($preco_cliente & ".txt", "Produto Preço " & $nome_produto, "Produto " & $produto & "- Carregado desconto", $desconto)
    ;preço venda
	IniWrite($preco_cliente & ".txt", "Produto Preço " & $nome_produto, "Produto " & $produto & "- Esperado total", $preco_esperado_total)
	IniWrite($preco_cliente & ".txt", "Produto Preço " & $nome_produto, "Produto " & $produto & "- Inserido total", $valor_total_venda)

EndFunc

Func venda_atacado($cliente = 0, $cod_embalagem = 0, $preco_embalagem = 0, $preco_esperado = 0, $preco_esperado_total = 0)

    WinWaitActive($tela_dav)
    ControlClick($tela_dav, "", "TPanel1", "left", 1, 45, 30)
    WinWaitActive($tela_venda_dav, "Sair (ESC)")
    ; Inserindo cliente
    ControlSetText($tela_venda_dav, "", "TMyEdit3", $cliente)
	ControlClick($tela_venda_dav, "", "TMyEdit3", "left", 1)
    Send("{Enter}")
    Sleep(500)
    If WinExists ("Confirmação") Then
		senha_adm()
		WinWaitActive($tela_venda_dav)
    EndIf
    WinWaitActive("Informação!")
    ControlClick("Informação!", "Sim", "TJvXPButton2", "left", 1)
    Sleep(500)
    ; Inserindo Produto
    ControlClick($tela_venda_dav, "", "TMyEdit15", "left", 1)
	ControlSend($tela_venda_dav, "", "TMyEdit15", $cod_embalagem)
	ControlClick($tela_venda_dav, "", "TMyEdit15", "left", 1)
    Send("{enter}")
    Local $cpreco = "Confirmação de Preço"
    WinWaitActive($cpreco)
    If $preco_embalagem == "Configurado" Then
        ControlClick($cpreco, "", "TJvXPButton2", "left", 1)
    EndIf
    If $preco_embalagem == "Atacado" Then
        ControlClick($cpreco, "", "TJvXPButton1", "left", 1)
    EndIf
    WinWaitActive($tela_venda_dav)
;Capturando preço produto
    $caminhoImagens = "imagens/"
    $preco_produto = ControlGetText($tela_venda_dav, "","TMyEdit10")
    If $preco_produto <> $preco_esperado Then
		_ScreenCapture_Capture($caminhoImagens & $cod_embalagem & "- Cliente" & $cliente & "(Erro_valor_diferente_esperado).png")
    EndIf
; Inserindo produto
	ControlClick($tela_venda_dav, "Inserir Produto (F2)", "TJvXPButton3", "left", 1)
; Capturando valor total da venda
	$valor_total_venda = ControlGetText($tela_venda_dav, "", "TPanel13")
	If $valor_total_venda <> $preco_esperado_total Then
		_ScreenCapture_Capture($caminhoImagens & $cod_embalagem & $preco_embalagem &"(Erro_valor_Total_diferente_esperado).png")
    EndIf
; Salvando arquivo de texto com os valores
    ;preço item
	IniWrite("Balança.txt", "Produto Preço " & $preco_embalagem, "Produto " & $cod_embalagem & "- Esperado item", $preco_esperado)
    IniWrite("Balança.txt", "Produto Preço " & $preco_embalagem, "Produto " & $cod_embalagem & "- Carregado item", $preco_produto)
    ;preço venda
	IniWrite("Balança.txt", "Produto Preço " & $preco_embalagem, "Produto " & $cod_embalagem & "- Esperado total", $preco_esperado_total)
	IniWrite("Balança.txt", "Produto Preço " & $preco_embalagem, "Produto " & $cod_embalagem & "- Inserido total", $valor_total_venda)

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