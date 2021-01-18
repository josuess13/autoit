#language:pt
Funcionalidade: Venda de produto de balança
Ao inserir código de balança no DAV, estando o produto configurado com status balança, será carregado o produto
trazendo o preço ou a quantidade determinada no código de balança.

@preçoVenda
Cenário: Venda de balança preço de venda (preço)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço de venda do produto
    Exemplos:
|    Cliente   |Código C|    Produto    |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b venda| 2034693012504| 12,5| 0,833 Kg |15,00|

@preçoCusto
Cenário: Venda de balança preço de custo (preço)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço de custo do produto
    Exemplos:
|    Cliente   |Código C|    Produto    |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b custo| 2034696012504| 12,5|  1,25 Kg |10,00|

@preçoPromocional
Cenário: Venda de balança preço promocional (preço)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço promocional do produto
    Exemplos:
|    Cliente   |Código C|       Produto       |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b promocional| 2034695012504| 12,5| 0,961 Kg |13,00|

@preçoConsignado
Cenário: Venda de balança preço consignado (preço)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço consignado do produto
    Exemplos:
|    Cliente   |Código C|       Produto      |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b consignado| 2034697012504| 12,5| 1,041 Kg |12,00|

--------------------- PESO ---------------------------

@preçoVenda
Cenário: Venda de balança preço de venda (quantidade)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o total <Total> em cima do preço de venda do produto
    Exemplos:
|    Cliente   |Código C|    Produto    |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b venda| 2034693015004| 22,5|  1,5 Kg  |15,00|

@preçoCusto
Cenário: Venda de balança preço de custo (quantidade)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o total <Total> em cima do preço de custo do produto
    Exemplos:
|    Cliente   |Código C|    Produto    |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b custo| 2034696015004|15,00|  1,5 Kg  |10,00|

@preçoPromocional
Cenário: Venda de balança preço promocional (quantidade)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o total <Total> em cima do preço promocional do produto
    Exemplos:
|    Cliente   |Código C|       Produto       |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b promocional| 2034695015004|19,50|  1,5 Kg  |13,00|

@preçoConsignado
Cenário: Venda de balança preço consignado (quantidade)
    Dado que produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o total <Total> em cima do preço consignado do produto
    Exemplos:
|    Cliente   |Código C|       Produto      |Código balança|Total|Quantidade|preço|
|cliente normal|  1313  |produto b consignado| 2034697015004|18,00|  1,5 Kg  |12,00|
 