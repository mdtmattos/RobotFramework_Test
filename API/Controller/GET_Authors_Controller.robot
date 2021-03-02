*** Settings ***
Resource           ../../TestConfig/TestConfig.robot

*** Variables ***
${endpoint_authors}       /v1/Authors

*** Keywords ***
Dado que fiz a request para a api Authors
    GET             ${endpoint_authors}
    Output          request