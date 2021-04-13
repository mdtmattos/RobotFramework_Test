*** Settings ***
Resource        ../../TestConfig/ResourceAPI.robot

*** Variables ***
${endpoint_users}       /users    
${ISSUES_URI}           /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues 
${ISSUES_REACT_URI}     /repos/mdtmattos/Teste_RobotFramework/issues

*** Keywords ***
Quando solicitar os dados do usuário
    ${My_User_Data}     GET On Session        GithubAPI      ${endpoint_users}
    Log                 Meus dados=${My_User_Data.json()}
    Confere sucesso na requisição       ${My_User_Data}

Quando pesquisar issues com state "${State}" e com label "${Label}"
    ${Param}        Create Dictionary       ${State}        ${Label}
    ${My_Issues}    GET On Session          GithubAPI       ${ISSUES_URI}       ${Param}
    Log             Listade Issues:${My_Issues.json()}
    Confere sucesso na requisição   ${My_Issues}

Quando eu envio a reação "${Reaction}" para a issue "${Issue_Number}"
    ${My_Reaction}      POST On Session         GithubAPI       ${ISSUES_REACT_URI}/${Issue_Number}/reactions
    ...                                         data={"content": "${Reaction}"}      headers=${Headers}
    Log                 Meus dados:${My_Reaction.json()}
    Confere sucesso na requisição   ${My_Reaction}

Quando eu postar nova issue com label "${LABEL}"
    ${BODY}         Format String    ${CURDIR}/data/input/post_issue.json
    ...             user_git=${GitHub_User}
    ...             label=${LABEL}
    Log             Meu Body ficou:\n${BODY}
    ${RESPONSE}     POST On Session    GithubAPI    ${ISSUES_REACT_URI}   data=${BODY}
    Confere sucesso na requisição   ${RESPONSE}