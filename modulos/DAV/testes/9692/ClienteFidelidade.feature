#language: pt
Funcionalidade: Programa de Fidelidade para clientes venda no DAV
No Retaguarda é possível adicionar um cliente ao programa de fidelidade.
Ao realizar uma venda no DAV caso o cliente participe do programa de fidelidade será enviado o valor correspondente ao percentual da venda 
como consignado para aquele cliente.

@preçoVenda
Cenário: Venda para cliente utiliza preço de venda
    Dado que (cliente está configurado para vender a preço de venda)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro um produto <produto>
    Então será carregado o preço configurado para o produto exportar <preço>
    E ao finalizar a venda será gerado o valor do progrma fidelidade para o cliente <Fidelizado>
    Exemplos: 
|    Cliente    |Código C|       Produto       |Código P|Preço|Fidelizado|
|Cliente F venda|  1304  |   produto e venda   |  34699 |15,00|   1,50   |
|Cliente F venda|  1304  | produto e consignado|  34700 |12,00|   1,20   |
|Cliente F venda|  1304  |   produto e custo   |  34701 |10,00|   1,00   |
|Cliente F venda|  1304  |produto e promocional|  34702 |13,00|   1,30   |

@preçoCusto
Cenário: Venda para cliente utiliza preço de custo
    Dado que (cliente está configurado para vender a preço de custo)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro um produto <produto>
    Então será carregado o preço de custo do produto <preço>
    E ao finalizar a venda será gerado o valor do progrma fidelidade para o cliente <Fidelizado>
    Mas caso o preço de custo do produto esteja igual a zero
    Então será carregado o preço de venda do produto
    Exemplos: 
|    Cliente    |Código C|      Produto      |Código P|Preço|Fidelizado|
|Cliente F Custo|  1305  |  produto e venda  |  34699 |10,00|   1,00   |
|Cliente F Custo|  1305  |produto n sem preço|  34703 |15,00|   1,50   |

@preçoPromocional
Cenário: Venda para cliente utiliza preço promocional
    Dado que (cliente está configurado para vender a preço de promocional)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro um produto <produto>
    Então será carregado o preço de promocional do produto <preço>
    E ao finalizar a venda será gerado o valor do progrma fidelidade para o cliente <Fidelizado>
    Mas caso o preço de promocional do produto esteja igual a zero
    Então será carregado o preço de venda do produto
    Exemplos: 
|       Cliente       |Código C|      Produto      |Código P|Preço|Fidelizado|
|Cliente F promocional|  1306  |  produto e venda  |  34699 |13,00|   1,30   |
|Cliente F promocional|  1306  |produto n sem preço|  34703 |15,00|   1,50   |

@preçoConsignado
Cenário: Venda para cliente utiliza preço consignado
    Dado que (cliente está configurado para vender a preço de consignado)
    Quando abro o DAV
    E inicio uma venda com aquele cliente <cliente>
    E insiro um produto <produto>
    Então será carregado o preço de consignado do produto <preço>
    E ao finalizar a venda será gerado o valor do progrma fidelidade para o cliente <Fidelizado>
    Mas caso o preço de consignado do produto esteja igual a zero
    Então será carregado o preço de venda do produto
    Exemplos: 
|       Cliente      |Código C|      Produto      |Código P|Preço|Fidelizado|
|Cliente F consignado|  1307  |  produto e venda  |  34699 |12,00|   1,20   |
|Cliente F consignado|  1307  |produto n sem preço|  34703 |15,00|   1,50   |
 