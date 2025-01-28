*** Settings ***

Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../variables/global_variables.robot

*** Keywords ***

# ===========================
# 🔹 LOGIN NO SISTEMA
# ===========================

Abrir Página de Login
    Open Browser    ${FRONTEND_URL}/login    ${BROWSER}
    Wait Until Page Contains    Login    timeout=5s

Preencher Campos de Login
    [Arguments]    ${email}    ${senha}
    Input Text    id=email       ${email}
    Input Text    id=password    ${senha}

Clicar no Botão Entrar
    Click Button    xpath=//button[contains(text(),'Entrar')]

Verificar Login Bem-Sucedido
    Wait Until Element Contains    xpath=//h1    Bem Vindo    timeout=10s

Logar no Sistema
    [Arguments]    ${email}    ${senha}
    Abrir Página de Login
    Preencher Campos de Login    ${email}    ${senha}
    Clicar no Botão Entrar
    Verificar Login Bem-Sucedido


# ===========================
# 🔹 CADASTRO DE NOVO USUÁRIO (TELA PRINCIPAL)
# ===========================

Abrir Página de Cadastro
    Open Browser    ${FRONTEND_URL}/cadastrarusuarios    ${BROWSER}
    Wait Until Page Contains    Cadastro    timeout=5s

Preencher Formulário de Cadastro
    [Arguments]    ${nome}    ${email}    ${senha}    ${administrador}=False
    Input Text    id=nome       ${nome}
    Input Text    id=email      ${email}
    Input Text    id=password   ${senha}
    Run Keyword If    ${administrador}==True    Click Element    id=administrador

Clicar no Botão Cadastrar
    Wait Until Element Is Visible    css=button[data-testid='cadastrar']    timeout=5s
    Click Button    css=button[data-testid='cadastrar']

Verificar Cadastro Bem-Sucedido
    Wait Until Page Contains    Cadastro realizado com sucesso    timeout=10s

Cadastrar Novo Usuário
    [Arguments]    ${nome}    ${email}    ${senha}    ${administrador}=False
    Abrir Página de Cadastro
    Preencher Formulário de Cadastro    ${nome}    ${email}    ${senha}    ${administrador}
    Clicar no Botão Cadastrar
    Verificar Cadastro Bem-Sucedido


# ===========================
# 🔹 CADASTRO DE NOVO USUÁRIO LOGADO
# ===========================

Abrir Página de Cadastro de Usuário
    Click Element    xpath=//a[@data-testid='cadastrarUsuarios']
    Wait Until Page Contains    Cadastro de usuários    timeout=5s

Preencher Formulário de Cadastro de Usuário
    [Arguments]    ${nome}    ${email}    ${senha}    ${administrador}=False
    Input Text    id=nome       ${nome}
    Input Text    id=email      ${email}
    Input Text    id=password   ${senha}
    Run Keyword If    ${administrador}==True    Click Element    id=administrador

Clicar no Botão Cadastrar Usuário
    Wait Until Element Is Visible    xpath=//button[@data-testid='cadastrarUsuario']    timeout=5s
    Click Button    xpath=//button[@data-testid='cadastrarUsuario']

Cadastrar Novo Usuário Logado
    [Arguments]    ${nome}    ${email}    ${senha}    ${administrador}=False
    Abrir Página de Cadastro de Usuário
    Preencher Formulário de Cadastro de Usuário    ${nome}    ${email}    ${senha}    ${administrador}
    Clicar no Botão Cadastrar Usuário
    Wait Until Page Contains    Lista dos usuários    timeout=10s

# ===========================
# 🔹 FINALIZAR TESTE
# ===========================

Fechar Navegador
    Close Browser
