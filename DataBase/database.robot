*** Settings ***
Documentation   [14/10/2019] https://franz-see.github.io/Robotframework-Database-Library/api/1.2.2/DatabaseLibrary.html
...             Instale: "pip install -U robotframework-databaselibrary"
...             Para acessar o BD o Robot precisa conhecer o DRIVER de cada banco, então precisamos instalar esse DRIVER também (instale apenas para o BD que você utiliza!) ...
...             Para PostgreSQL: "pip install psycopg2"
...             Para SQLite 3: não precisa instalar nada!
...             Para MySQL: "pip install pymysql"
...             Para SQL Server: "pip install pymssql"
...             Para Oracle: "pip install cx-Oracle"
Resource        ../TestConfig/TestConfig.robot

*** Keywords ***
Executar script via STRING no Banco de Dados
    [Arguments]          ${SCRIPT}
    Execute SQL String   sqlString=${SCRIPT}

Executar script via ARQUIVO no Banco de Dados
    [Arguments]          ${FILE}
    Execute SQL Script   sqlScriptFileName=${FILE}

Executar query no Banco de dados
    [Arguments]         ${QUERY}
    ${RESPONSE_QUERY}   Query   selectStatement=${QUERY}
    [Return]            ${RESPONSE_QUERY}

Confere se "${USER}" foi inserido com sucesso
    Check If Exists In Database    selectStatement=SELECT username FROM account WHERE username = '${USER}'

Limpar Tabela
    [Arguments]     ${TABELA}
    ${REGISTROS}    Row Count    selectStatement=SELECT * FROM ${TABELA}
    Run Keyword If  ${REGISTROS} > 0    Delete All Rows From Table    ${TABELA}