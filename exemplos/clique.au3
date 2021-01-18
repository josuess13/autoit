; Para que se possa utilizar o clique do mouse temos:

MouseClick()
#cs
    - Essa função funciona a partir das coordenadas informadas, dessa forma ao passar como parâmetro as coordenadas da tela é possível clicar no local da tela determinado.
    - Por pegar a coordenada da tela, é possível que caso o mesmo script seja executado em monitores com diferentes resoluções, ou caso a janela que se deseja controlar esteja em outro
      local da tela o MouseClick não irá funcionar corretamente.
    - Pode-se acessar as coordenadas da tela arrastando o cursor do Autoit Window info até onde se deseja clicar e pegando as coordenadas em: Position na aba Mouse.

Exemplo de uso:
    - Menu horizontal do Retaguarda: Nele não é possível utilizar coordenadas do tipo Control, logo a única forma de clicar em algum elemento é através do MouseClick.

#ce
; Clique no botão iniciar do Windows (Monitor 1920x1080; Windows 10) 
MouseClick("left", 18, 1065, 1)

ControlClick
#cs
    - Essa função é mais indicada para clicar principalmente nas janelas dos módulos sistema.
    - Utiliza o texto da janela como referência, dessa forma mesmo em monitores com resoluções diferentes e mesmo a janela estando em outra possição da tela será possível o clique.
    - Pode-se passar as coordenadas na função de forma que seja clicado exatamente onde foi informado, um exemplo da utilização da coordenada dentro do ControlClick é quando se deseja 
      clicar no inicio ou no fim de um campo de label que possua filtros como CPF no cadastro de clientes por exemplo. 
    - Todas as informações referentes ao Control ao qual será clicado pode ser encontrado no Autoit Window info na aba Control

Exemplo de uso:
    - Clicar em um botão da tela.
    - Clicar em um label para inserir informações.

#ce
;Clique no botão Login na tela de login do Retaguarda
ControlClick("Fácil Retaguarda", "", "TJvXPButton1", "left", 1)