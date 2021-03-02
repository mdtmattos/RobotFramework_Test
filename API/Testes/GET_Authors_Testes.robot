*** Settings ***
Resource           ../../TestConfig/TestConfig.robot
Resource           ../../TestConfig/MassaDeDados.robot

Documentation      POST /v1/Authors

*** Test Cases ***
Cenário: Chamar endpoint Authors
    Dado que fiz a request para a api Authors
    Quando eu valido que a response veio com o status code    200