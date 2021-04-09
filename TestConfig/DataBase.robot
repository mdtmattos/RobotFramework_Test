*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${DataBase_DB_Name}                 
${DataBase_DB_Host}
${DataBase_DB_User}
${DataBase_DB_Pass}
${DataBase_DB_Port}
${DataBase_DB}              { "DB_Name": "${DataBase_DB_Name}", "DB_User": "${DataBase_DB_User}", "DB_Pass": "${DataBase_DB_Pass}", "DB_Host": "${DataBase_DB_Host}", "DB_Port": "${DataBase_DB_Port}" }

*** Keywords ***
### Conexão Banco de Dados ###
Conectar ao Banco de Dados
    [Arguments]                             ${Banco_De_Dados}
    ${Conexao}                              Evaluate                ${Banco_De_Dados}
    Connect To Database
    ...         dpapiModuleName=pyodbc      dbName=${Conexao['DB_Name']}        dbUsername=${Conexao['DB_User']}        dbPassword=${Conexao['DB_Pass']}        dbHost=${Conexao['DB_Host']}        dbPort=${Conexao['DB_Port']}

Encerrar conexao
    Disconnect From Database
    
### Validar registro no banco ###
Deletar dados do Banco
    Conectar ao Banco de Dados              ${DataBase_DB}
    Execute Sql String                      DELETE FROM LEADS WHERE Telefone = 

E valido se o registro foi salvo no banco
    Conectar ao Banco de Dados              ${DataBase_DB}
    FOR ${I}        IN RANGE        30
        ${Qtd_Resultados}                   Row Count               SELECT * FROM LEADS WHERE Telefone =
        Exit For Loop If                    ${Qtd_Resultados} > 0
        Sleep                               2s
    END
    Deletar dados do Banco
    Encerrar Conexão

