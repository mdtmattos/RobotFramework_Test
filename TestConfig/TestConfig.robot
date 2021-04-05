*** Settings ***
Library     SeleniumLibrary
Library     DatabaseLibrary
Library     RequestsLibrary
Library     REST       http://fakerestapi.azurewebsites.net/api     ssl_verify=False

# PageObjects
Resource            ../WEB/PageObjects/P001_PageObjects.robot
# Controllers
Resource            ../API/Controller/POST_Authors_Controller.robot
Resource            ../API/Controller/GET_Authors_Controller.robot
Resource            ../WEB/Controller/C001_ConsultaCEP_Controller.robot

# DataBase
Resource            ../TestConfig/DataBase.robot

*** Variables ***
${URL}             https://buscacepinter.correios.com.br/app/endereco/index.php
${Browser}         chrome

*** Keywords ***
Abrir Navegador
    Open Browser                    ${URL}          ${Browser}
    Set Window Size                 360             640
    Set Selenium Speed              1 seconds
    Set Selenium Implicit Wait      15s

Fechar Navegador
    Close Browser

Quando eu valido que a response veio com o status code
    [Arguments]             ${RetornoEsperado}
    Integer                 response status         ${RetornoEsperado}
    Output                  response