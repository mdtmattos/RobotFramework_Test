*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot

*** Variables ***
${endpoint_books}       /v1/Books           

*** Keywords ***
Quando eu cadastro um novo livro
    ${Headers}     Create Dictionary    content-type=application/json
    ${Resposta}    POST On Session      BooksAPI     ${endpoint_books}
    ...                                 data={"id": 22223, "title": "teste", "description": "teste", "pageCount": 200, "excerpt": "teste", "publishDate": "2021-04-08T13:32:20.989Z"}
    ...                                 headers=${Headers}
    Log                     ${Resposta.text}
    Set Test Variable       ${Resposta}

E verifico os dados cadastrado do livro
    Should Not Be Empty                  ${Resposta.json()["title"]}
    Should Not Be Empty                  ${Resposta.json()["description"]}
    Should Not Be Empty                  ${Resposta.json()["excerpt"]}
    Should Not Be Empty                  ${Resposta.json()["publishDate"]}


