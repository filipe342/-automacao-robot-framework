*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    String
Resource   ../variables/global_variables.robot

*** Keywords ***
# ===========================
# 🔹 AUTENTICAÇÃO
# ===========================

Realizar Login e Armazenar Token

    [Arguments]    ${email}    ${password}
    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json
    ${body}=       Create Dictionary    email=${email}    password=${password}

    ${response}=   POST    ${LOGIN_ENDPOINT}    json=${body}    headers=${headers}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.json()}    authorization

    ${TOKEN}=    Set Variable    ${response.json()}[authorization]
    Log    Token Recebido: ${TOKEN} 
    Set Global Variable    ${TOKEN} 

# ===========================
# 🔹 GERENCIAMENTO DE USUÁRIOS
# ===========================

Criar Usuário Administrador

    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json
    ${body}=       Create Dictionary    nome="Admin User"    email="admin@qa.com"    password="admin123"    administrador="true"

    ${response}=   POST    ${USUARIOS_ENDPOINT}    json=${body}    headers=${headers}
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    201

# ===========================
# 🔹 GERENCIAMENTO DE PRODUTOS
# ===========================

Cadastrar Produto

    [Arguments]    ${nome}    ${preco}    ${descricao}    ${quantidade}
    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json    Authorization=${TOKEN}
    ${body}=       Create Dictionary    nome=${nome}    preco=${preco}    descricao=${descricao}    quantidade=${quantidade}

    Log    "Token usado na requisição: ${TOKEN}"

    ${response}=   POST    ${PRODUTOS_ENDPOINT}    json=${body}    headers=${headers}
    Log    ${response.status_code} 
    Log    ${response.content}      

    Should Be Equal As Strings    ${response.status_code}    201
    
    ${json_response}=    Evaluate    json.loads($response.content)    json
    Log    ${json_response}

    ${produto_id}=    Set Variable    ${json_response}[_id]
    Log    ID do Produto: ${produto_id}

    [Return]    ${produto_id}


Buscar Produto Por ID

    [Arguments]    ${produto_id}
    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json
    ${url}=        Set Variable    ${PRODUTOS_ENDPOINT}?_id=${produto_id}

    ${response}=   GET    ${url}    headers=${headers}
    Log    ${response.json()}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.json()}[produtos][0]    _id

# ===========================
# 🔹 FINALIZAR TESTE
# ===========================
