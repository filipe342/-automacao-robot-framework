*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../../resources/keywords/frontend_keywords.robot
Resource   ../../resources/variables/global_variables.robot


*** Test Cases ***
Validar Cadastro de Novo Usuário com Dados Dinâmicos
    ${NEW_USERNAME}    Evaluate    "User_" + str(random.randint(1000,9999))    modules=random
    ${NEW_EMAIL}       Evaluate    "user" + str(random.randint(1000,9999)) + "@qa.com"    modules=random
    ${NEW_PASSWORD}    Evaluate    "Senha" + str(random.randint(10000,99999))    modules=random

    Cadastrar Novo Usuário    ${NEW_USERNAME}    ${NEW_EMAIL}    ${NEW_PASSWORD}
    Fechar Navegador
