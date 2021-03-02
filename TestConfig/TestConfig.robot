*** Settings ***
Library     SeleniumLibrary
#Library     biblioteca_pb.py
Library     DatabaseLibrary
Library     RequestsLibrary
Library     REST       http://fakerestapi.azurewebsites.net/api     ssl_verify=False

# PageObjects

# Controllers
Resource            ../API/Controller/POST_Authors_Controller.robot
Resource            ../API/Controller/GET_Authors_Controller.robot

# DataBase
Resource            ../TestConfig/DataBase.robot

*** Variables ***
${URL}
${Browser}         chrome

*** Keywords ***
Abrir Navegador
    Open Browser                    ${URL}          ${Browser}
    Set Window Size                 360             640
    Set Selenium Speed              1 seconds
    Set Selenium Implicit Wait      15s

Fechar Navegador
    Closer Browser

Quando eu valido que a response veio com o status code
    [Arguments]             ${RetornoEsperado}
    Integer                 response status         ${RetornoEsperado}
    Output                  response