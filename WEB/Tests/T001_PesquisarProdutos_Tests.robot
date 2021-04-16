*** Settings ***
Resource        ../../TestConfig/TestConfig.robot
Resource        ../../TestConfig/MassaDeDados.robot
Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Test Cases ***
Cenário: Pesquisar por um produto existente
    Dado que eu estou na home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na pagina de resultados da busca

Cenário: Pesquisar por um produto não existente
    Dado que eu estou na home do site
    Quando eu pesquisar por um "ItemNãoExistente" não existente
    Então a pagina deve exibir a mensagem "No results were found for your search "ItemNãoExistente""