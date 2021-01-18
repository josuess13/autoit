#include<funcoes.au3>
#include<Logar.au3>

logar_retaguarda()
config_preco_total("Preço")

;Cenário: Venda de balança preço de venda (preço)
logar_dav()
Venda_balanca(1313, 2034693012504,"R$12,50", "venda")
finalizar()

;Cenário: Venda de balança preço de custo (preço)
logar_dav()
Venda_balanca(1313, 2034696012504,"R$12,50", "custo")
finalizar()

;Cenário: Venda de balança preço promocional (preço)
logar_dav()
Venda_balanca(1313, 2034695012504,"R$12,50", "promocional")
finalizar()

;Cenário: Venda de balança preço consignado (preço)
logar_dav()
Venda_balanca(1313, 2034697012504,"R$12,50", "consignado")
finalizar()

logar_retaguarda()
config_preco_total("Peso")

;Cenário: Venda de balança preço de venda (Peso)
logar_dav()
Venda_balanca(1313, 2034693015004,"R$22,50", "venda")
finalizar()

;Cenário: Venda de balança preço de custo (Peso)
logar_dav()
Venda_balanca(1313, 2034696015004,"R$15,00", "custo")
finalizar()

;Cenário: Venda de balança preço promocional (Peso)
logar_dav()
Venda_balanca(1313, 2034695015004,"R$19,50", "promocional")
finalizar()

;Cenário: Venda de balança preço consignado (Peso)
logar_dav()
Venda_balanca(1313, 2034697015004,"R$18,00", "consignado")
finalizar()