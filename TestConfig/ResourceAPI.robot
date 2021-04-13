*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         String

# Controllers
Resource        ../API/Controller/GET_BooksAPI_Controller.robot
Resource        ../API/Controller/POST_BooksAPI_Controller.robot
Resource        ../API/Controller/GitHubAPI_Controller.robot

*** Variables ***
${URL_API}           https://fakerestapi.azurewebsites.net/api
${URL_API_GITHUB}    https://api.github.com


*** Keywords ***
Dado que eu conecte a minha API
    Create Session          BooksAPI           ${URL_API}

Dado que eu esteja conectado e autenticado na API do GitHub com usuario e senha
    ${AUTH}=             Create List           ${GitHub_User}         ${GitHub_Pass}
    Create Session       GithubAPI             ${URL_API_GITHUB}      auth=${AUTH}      disable_warnings=True
    Set Test Variable    ${AUTH}

Dado que eu esteja conectado e autenticado na API do GitHub
    ${Headers}        Create Dictionary    Authorization=Bearer ${GitHub_Token}
    Create Session    GithubAPI            ${URL_API_GITHUB}         headers=${Headers}      disable_warnings=True
    Set Test Variable   ${Headers}

Dado que eu conecte e autentique na API do GitHub
    ${Headers}          Create Dictionary     Accept=application/vnd.github.squirrel-girl-preview+json      Authorization=Bearer ${GitHub_Token}
    Create Session      GithubAPI             ${URL_API_GITHUB}       headers=${Headers}      disable_warnings=True
    Set Test Variable   ${Headers}

Dado que eu esteja conectado na API do GitHub
    Create Session          GithubAPI           ${URL_API_GITHUB}    disable_warnings=True

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}

Então verifico se retornou com o status code
    [Arguments]         ${StatusCode}
    Should Be equal As Strings      ${Resposta.status_code}     ${StatusCode}

E verifico a reason
    [Arguments]         ${Reason_Desejado}       
    Should Be equal As Strings          ${Resposta.reason}      ${Reason_Desejado}
