#language: pt
Funcionalidade: Preço de cliente no Fácil DAV
No cadastro de clientes é possível alterar o preço ao qual será vendido para aquele cliente (venda, custo, promocional e consignado).
Ao configurar esse preço e realizar a venda no DAV o preço do produto deverá ser aquele conigurado no cadastro do cliente.

@preçoVenda
Cenário: Venda para cliente configurado para vender a preço de venda
    Dado que (cliente está configurado para vender a preço de venda) 
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente> sem escolher vender por convênio
    E insiro um produto <produto>
    Então será carregado o preço configurado para o produto exportar <preço>
    Exemplos: 
|    cliente    |Código C|       produto       |Código P|preço|
|cliente n venda|  1300  |   produto e venda   |  34699 |15,00|
|cliente n venda|  1300  | produto e consignado|  34700 |12,00|
|cliente n venda|  1300  |   produto e custo   |  34701 |10,00|
|cliente n venda|  1300  |produto e promocional|  34702 |13,00|

@preçoCusto
Cenário: Venda para cliente configurado para vender a preço de custo
    Dado que (cliente está configurado para vender a preço de custo)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente> sem escolher vender por convênio
    E insiro um produto <produto>
    Então será carregado o preço de custo do produto <preço>
    Mas se o preço de custo no cadastro do produto estiver igual a zero
    Então será carregado o preço de venda do produto
    Exemplos:
|    cliente    |Código C|       produto      |Código P|preço|
|cliente n custo|  1301  |   produto e venda  |  34699 |10,00|
|cliente n custo|  1301  |produto n sem preços|  34703 |15,00|
 
@preçoPromocional
Cenário: Venda para cliente conigurado para vender a preço promocional
    Dado que (cliente está configurado para vender a preço promocional)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente> sem escolher vender por convênio
    E insiro um produto <produto>
    Então será carregado o preço promocional do produto <preço>
    Mas se o preço promocional no cadastro do produto estiver igual a zero
    Então será carregado o preço de venda do produto
    Exemplos:
|       cliente       |Código C|       produto      |Código P|preço|
|cliente n promocional|  1302  |   produto e venda  |  34699 |13,00|
|cliente n promocional|  1302  |produto n sem preços|  34703 |15,00|

@preçoConsignado
Cenário: Venda para cliente conigurado para vender a preço consignado
    Dado que (cliente está configurado para vender a preço consignado)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente> sem escolher vender por convênio
    E insiro um produto <produto>
    Então será carregado o preço consignado do produto <preço>
    Mas se o preço consignado no cadastro do produto estiver igual a zero
    Então será carregado o preço de venda do produto
    Exemplos:
|       cliente      |Código C|       produto      |Código P|preço|
|cliente n consignado|  1303  |   produto e venda  |  34699 |12,00|
|cliente n consignado|  1303  |produto n sem preços|  34703 |15,00|
