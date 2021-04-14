*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot

*** Variables ***
${endpoint_users}       /users    
${ISSUES_URI}           /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues 
${ISSUES_REACT_URI}     /repos/mdtmattos/Teste_RobotFramework/issues
${Meu_Dict_Esperado}    {"primeiro_nome": "Murilo", "nomes_do_meio": "Dellano", "ultimo_nome": "Mattos", "apelido": "Murilo"}   

*** Keywords ***
Dado que eu pegue o JSON
    ${Json_Complexo}     Get File       ${CURDIR}/data/output/json_complexo.json
    ${Json_Complexo}     To Json        ${Json_Complexo}
    [Return]             ${Json_Complexo}   

Quando solicitar os dados do usuário
    ${My_User_Data}     GET On Session        GithubAPI      ${endpoint_users}
    Log                 Meus dados=${My_User_Data.json()}
    Set Test Variable       ${My_User_Data}

Quando pesquisar issues com state "${State}" e com label "${Label}"
    ${Param}        Create Dictionary       ${State}        ${Label}
    ${My_Issues}    GET On Session          GithubAPI       ${ISSUES_URI}       ${Param}
    Log             Listade Issues:${My_Issues.json()}
    Set Test Variable   ${My_Issues}

Quando eu envio a reação "${Reaction}" para a issue "${Issue_Number}"
    ${My_Reaction}      POST On Session         GithubAPI       ${ISSUES_REACT_URI}/${Issue_Number}/reactions
    ...                                         data={"content": "${Reaction}"}      headers=${Headers}
    Log                 Meus dados:${My_Reaction.json()}
    Set Test Variable   ${My_Reaction}

Quando eu postar nova issue com label "${LABEL}"
    ${BODY}         Format String    ${CURDIR}/data/input/post_issue.json
    ...             user_git=${GitHub_User}
    ...             label=${LABEL}
    Log             Meu Body ficou:\n${BODY}
    ${RESPONSE}     POST On Session    GithubAPI    ${ISSUES_REACT_URI}   data=${BODY}
    Set Test Variable   ${RESPONSE}

Quando confiro objetos e sub-objetos do JSON
    ${Json_Complexo}        Dado que eu pegue o JSON
    ${Meu_Dict_Esperado}    To Json     ${Meu_Dict_Esperado}

    #Conferir um sub-dicionario dentro de um Json
    Dictionary Should Contain Sub Dictionary    ${Json_Complexo["pessoa"]["nome"]}
    ...     ${Meu_Dict_Esperado}

    #Conferindo campo a campo
    Dictionary Should Contain Item      ${Json_Complexo["pessoa"]["nome"]}      apelido     Murilo

    #Conferindo um valor dentro de uma lista de dicionários
    Dictionary Should Contain Item      ${Json_Complexo["pessoa"]["hobbies"]["livros"][0]}     titulo   Quando o céu invade a Terra
    Dictionary Should Contain Item      ${Json_Complexo["pessoa"]["hobbies"]["livros"][1]}     titulo   A Casa Favorita de Deus
    Dictionary Should Contain Item      ${Json_Complexo["pessoa"]["hobbies"]["livros"][2]}     titulo   O Tempo e a Oportunidade

Então também confiro as listas no JSON
    ${Json_Complexo}        Dado que eu pegue o JSON

    #Conferir valor dentro de uma lista
    List Should Contain Value          ${Json_Complexo["pessoa"]["hobbies"]["games"]["PC"]}     Flight Simulator

    #Conferir valor de uma determinada posição na lista
    ${GAME}         Get From List      ${Json_Complexo["pessoa"]["hobbies"]["games"]["VideoGame"]}      2

    #Conferir se não há duplicidade de itens na lista
    List Should Not Contain Duplicates      ${Json_Complexo["pessoa"]["hobbies"]["games"]["VideoGame"]}



