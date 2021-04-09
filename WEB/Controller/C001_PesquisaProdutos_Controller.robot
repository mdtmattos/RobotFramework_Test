*** Settings ***
Resource        ../../TestConfig/TestConfig.robot

*** Keywords ***
Dado que eu estou na home do site
    Go to               ${URL}
    Title Should Be     My Store
    Capture Page Screenshot

Quando eu pesquisar pelo produto "${Produto}"
    Input Text         ${InputPesquisa}         ${Produto}
    Capture Page Screenshot
    Click Element      ${BtnPesquisar} 
        
Quando eu pesquisar por um "${ProdutoExistente}" não existente
    Input Text         ${InputPesquisa}         ${ProdutoExistente}
    Capture Page Screenshot
    Click Element      ${BtnPesquisar}

Então o produto "${Produto}" deve ser listado na pagina de resultados da busca
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Mouse Down                          xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Element         ${BtnAddToCart}
    Page Should Contain Element         ${BtnMore}
    Capture Page Screenshot

Então a pagina deve exibir a mensagem "${MensagemAlerta}"
    Wait Until Element Is Visible       ${MsgAlerta}
    Element Text Should Be              ${MsgAlerta}        ${MensagemAlerta}
    Capture Page Screenshot
