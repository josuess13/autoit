#include<funcoes.au3>
#include<Logar.au3>

;Cenário: Venda a preço de venda
logar_dav()
venda(1313, 34699, 346990001, "15,00", "R$15,00", "Preço de Venda")
finalizar()

;Cenário: Venda a preço de custo
logar_dav()
venda(1313, 34701, 347010001, "10,00", "R$10,00", "Preço de Custo")
finalizar()
logar_dav()
venda(1313, 34703, 347030001, "15,00", "R$15,00", "Preço de Custo")
finalizar()

;Cenário: Venda a preço promocional
logar_dav()
venda(1313, 34702, 347020001, "13,00", "R$13,00", "Preço Promocional")
finalizar()
logar_dav()
venda(1313, 34703, 347030001, "15,00", "R$15,00", "Preço Promocional")
finalizar()

;Cenário: Venda a preço consignado
logar_dav()
venda(1313, 34700, 347000001, "12,00", "R$12,00", "Preço Consignado")
finalizar()
logar_dav()
venda(1313, 34703, 347030001, "15,00", "R$15,00", "Preço Consignado")
finalizar()

;Cenário: Venda a preço atacado
logar_dav()
venda_atacado(1313, 34704, 55501234, "11,00", "R$55,00", "Atacado")
finalizar()
logar_dav()
venda_atacado(1313, 34704, 55501234, "15,00", "R$75,00", "Configurado")
finalizar()

