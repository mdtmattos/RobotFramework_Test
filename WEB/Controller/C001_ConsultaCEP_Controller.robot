*** Settings ***
Resource        ../../TestConfig/TestConfig.robot

*** Keywords ***
Dado que estou na pagina para consultar CEP
    Element Text Should Be       ${Titulo}          Busca CEP

Quando insiro um CEP válido
    Input Text          ${DigiteCEP}        ${CEP_Valido}
    Click Element       ${BtnBuscar}

Quando insiro um CEP inválido
    Input Text          ${DigiteCEP}        ${CEP_Invalido}
    Click Element       ${BtnBuscar}

Então valido os dados do CEP
    Element Text Should Be      ${ResultadoCEP}         Rua Professor Veríssimo Antônio de Souza Portão Curitiba/PR 80320-110

Então valido a mensagem de retorno
    Element Text Should Be         ${MsgResultado}        Não há dados a serem exibidos  
