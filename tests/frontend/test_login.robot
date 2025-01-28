*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/keywords/frontend_keywords.robot
Resource   ../../resources/variables/global_variables.robot

*** Test Cases ***
Validar Login com Credenciais Válidas
    Abrir Página de Login
    Preencher Campos de Login    ${EMAIL}    ${PASSWORD}
    Clicar no Botão Entrar
    Verificar Login Bem-Sucedido
    Fechar Navegador
