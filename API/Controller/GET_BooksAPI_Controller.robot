*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot

*** Variables ***
${endpoint_books}       /v1/Books           

*** Keywords ***
Quando fizer um GET request no endpoint Books
    ${Resposta}     GET On Session        BooksAPI     ${endpoint_books}
    Log             ${Resposta.text}
    Set Test Variable       ${Resposta}

Quando eu requisitar o livro "${ID_Livro}"
    ${Resposta}     GET On Session        BooksAPI     ${endpoint_books}/${ID_Livro}
    Log             ${Resposta.text}
    Set Test Variable       ${Resposta}

Então verifico se retornou com o status code
    [Arguments]         ${StatusCode}
    Should Be equal As Strings      ${Resposta.status_code}     ${StatusCode}

E verifico a reason
    [Arguments]         ${Reason_Desejado}       
    Should Be equal As Strings          ${Resposta.reason}      ${Reason_Desejado}

E verifico se retornou uma lista com "${QTE_Livros}" livros
    Length Should Be    ${Resposta.json()}          ${QTE_Livros}

E verifico se retorna todos os dados do livro 15
    Should Not Be Empty                  ${Resposta.json()["title"]}
    Should Not Be Empty                  ${Resposta.json()["description"]}
    Should Not Be Empty                  ${Resposta.json()["excerpt"]}
    Should Not Be Empty                  ${Resposta.json()["publishDate"]}

