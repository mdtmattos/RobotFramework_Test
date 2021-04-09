*** Settings ***
Library          SeleniumLibrary
Library          DatabaseLibrary

# Controllers
Resource         ../WEB/Controller/C001_PesquisaProdutos_Controller.robot

# PageObjects
Resource         ../PageObjects/PesquisarProdutos_Page.robot

# DataBase
Resource         ../TestConfig/DataBase.robot

*** Variables ***
${URL}        http://automationpractice.com/
${Browser}    chrome  

*** Keywords ***
Abrir Navegador
    Open Browser        ${URL}      ${Browser}
    Maximize Browser Window
    Set Selenium Speed              1 seconds
    Set Selenium Implicit Wait      15s

Fechar Navegador
    Close Browser