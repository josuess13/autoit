#language:pt
Funcionalidade: Venda de produto de balança cliente com preço configurado
Ao inserir código de balança no DAV, estando o produto configurado com status balança, será carregado o produto
trazendo o preço ou a quantidade determinada no código de balança.

@preçoVenda
Cenário: Venda de balança pelo preço cliente preço de venda
    Dado que (cliente está configurado para vender a preço de venda)
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço que o produto exporta
    Exemplos:
|    Cliente    |Código C|       Produto       |Código balança|Total|Quantidade|
|cliente n venda|  1300  |   produto b venda   | 2034693012504| 12,5| 0,833 Kg |
|cliente n venda|  1300  |   produto b custo   | 2034696012504| 12,5|  1,25 Kg |
|cliente n venda|  1300  |produto b promocional| 2034695012504| 12,5| 0,961 Kg |
|cliente n venda|  1300  | produto b consignado| 2034697012504| 12,5| 1,041 Kg |

@preçoCusto 
Cenário: Venda de balança pelo preço cliente preço de custo
    Dado que (cliente está configurado para vender a preço de custo)
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço que o produto exporta
    Mas caso o preço de custo do produto esteja igual a zero
    Então será calculado o preço do produto na venda em cima do preço de venda do produto 
    Exemplos:
|    Cliente    |Código C|      Produto      |Código balança|Total|Quantidade|
|cliente n custo|  1301  |  produto b venda  | 2034693005504| 5,50|   0,366  |
|cliente n custo|  1301  |produto b sem preço| 2034694005504| 5,50|   0,366  |

@preçoPromocional 
Cenário: Venda de balança pelo preço cliente preço promocional
    Dado que (cliente está configurado para vender a preço de promocional)
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço que o produto exporta
    Mas caso o preço de promocional do produto esteja igual a zero
    Então será calculado o preço do produto na venda em cima do preço de venda do produto 
    Exemplos:
|       Cliente       |Código C|      Produto      |Código balança|Total|Quantidade|
|cliente n promocional|  1302  |  produto b venda  | 2034693005504| 5,50|   0,366  |
|cliente n promocional|  1302  |produto b sem preço| 2034694005504| 5,50|   0,366  |

@preçoConsignado 
Cenário: Venda de balança pelo preço cliente preço consignado
Dado que (cliente está configurado para vender a preço de consignado)
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando a quantidade <Quantidade> em cima do preço que o produto exporta
    Mas caso o preço de consignado do produto esteja igual a zero
    Então será calculado o preço do produto na venda em cima do preço de venda do produto 
    Exemplos:
|       Cliente      |Código C|      Produto      |Código balança|Total|Quantidade|
|cliente n consignado|  1303  |  produto b venda  | 2034693005504| 5,50|   0,366  |
|cliente n consignado|  1303  |produto b sem preço| 2034694005504| 5,50|   0,366  |

--------------------- Quantidade ---------------------

@preçoVenda
Cenário: Venda de balança pela quantidade cliente preço de venda
Dado que (cliente está configurado para vender a preço de venda)
    E produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o preço em cima do preço que o produto exporta <Total>
    Exemplos:
|    Cliente    |Código C|       Produto       |Código balança|Quantidade|Total|
|cliente n venda|  1300  |   produto b venda   | 2034693012504|  1,25 Kg |18,75|
|cliente n venda|  1300  |   produto b custo   | 2034696012504|  1,25 Kg |12,50|
|cliente n venda|  1300  |produto b promocional| 2034695012504|  1,25 Kg |16,25|
|cliente n venda|  1300  | produto b consignado| 2034697012504|  1,25 Kg |15,00|

@preçoCusto 
Cenário: Venda de balança pela quantidade cliente preço de custo
Dado que (cliente está configurado para vender a preço de custo)
    E produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o preço em cima do preço que o produto exporta <Total>
    Mas caso o preço de custo do produto esteja igual a zero
    Então será calculado o preço do produto na venda em cima do preço de venda do produto 
    Exemplos:
|    Cliente    |Código C|      Produto      |Código balança|Quantidade|Total|
|cliente n custo|  1301  |  produto b venda  | 2034693012504|  1,25 Kg |18,75|
|cliente n custo|  1301  |produto b sem preço| 2034694012504|  1,25 Kg |18,75|

@preçoPromocional 
Cenário: Venda de balança pela quantidade cliente preço promocional
Dado que (cliente está configurado para vender a preço promocional)
    E produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o preço em cima do preço que o produto exporta <Total>
    Mas caso o preço de promocional do produto esteja igual a zero
    Então será calculado o preço do produto na venda em cima do preço de venda do produto 
    Exemplos:
|       Cliente       |Código C|      Produto      |Código balança|Quantidade|Total|
|cliente n promocional|  1302  |  produto b venda  | 2034693012504|  1,25 Kg |18,75|
|cliente n promocional|  1302  |produto b sem preço| 2034694012504|  1,25 Kg |18,75|

@preçoConsignado 
Cenário: Venda de balança pela quantidade cliente preço consignado
Dado que (cliente está configurado para vender a preço consignado)
    E produto está configurado para balança
    E a configuração -informa preço total- está desmarcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro o código de balança daquele produto <Código balança>
    Então o sistema carrega o produto na venda calculando o preço em cima do preço que o produto exporta <Total>
    Mas caso o preço de consignado do produto esteja igual a zero
    Então será calculado o preço do produto na venda em cima do preço de venda do produto 
    Exemplos:
|       Cliente      |Código C|      Produto      |Código balança|Quantidade|Total|
|cliente n consignado|  1303  |  produto b venda  | 2034693012504|  1,25 Kg |18,75|
|cliente n consignado|  1303  |produto b sem preço| 2034694012504|  1,25 Kg |18,75|


# Quantidade está sempre inserindo 1, assim como estava dando o erro anteriormente 