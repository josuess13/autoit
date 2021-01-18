#language: pt
Funcionalidade: preços exportados pelos produtos 
Ao cadastrar ou editar um produto no retaguarda é possível configurar qual o preço aquele produto exporta, dessa forma, ao realizar uma venda
será usado como base o preço exportado pelo produto caso o preço configurado no cadastro do cliente esteja como preço de venda.

@preçoVenda
Cenário: Venda a preço de venda
    Dado que produto exporta o preço de venda
    Quando abro o DAV
    E insiro cliente <cliente>
    E insiro produto <produto>
    Então deverá carregar o preço de venda do produto <Preço>
    Exemplos:
|    Cliente   |Código C|    Produto    |Código P|Preço|
|cliente normal|  1313  |produto e venda|  34699 |15,00|

@preçoCusto
Cenário: Venda a preço de custo
    Dado que produto exporta o preço de custo
    Quando abro o DAV
    E insiro cliente <cliente>
    E insiro produto <produto>
    Então deverá carregar o preço de custo do produto <Preço>
    Mas caso o preço de custo do produto esteja vazio
    Então deverá ser carregado o preço de venda
    Exemplos:
|    Cliente   |Código C|      Produto      |Código P|Preço|
|cliente normal|  1313  |  produto e custo  |  34701 |10,00|
|cliente normal|  1313  |produto n sem preço|  34703 |15,00|

@preçoPromocional
Cenário: Venda a preço promocional
    Dado que produto exporta o preço promocional
    Quando abro o DAV
    E insiro cliente <cliente>
    E insiro produto <produto>
    Então deverá carregar o preço promocional do produto <Preço>
    Mas caso o preço promocional do produto esteja vazio
    Então deverá ser carregado o preço de venda
    Exemplos:
|    Cliente   |Código C|       Produto       |Código P|Preço|
|cliente normal|  1313  |produto e promocional|  34702 |13,00|
|cliente normal|  1313  | produto n sem preço |  34703 |15,00|

@preçoConsignado
Cenário: Venda a preço consignado
    Dado que produto exporta o preço consignado
    Quando abro o DAV
    E insiro cliente <cliente>
    E insiro produto <produto>
    Então deverá carregar o preço consignado do produto <Preço>
    Mas caso o preço consignado do produto esteja vazio
    Então deverá ser carregado o preço de venda
    Exemplos:
|    Cliente   |Código C|       Produto      |Código P|Preço|
|cliente normal|  1313  |produto e consignado|  34700 |12,00|
|cliente normal|  1313  | produto n sem preço|  34703 |15,00|

@preçoAtacado
Cenário: Venda a preço atacado
    Dado que produto está configurado para vender como atacado
    Quando abro o DAV
    E insiro cliente <cliente>
    E insiro produto <Código embalagem>
    Então deverá carregar o preço <Preço> e a quantidade de atacado <quantidade>
    Exemplos:
|    cliente   |Código C|     Produto     |Código embalagem|preço|quantidade|
|cliente normal|  1313  |Produto embalagem|    55501234    |11,00|     5    |
 