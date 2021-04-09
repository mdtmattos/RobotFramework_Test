*** Settings ***
Library         RequestsLibrary
Library         Collections

# Controllers
Resource        ../API/Controller/GET_BooksAPI_Controller.robot
Resource        ../API/Controller/POST_BooksAPI_Controller.robot

*** Variables ***
${URL_API}      https://fakerestapi.azurewebsites.net/api

*** Keywords ***
Dado que eu conecte a minha API
    Create Session          BooksAPI           ${URL_API}
    


