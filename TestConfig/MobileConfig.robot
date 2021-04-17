*** Settings ***
Library          DatabaseLibrary
Library          AppiumLibrary

# Controllers
Resource         ../WEB/Controller/C001_PesquisaProdutos_Controller.robot

# PageObjects
Resource         ../PageObjects/PesquisarProdutos_Page.robot

# DataBase
Resource         ../DataBase/database.robot

*** Variables ***
${URL}        http://automationpractice.com/
${Browser}    chrome  
#${Options}    add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--headless")  
#${RemoteURL}  http://localhost:4444/wd/hub


#Mobile
${MobileURL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}       Android
${PLATFORM_VERSION}    11
${DEVICE_NAME}         emulator-5554
${AUTOMATION_NAME}     Appium
${appPackage}          com.android.chrome
${appActivity}         com.google.android.apps.chrome.Main

*** Keywords ***
Abrir Dispositivo
    Open Application   ${MobileURL}   platformName=${PLATFORM_NAME}   deviceName=${DEVICE_NAME}   appPackage=${appPackage}     appActivity=${appActivity}
    ...    platformVersion=${PLATFORM_VERSION}   automationName=${AUTOMATION_NAME}   udid=${DEVICE_NAME}

Abrir Aplicativo
    Open Application   ${MobileURL}   platformName=${PLATFORM_NAME}   deviceName=${DEVICE_NAME}   browserName=${Browser}
    Go To URL   ${URL}

Fechar Dispositivo
    Close Application