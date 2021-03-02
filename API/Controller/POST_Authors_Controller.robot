*** Settings ***
Resource           ../../TestConfig/TestConfig.robot

*** Variables ***
${endpoint_authors}         /v1/Authors

*** Keywords ***
Dado que fiz a request para a API com nome valido
    POST             ${endpoint_authors}        { "firstName": "${Nome_01}", "lastName": "${Sobrenome_01}" }   
    Output           request