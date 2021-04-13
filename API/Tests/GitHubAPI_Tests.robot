*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot
Resource        ../../TestConfig/MassaDeDados.robot

*** Test Cases ***
Cenário: Logar na API do GitHub
    Dado que eu esteja conectado e autenticado na API do GitHub
    Quando solicitar os dados do usuário

Cenário: Listar issues
    Dado que eu esteja conectado na API do GitHub
    Quando pesquisar issues com state "open" e com label "bug"

Cenário: Enviar reação
    Dado que eu conecte e autentique na API do GitHub
    Quando eu envio a reação "rocket" para a issue "10"

Cenário: Criar uma Issue
    Dado que eu esteja conectado e autenticado na API do GitHub
    Quando eu postar nova issue com label "robot framework"