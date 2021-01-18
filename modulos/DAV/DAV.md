# Módulo DAV

## Pré Vendas
---
### 1. Preços:
### 1.1. Preço do Cliente
No Retaguarda, na tela de Cadastro de Clientes na aba Financeiro, é possível definir o preço utilizado nas vendas para aquele cliente (venda, custo, promocional ou consignado), dessa forma, ao realizar alguma venda no sistema para aquele cliente será considerado o preço configurado para ele.

Exemplo: O preço configurado para o cliente 1 é o preço de custo. Ao vender o produto x para esse cliente no DAV será carregado e vendido o produto x pelo preço de custo.

Exceções:
* O produto é vendido como balança. Nesse caso será considerado o preço que o produto exporta.
* O tipo de preço no DAV está diferente de Normal. Quando se utiliza vários preços no DAV, quando se insere um preço diferente do Normal, por exemplo preço de venda, mesmo se o cliente estiver configurado para vender a preço de custo, será carregado e vendido a preço de venda.
### 2.