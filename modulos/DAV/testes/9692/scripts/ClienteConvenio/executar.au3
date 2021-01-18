#include<Logar.au3>
#include<funcoes.au3>

;Cenário: Venda com convênio para cliente preço de venda
logar_dav()
venda_convenio(1314, 34699, 346990001, "15,00", "1,50", "R$13,50", "Preço de Venda", "produto e venda")
finalizar()
Sleep(3000)

logar_dav()
venda_convenio(1314, 34700, 347000001, "12,00", "1,20", "R$10,80", "Preço de Venda", "produto e consignado")
finalizar()
Sleep(3000)

logar_dav()
venda_convenio(1314, 34701, 347010001, "10,00", "1,00", "R$9,00", "Preço de Venda", "produto e custo")
finalizar()
Sleep(3000)

logar_dav()
venda_convenio(1314, 34702, 347020001, "13,00", "1,30", "R$11,70", "Preço de Venda", "produto e promocional")
finalizar()
Sleep(3000)

; Cenário: Venda com convênio para cliente preço de custo
logar_dav()
venda_convenio(1315, 34699, 346990001, "10,00", "1,00", "R$9,00", "Preço de Custo", "produto e venda")
finalizar()
Sleep(3000)

logar_dav()
venda_convenio(1315, 34703, 347030001, "15,00", "1,50", "R$13,50", "Preço de Custo", "produto n sem preço")
finalizar()
Sleep(3000)

;Cenário: Venda com convênio para cliente preço promocional
logar_dav()
venda_convenio(1316, 34699, 346990001, "13,00", "1,30", "R$11,70", "Preço promocional", "produto e venda")
finalizar()
Sleep(3000)

logar_dav()
venda_convenio(1316, 34703, 347030001, "15,00", "1,50", "R$13,50", "Preço promocional", "produto n sem preço")
finalizar()
Sleep(3000)

; Cenário: Venda com convênio para cliente preço consignado
logar_dav()
venda_convenio(1316, 34699, 346990001, "12,00", "1,20", "R$10,80", "Preço Consignado", "produto e venda")
finalizar()
Sleep(3000)

logar_dav()
venda_convenio(1316, 34703, 347030001, "15,00", "1,50", "R$13,50", "Preço Consignado", "produto n sem preço")
finalizar()
Sleep(3000)

;Cenário: Venda com convênio produto atacado
logar_dav()
venda_atacado(1308, 55501234, "Configurado", "15,00", "R$67,50")
finalizar()
Sleep(3000)

logar_dav()
venda_atacado(1308, 55501234, "Atacado", "11,00", "R$49,50")
finalizar()
Sleep(3000)