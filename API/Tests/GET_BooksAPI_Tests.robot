*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot
Resource        ../../TestConfig/MassaDeDados.robot

Suite Setup     Dado que eu conecte a minha API

*** Test Cases ***
Cenário: Buscar a listagem de todos os livros
    Dado que eu conecte a minha API
    Quando fizer um GET request no endpoint Books
    Então verifico se retornou com o status code    200
    E verifico a reason     OK
    E verifico se retornou uma lista com "200" livros

Cenário: Buscar um livro específico
    Dado que eu conecte a minha API
    Quando eu requisitar o livro "15"
    Então verifico se retornou com o status code    200
    E verifico a reason     OK
    E verifico se retorna todos os dados do livro 15

