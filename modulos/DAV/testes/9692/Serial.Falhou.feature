#language: pt
Funcionalidade: Venda de itens serial DAV
No sistema é possível cadastrar seriais para os produtos, dessa forma, ao inserir um produto que utiliza seriais no DAV
é aberto a tela de seriais e quando se seleciona o serial que será usado na venda será carregado o produto com o preço configurado 
para o mesmo.

Cenário: serial preço de custo
    Dado que produto está configurado que utiliza serial
    E possui seriais cadastrados
    Quando abro o DAV
    E inicio uma venda
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    E insiro o serial que será utilizado 
    Então deverá carregar o produto com o preço <preço> configurado para o produto exportar
    Exemplos:
|    cliente   |Código C|    Produto   |Código P|Preço|
|cliente normal|  1313  |produto serial|  34709 |10,00|

Cenário: serial preço de custo cliente
    Dado que produto está configurado que utiliza serial
    E possui seriais cadastrados
    Quando abro o DAV
    E inicio uma venda
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    E insiro o serial que será utilizado 
    Então deverá carregar o produto com o preço <preço> configurado no cadastro do cliente
    Exemplos:
|     cliente     |Código C|    Produto   |Código P|Preço|
|cliente n produto|  1302  |produto serial|  34709 |13,00|

Cenário: serial preço promocional DAV
    Dado que produto está configurado que utiliza serial
    E possui seriais cadastrados
    Quando abro o DAV
    E inicio uma venda
    E altero o tipo de preço para promocional
    E insiro o cliente <cliente>
    E insiro o produto <produto>
    E insiro o serial que será utilizado 
    Então deverá carregar o produto com o preço <preço> configurado para vender no DAV
    Exemplos:
|    cliente   |Código C|    Produto   |Código P|Preço|
|cliente normal|  1313  |produto serial|  34709 |13,00|

# Ao pesquisar por seriais sugeridos está mostrando que não existe serial disponível e está inserindo
# ao finalizar a venda de um serial está baixando o estoque, porém, o serial continua disponível