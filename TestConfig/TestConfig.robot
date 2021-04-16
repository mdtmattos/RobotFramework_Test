*** Settings ***
Library          SeleniumLibrary
Library          DatabaseLibrary

# Controllers
Resource         ../WEB/Controller/C001_PesquisaProdutos_Controller.robot

# PageObjects
Resource         ../PageObjects/PesquisarProdutos_Page.robot

# DataBase
Resource         ../DataBase/database.robot

*** Variables ***
${URL}        http://automationpractice.com/
${Browser}    chrome  
${Options}    add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--headless")  

*** Keywords ***
Abrir Navegador
    Open Browser        ${URL}      ${Browser}     options=${Options}  #remote_url=http://localhost:4444/wd/hub
    Maximize Browser Window
    Set Selenium Speed              1 seconds
    Set Selenium Implicit Wait      15s

Fechar Navegador
    Close Browser

Conectar no Banco de Dados
    ## PostgreSQL
    Connect To Database   dbapiModuleName=psycopg2   dbName=robot   dbUsername=postgres   dbPassword=postgres   dbHost=localhost   dbPort=5432
    ## SQLite 3
      # Connect To Database Using Custom Params   dbapiModuleName=sqlite3    db_connect_string=database="./${DBName}.db", isolation_level=None
    ## MySQL
      # Connect To Database   dbapiModuleName=pymysql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbPort=${DBPort}
    ## SQL Server
      # Connect To Database   dbapiModuleName=pymssql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbPort=${DBPort}	  
    ## Oracle
      # Connect To Database Using Custom Params    dbapiModuleName=cx_Oracle    db_connect_string="${DBName}/${DBUser}@${DBHost}:${DBPort}/${DBalias}"

Desconectar do Banco de Dados
    Disconnect From Database