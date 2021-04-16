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
Test Setup      Conectar no Banco de Dados
Test Teardown   Desconectar do Banco de Dados


*** Test Cases ***
Executando scripts SQL via Arquivos
    Executar script via ARQUIVO no Banco de Dados       ${CURDIR}/my_sql_scripts/create_table_accounts.sql
    Executar script via ARQUIVO no Banco de Dados       ${CURDIR}/my_sql_scripts/insert_into_account.sql
    Confere se "Murilo Mattos" foi inserido com sucesso
    
Executando scripts SQL via STRING
    Executar script via STRING no Banco de Dados        INSERT INTO public.account(user_id, username, password, email) VALUES (2, 'Luiz Silva', 'robot987', 'robotizando2@robot.com')
    Confere se "Luiz Silva" foi inserido com sucesso

Select Statement
    ${RESPOSTA_SELECT}      Executar query no Banco de dados    SELECT * from account
    Log    ${RESPOSTA_SELECT}
    ## Para pegar um campo específico, utilize as tuplas [NUM_LINHA][NUM_COLUNA]
    Log    Usuário ${RESPOSTA_SELECT[0][0]} - Nome: ${RESPOSTA_SELECT[0][1]} - E-mail: ${RESPOSTA_SELECT[0][3]}
    Log    Usuário ${RESPOSTA_SELECT[1][0]} - Nome: ${RESPOSTA_SELECT[1][1]} - E-mail: ${RESPOSTA_SELECT[1][3]}

Limpando Tabelas
    Limpar Tabela    account
    Executar script via STRING no Banco de Dados     DROP table account