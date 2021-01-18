#include<funcoes.au3>
#include<Logar.au3>

;$cliente =0, $produto = 0, $cod_prod = 0, $preco_esperado = "", $total_esperado_venda = "", $preco_cliente = "")
;Preço de venda
logar()
venda("Cliente F venda",1304, 34699,346990001, "15,00", "R$15,00", "Venda")
venda2("Cliente F venda",34700, 347000001, "12,00", "R$27,00", "Consignado")
venda2("Cliente F venda",34701, 347010001, "10,00", "R$37,00", "Custo")
venda2("Cliente F venda",34702, 347020001, "13,00", "R$50,00", "Promocional")
finalizar()
Sleep(3000)
;Preço de custo
logar()
venda("Cliente F Custo",1305, 34699, 346990001, "10,00", "R$10,00", "Venda")
venda2("Cliente F Custo",34703,347030001, "15,00", "R$25,00", "Venda sem preço")
finalizar()
Sleep(3000)
;Preço Promocional
logar()
venda("Cliente F promocional",1306, 34699, 346990001, "13,00", "R$13,00", "Venda")
venda2("Cliente F promocional",34703,347030001, "15,00", "R$28,00", "Venda sem preço")
finalizar()
Sleep(3000)
;Preço Consignado
logar()
venda("Cliente F consignado",1307, 34699, 346990001, "12,00", "R$12,00", "Venda")
venda2("Cliente F consignado",34703,347030001, "15,00", "R$27,00", "Venda sem preço")
finalizar()

MsgBox(0, "fim", "Verifique se foi fidelizado corretamente os valores para os clientes")
