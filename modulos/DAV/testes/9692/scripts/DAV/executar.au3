#include<Logar.au3>
#include<funcoes.au3>

logar_retaguarda()
config_preco_total("Marcada")

; Venda("Tipo de preço usado no DAV", "Cliente", "Código produto", "Código de barras do produto", "Valor esperado do item na venda", "Valor esperado no total da venda", "Nome do produto", "Tipo de venda: normal ou de balança", "Código de balança")

; Cenário: vender a preço normal
logar_dav()
venda("Normal",1313, 34701, 347010001, "10,00", "R$10,00", "produto e custo", "normal", 0)
finalizar()

logar_dav()
venda("Normal",1301, 34699, 346990001, "10,00", "R$10,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Normal",1301, 34696, 346960001, "12,50", "R$12,50", "produto b custo", "balanca", 2034696012504)
finalizar()

;Cenário: vender a preço de venda
logar_dav()
venda("Venda",1313, 34701, 347010001, "15,00", "R$15,00", "produto e custo", "normal", 0)
finalizar()

logar_dav()
venda("Venda",1301, 34699, 346990001, "15,00", "R$15,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Venda",1301, 34696, 346960001, "12,50", "R$12,50", "produto b custo", "balanca", 2034696012504)
finalizar()

;Cenário: vender a preço de custo
logar_dav()
venda("Custo",1313, 34699, 346990001, "10,00", "R$10,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Custo",1302, 34699, 346990001, "10,00", "R$10,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Custo",1301, 34697, 346970001, "12,50", "R$12,50", "produto b consignado", "balanca", 2034697012504)
finalizar()

;Cenário: vender a preço promocional
logar_dav()
venda("Promocional",1313, 34699, 346990001, "13,00", "R$13,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Promocional",1301, 34699, 346990001, "13,00", "R$13,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Promocional",1301, 34697, 346970001, "12,50", "R$12,50", "produto b consignado", "balanca", 2034697012504)
finalizar()

;Cenário: vender a preço consignado
logar_dav()
venda("Consignado",1313, 34699, 346990001, "12,00", "R$12,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Consignado",1301, 34699, 346990001, "12,00", "R$12,00", "produto e venda", "normal", 0)
finalizar()

logar_dav()
venda("Consignado",1301, 34696, 346960001, "12,50", "R$12,50", "produto b custo", "balanca", 2034696012504)
finalizar()

;Cenário: vender a preço de atacado
logar_dav()
venda("Atacado",1313, 34704, 347040001, "11,00", "R$11,00", "produto embalagem", "normal", 0)
finalizar()

logar_dav()
venda("Atacado",1301, 34696, 346960001, "12,50", "R$12,50", "produto b custo", "balanca", 2034696012504)
finalizar()

