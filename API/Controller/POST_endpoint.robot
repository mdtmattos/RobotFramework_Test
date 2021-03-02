*** Settings ***
Resource           ../../TestConfig/TestConfig.robot

*** Variables ***
${endpoint}         /api/endpoint

*** Keywords ***
Dado que fiz a request para a api com CPF válido
    POST             ${endpoint}        { "cpf":"${CPF}"}
    Output           request