#language: pt
Funcionalidade: Venda de Kit 
No Retagurada em cadastro -> produtos -> Kit é possível cadastrar um kit de produtos, e ao inserir o produto ^Pai^ no DAV
Podem ser carregados os produtos daquele Kit

Cenário: Venda de Kit produto exporta preço
    Dado que tenho um produto cadastrado como Kit
    E abro o DAV
    E inicio uma venda
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então serão carregados os produtos do Kit
    E cada produto trará o preço configurado para aquele produto no Kit
    Exemplos:
|    cliente   |Código C|  Produto  |Código P|Preço item 34699|Preço item 34701|Preço item 34702|Preço item 34700|
|cliente normal|  1313  |produto kit|  34705 |      22,50     |      15,00     |      15,00     |      15,00     |

Cenário: Venda de Kit cliente preço configurado
    Dado que tenho um produto cadastrado como Kit
    E abro o DAV
    E inicio uma venda
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então serão carregados os produtos do Kit
    E cada produto trará o preço configurado para aquele produto no Kit
    Exemplos:
|       cliente       |Código C|  Produto  |Código P|Preço item 34699|Preço item 34701|Preço item 34702|Preço item 34700|
|cliente n promocional|  1302  |produto kit|  34705 |      22,50      |      15,00     |      15,00     |      15,00     |
#Ao alterar o preço usado na venda direto no DAV está carregando um valor muito errado (multiplicando por 1000)

Cenário: Venda de Kit preço alterado no DAV
    Dado que tenho um produto cadastrado como Kit
    E abro o DAV
    E inicio uma venda
    E seleciono o tipo de preço para um diferente de Normal ou Venda 
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    Então serão carregados os produtos do Kit
    E cada produto trará o preço configurado para aquele produto no Kit
    Exemplos:
|    cliente   |Código C|  Produto  |Código P|Preço item 34699|Preço item 34701|Preço item 34702|Preço item 34700|
|cliente normal|  1313  |produto kit|  34705 |      22,50      |      15,00     |      15,00     |      15,00     |
 