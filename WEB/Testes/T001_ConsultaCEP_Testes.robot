*** Settings ***
Resource        ../../TestConfig/TestConfig.robot
Resource        ../../TestConfig/MassaDeDados.robot
Resource        ../../TestConfig/DataBase.robot

Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Test Cases ***
Consultar por CEP
    Dado que estou na pagina para consultar CEP
    Quando insiro um CEP válido
    Então valido os dados do CEP

Consultar por CEP inválido
    Dado que estou na pagina para consultar CEP
	Quando insiro um CEP inválido
	Então valido a mensagem de retorno