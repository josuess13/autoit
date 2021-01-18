#include<funcoes.au3>
#include<Logar.au3>

;Cenário: Venda de Kit produto exporta preço
logar_dav()
venda(1313, 34705, 347050001, "R$67,50", "1 - Normal", "Não")
finalizar()
;Cenário: Venda de Kit cliente preço configurado
logar_dav()
venda(1302, 34705, 347050001, "R$67,50", "2 - Preço Cliente", "Não")
finalizar()
;Cenário: Venda de Kit preço alterado no DAV
logar_dav()
venda(1313, 34705, 347050001, "R$67,50", "3 - Preço DAV", "Sim")
finalizar()
