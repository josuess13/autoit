#language: pt
Funcionalidade: Venda com várias funcionalidades
Existem diferentes funcionalidades referente as vendas como venda de balança, preço configurado para cliente,
convênio e programa fidelidade. Os testes abaixo visam validar o funcionamento em conjunto dessas funcionalidades.

@clientePreçoVenda
Cenário: Venda por balança para cliente preço de venda com convênio e que participa do programa fidelidade
    Dado que cliente está configurado para vender a preço de venda e possui convênio e participa do programa fidelidade
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E insiro o cliente <cliente>
    E seleciono que desejo dar o desconto do convênio
    E insiro o código de balança com aquele produto <Código Balança> 
    Então será carregado o produto calculando a quantidade <Quantidade> em cima do preço de venda do produto
    E será dado o desconto correspondente ao convênio <Desconto>
    E será enviado a porcentagem correspondente da venda ao programa fidelidade <Fidelizado>
    Exemplos:
|     cliente     |Código C|    Produto    |Código Balança|Quantidade|Preço|Total|Desconto|Fidelizado|
|cliente venda c.c|  1309  |Produto b venda| 2034693012504| 0,833 Kg |15,00|11,25|  1,25  |   1,125  |

@clientePreçoCusto 
Cenário: Venda por balança para cliente preço de custo com convênio e que participa do programa fidelidade
    Dado que cliente está configurado para vender a preço de custo e possui convênio e participa do programa fidelidade
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E insiro o cliente <cliente>
    E insiro o código de balança com aquele produto <Código Balança> 
    Então será carregado o produto calculando a quantidade <Quantidade> em cima do preço de custo do produto
    E será dado o desconto correspondente ao convênio <Desconto>
    E será enviado a porcentagem correspondente da custo ao programa fidelidade <Fidelizado>
    Exemplos:
|     cliente     |Código C|    Produto    |Código Balança|Quantidade|Preço|Total|Desconto|Fidelizado|
|cliente custo c.c|  1310  |Produto b venda| 2034693012504| 0,833 Kg |15,00|11,25|  1,25  |   1,125  |

@clientePreçoPromocional
Cenário: Venda por balança para cliente preço promocional de custo com convênio e que participa do programa fidelidade
    Dado que cliente está configurado para vender a preço promocional e possui convênio e participa do programa fidelidade
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E insiro o cliente <cliente>
    E insiro o código de balança com aquele produto <Código Balança> 
    Então será carregado o produto calculando a quantidade <Quantidade> em cima do preço promocional do produto
    E será dado o desconto correspondente ao convênio <Desconto>
    E será enviado a porcentagem correspondente da promocional ao programa fidelidade <Fidelizado>
    Exemplos:
|        cliente        |Código C|    Produto    |Código Balança|Quantidade|Preço|Total|Desconto|Fidelizado|
|cliente promocional c.c|  1311  |Produto b venda| 2034693012504| 0,833 Kg |15,00|11,25|  1,25  |   1,125  |
 
@clientePreçoConsignado
Cenário: Venda por balança para cliente preço consignado de custo com convênio e que participa do programa fidelidade
    Dado que cliente está configurado para vender a preço consignado e possui convênio e participa do programa fidelidade
    E produto está configurado para balança
    E a configuração -informa preço total- está marcada (sistema -> configurações -> Comunicação -> Balança)
    Quando abro o DAV
    E insiro o cliente <cliente>
    E insiro o código de balança com aquele produto <Código Balança> 
    Então será carregado o produto calculando a quantidade <Quantidade> em cima do preço de consignado do produto
    E será dado o desconto correspondente ao convênio <Desconto>
    E será enviado a porcentagem correspondente da consignado ao programa fidelidade <Fidelizado>
    Exemplos:
|        cliente       |Código C|    Produto    |Código Balança|Quantidade|Preço|Total|Desconto|Fidelizado|
|cliente consignado c.c|  1312  |Produto b venda| 2034693012504| 0,833 Kg |15,00|11,25|  1,25  |   1,125  |
 