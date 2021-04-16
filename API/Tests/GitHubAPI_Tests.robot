*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot
Resource        ../../TestConfig/MassaDeDados.robot

*** Test Cases ***
Cenário: Logar na API do GitHub
    Dado que eu esteja conectado e autenticado na API do GitHub com usuario e senha
    Quando solicitar os dados do usuário
    Então verifico se a requisição deu sucesso      ${My_User_Data}

Cenário: Listar issues
    Dado que eu esteja conectado na API do GitHub
    Quando pesquisar issues com state "open" e com label "bug"
    Então verifico se a requisição deu sucesso      ${My_Issues}

Cenário: Enviar reação
    Dado que eu conecte e autentique na API do GitHub
    Quando eu envio a reação "rocket" para a issue "10"
    Então verifico se a requisição deu sucesso      ${My_Reaction}

Cenário: Criar uma Issue
    Dado que eu esteja conectado e autenticado na API do GitHub
    Quando eu postar nova issue com label "robot framework"
    Então verifico se a requisição deu sucesso      ${RESPONSE}

Cenário: Conferir json
    Dado que eu pegue o JSON
    Quando confiro objetos e sub-objetos do JSON
    Então também confiro as listas no JSON
