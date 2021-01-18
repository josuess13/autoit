#language: pt
Funcionalidade: Vender em diferentes preços no DAV
É possível selecionar qual o tipo de preço será utilizado no DAV
marcando a coniguração Trabalha com vários preços em vendas no DAV

@preçoNormal
Cenário: vender a preço normal
    Dado que quero vender os produtos com o preço normal
    Quando abro o DAV
    E inicio uma venda
    E seleciono o tipo de preço normal
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então o preço carregado do produto será de acordo com o configurado para ele exportar ou do cadastro do cliente <preço>
    Exemplos:
|    Cliente    |Código C|    Produto    |Código P|Código balança|preço|Quantidade|
| cliente normal|  1313  |produto e custo|  34701 |       -      |10,00|     -    |
|cliente n custo|  1301  |produto e venda|  34699 |       -      |10,00|     -    |
| cliente normal|  1313  |produto b custo|    -   | 2034696012504|12,50|   1,25   |

@preçoVenda
Cenário: vender a preço de venda
    Dado que quero vender os produtos com o preço de venda
    Quando abro o DAV
    E inicio uma venda
    E seleciono o tipo de preço venda
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então o preço carregado do produto deverá ser o preço de venda do produto <preço>
    Exemplos:
|    Cliente    |Código C|    Produto    |Código P|Código balança|preço|Quantidade|                                                                                   
| cliente normal|  1313  |produto e custo|  34701 |       -      |15,00|     -    |                                                                                   
|cliente n custo|  1301  |produto e venda|  34699 |       -      |15,00|     -    |                                                                                   
| cliente normal|  1313  |produto b custo|    -   | 2034696012504|12,50|   1,25   |#deveria carregar o preço que o produto exporta, mas está carregando preço de venda|

@preçoCusto
Cenário: vender a preço de custo
    Dado que quero vender os produtos com o preço de custo
    Quando abro o DAV
    E inicio uma venda
    E seleciono o tipo de preço custo
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então o preço carregado do produto deverá ser o preço de custo do produto <preço>
    Exemplos:
|       Cliente       |Código C|       Produto      |Código P|Código balança|preço|Quantidade|
|    cliente normal   |  1313  |   produto e venda  |  34699 |       -      |10,00|     -    |
|cliente n promocional|  1302  |   produto e venda  |  34699 |       -      |10,00|     -    |
|    cliente normal   |  1313  |produto b consignado|    -   | 2034697012504|12,50|   1,041  |

@preçoPromocional
Cenário: vender a preço promocional
    Dado que quero vender os produtos com o preço promocional
    Quando abro o DAV
    E inicio uma venda
    E seleciono o tipo de preço promocional
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então o preço carregado do produto deverá ser o preço promocional do produto <preço>
    Exemplos:
|    Cliente    |Código C|       Produto      |Código P|Código balança|preço|Quantidade|
| cliente normal|  1313  |   produto e venda  |  34699 |       -      |13,00|     -    |
|cliente n custo|  1301  |   produto e venda  |  34699 |       -      |13,00|     -    |
| cliente normal|  1313  |produto b consignado|    -   | 2034697012504|12,50|   1,041  |

@preçoConsignado
Cenário: vender a preço consignado
    Dado que quero vender os produtos com o preço consignado
    Quando abro o DAV
    E inicio uma venda
    E seleciono o tipo de preço consignado
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então o preço carregado do produto deverá ser o preço consignado do produto <preço>
    Exemplos:
|    Cliente    |Código C|    Produto    |Código P|Código balança|preço|Quantidade|
| cliente normal|  1313  |produto e venda|  34699 |       -      |12,00|     -    |
|cliente n custo|  1301  |produto e venda|  34699 |       -      |12,00|     -    |
| cliente normal|  1313  |produto b custo|    -   | 2034696012504|12,50|   12,50  |

@preçoAtacado
Cenário: vender a preço de atacado
    Dado que quero vender os produtos com o preço de atacado
    Quando abro o DAV
    E inicio uma venda
    E seleciono o tipo de preço atacado
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então o preço carregado do produto deverá ser o preço de atacado do produto <preço>
    Exemplos: 
|    Cliente   |Código C|     Produto     |Código P|Código balança|preço|Quantidade|
|cliente normal|  1313  |produto embalagem|  34704 |       -      |11,00|     -    |
|cliente normal|  1313  | produto b custo |    -   | 2034696012504|10,00|   12,50  |
 