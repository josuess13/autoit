#language: pt
Funcionalidade: Venda de produtos de grade 
No Retaguarda é possível cadastrar um produto como grade marcando a flag -utiliza grade- e posteriormente cadastrando os itens de grade

Cenário: Venda dos itens de grade
    Dado que produto utiliza grade
    Quando abro o DAV
    E inicio uma venda
    E insiro o cliente <cliente>
    E insiro o código de grade do produto <código grade>
    Então serão carregados os produtos de grade trazendo o preço que o produto pai da grade exporta
    Mas caso o cliente exporte um preço diferente de preo de venda o preço utilizado deverá ser o preço configurado para o cliente
    Exemplos:
|       cliente       |Código C|   Produto   |Código grade|preço|
|    cliente normal   |  1313  |produto grade|  347061001 |15,00|
|   cliente n custo   |  1301  |produto grade|  347061001 |10,00|
|cliente n promocional|  1302  |produto grade|  347061001 |13,00|
| cliente n consignado|  1303  |produto grade|  347061001 |12,00|

Cenário: Venda dos itens de grade balança 
    Dado que produto utiliza grade
    E está configurado como balança
    Quando abro o DAV
    E inicio uma venda
    E insiro o cliente <cliente>
    E insiro o código de balança <código de balança>
    Então Será calculado o preço ou quantidade do produto em cima do preço que o produto exporta ou que o cliente vende
    Exemplos: configurado preço
|    Cliente   |Código C|    Produto    |Código balança|quantidade|preço|total|
|cliente normal|  1313  |produto b grade| 2034707005504| 0,366 Kg |15,00| 5,50|
    Exemplos: configurado quantidade
|    Cliente   |Código C|       Produto       |Código balança|quantidade|preço|total|
|cliente normal|  1313  |produto b grade custo| 2034708010004|   1 Kg   |10,00|10,00|
# ao utilizar a quantidade está trazendo a quantidade incorreta no exemplo acima que está inserindo 1 kg ao inserir o código de balança está trazendo 1000 kg
    Exemplos: configurado preço preço cliente
|       Cliente       |Código C|    Produto    |Código balança|quantidade|preço|total|
|cliente n promocional|  1302  |produto b grade| 2034707005504| 0,366 Kg |15,00| 5,50|


 