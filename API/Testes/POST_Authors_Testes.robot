*** Settings ***
Resource           ../../TestConfig/TestConfig.robot
Resource           ../../TestConfig/MassaDeDados.robot

Documentation      POST /v1/Authors

*** Test Cases ***
Cenário: Chamar API com nome de autor valido
    Dado que fiz a request para a API com nome valido
    Quando eu valido que a response veio com o status code    200