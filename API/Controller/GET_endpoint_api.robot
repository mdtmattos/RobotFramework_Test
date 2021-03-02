*** Settings ***
Resource           ../../TestConfig/TestConfig.robot

*** Variables ***
${endpoint}         /api/endpoint

*** Keywords ***
Dado que fiz a request para a api
    GET             ${endpoint}
    Output          request