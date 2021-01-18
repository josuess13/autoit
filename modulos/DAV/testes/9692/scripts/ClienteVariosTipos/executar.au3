#include<funcoes.au3>
#include<Logar.au3>

logar_retaguarda()
config_preco_total("Marcada")
;Cenário: Venda por balança para cliente preço de venda com convênio e que participa do programa fidelidade
logar_dav()
venda_dav(1309, 2034693012504, "RS11,25")
finalizar()
Sleep(3000)
;Cenário: Venda por balança para cliente preço de custo com convênio e que participa do programa fidelidade
logar_dav()
venda_dav(1310, 2034693012504, "RS11,25")
finalizar()
Sleep(3000)
;Cenário: Venda por balança para cliente preço promocional de custo com convênio e que participa do programa fidelidade
logar_dav()
venda_dav(1311, 2034693012504, "RS11,25")
finalizar()
Sleep(3000)
;Cenário: Venda por balança para cliente preço consignado de custo com convênio e que participa do programa fidelidade
logar_dav()
venda_dav(1312, 2034693012504, "RS11,25")
finalizar()

MsgBox(0, "Fim", "Verifique se o programa fidelidade está com os valores corretos")