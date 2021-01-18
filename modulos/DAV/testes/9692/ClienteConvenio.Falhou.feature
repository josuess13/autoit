#language: pt
Funcionalidade: Venda no DAV para cliente conveniado
No cadastro do cliente é possível selecionar um convênio para aquele cliente.
Ao inserir esse cliente na venda no DAV é possível vender o produto com o desconto do convênio

@preçoVenda
Cenário: Venda com convênio para cliente preço de venda
    Dado que (cliente está configurado para vender a preço de venda)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E escolho vender no convênio
    E insiro um produto <produto>
    Então será carregado o preço configurado para o produto exportar <preço>
    E será dado o desconto correspondente ao perentual do convênio
    Exemplos: 
|     cliente    |Código C|       produto       |Código P|Código Barras|preço|Desconto|Total|
|cliente convenio|  1314  |   produto e venda   |  34699 |  346990001  |15,00|  1,50  |13,50|
|cliente convenio|  1314  | produto e consignado|  34700 |  347000001  |12,00|  1,20  |10,80| # carregando preço de venda
|cliente convenio|  1314  |   produto e custo   |  34701 |  347010001  |10,00|  1,00  | 9,00| # Carrega preço de cuto mas não dá desconto
|cliente convenio|  1314  |produto e promocional|  34702 |  347020001  |13,00|  1,30  |11,70| # carregando preço de venda|

@preçoCusto
Cenário: Venda com convênio para cliente preço de custo
    Dado que (cliente está configurado para vender a preço de custo)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente> 
    E escolho vender no convênio
    E insiro um produto <produto> 
    Então será dado o desconto correspondente ao perentual do convênio em cima do preço de custo do produto <preço>
    Mas caso o produto não tenha preço de custo
    Então será dado o desconto correspondente ao perentual do convênio em cima do preço de venda do produto
    Exemplos:
|        cliente       |Código C|      produto      |Código P|Código Barras|preço|Desconto|Total|
|cliente custo convenio|  1315  |  produto e venda  |  34699 |  346990001  |10,00|  1,00  | 9,00| # Carrega preço de cuto mas não dá desconto
|cliente custo convenio|  1315  |produto n sem preço|  34703 |  347030001  |15,00|  1,50  |13,50| # Carrega preço de venda mas não dá desconto|

@preçoPromocional
Cenário: Venda com convênio para cliente preço promocional
    Dado que (cliente está configurado para vender a preço promocional)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E escolho vender no convênio
    E insiro um produto <produto>
    Então será dado o desconto correspondente ao perentual do convênio em cima do preço promocional do produto <preço>
    Mas caso o produto não tenha preço promocional
    Então será dado o desconto correspondente ao perentual do convênio em cima do preço de venda do produto
    Exemplos:
|           cliente          |Código C|      produto      |Código P|Código Barras|preço|Desconto|Total|
|cliente promocional convenio|  1316  |  produto e venda  |  34699 |  346990001  |13,00|  1,30  |11,70| # carrega preço de venda
|cliente promocional convenio|  1316  |produto n sem preço|  34703 |  347030001  |15,00|  1,50  |13,50|

@preçoConsignado
Cenário: Venda com convênio para cliente preço consignado
    Dado que (cliente está configurado para vender a preço consignado)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E escolho vender no convênio
    E insiro um produto <produto>
    Então será dado o desconto correspondente ao perentual do convênio em cima do preço consignado do produto <preço>
    Mas caso o produto não tenha preço consignado
    Então será dado o desconto correspondente ao perentual do convênio em cima do preço de venda do produto
    Exemplos:
|          cliente          |Código C|      produto      |Código P|Código barras|preço|Desconto|Preço|
|cliente consignado convenio|  1317  |  produto e venda  |  34699 |  346990001  |12,00|  1,20  |10,80| # carrega preço de venda
|cliente consignado convenio|  1317  |produto n sem preço|  34703 |  347030001  |15,00|  1,50  |13,50| # carrega preço de venda|

@preçoAtacado
Cenário: Venda com convênio produto atacado
    Dado que (produto está conigurado para vender em atacado)
    Quando abro o DAV
    E inicio uma venda com um cliente que possui convênio <cliente>
    E insiro o produto pelo código da embalagem <Código Embalagem>
    Então deverá perguntar se deseja vender por atacado 
    E ao confirmar (sim)
    Então será carregado o produto a preço de atacado e com a quantidade da embalagem
    E será dado o desconto correspondente ao perentual do convênio em cima do preço de venda do produto <preço>
    Exemplos:
|      cliente     |Código C|     produto     |Código Embalagem| Preço |Quantidade|preço|Desconto|Total|
|cliente n convenio|  1308  |Produto embalagem|    55501234    |Atacado|     5    |11,00|  5,50  |49,50|
|cliente n convenio|  1308  |Produto embalagem|    55501234    | Normal|     5    |15,00|  7,50  |67,50|
