*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot
Resource        ../../TestConfig/MassaDeDados.robot

Suite Setup     Dado que eu conecte a minha API

*** Test Cases ***
Cenário: Cadastrar um novo livro
    Dado que eu conecte a minha API
    Quando eu cadastro um novo livro
    Então verifico se retornou com o status code    200
    E verifico os dados cadastrado do livro



