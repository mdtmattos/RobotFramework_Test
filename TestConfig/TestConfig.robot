*** Settings ***
Library          SeleniumLibrary
Library          DatabaseLibrary

Resource         ../WEB/Controller/C001_PesquisaProdutos_Controller.robot
Resource         ../PageObjects/PesquisarProdutos_Page.robot

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