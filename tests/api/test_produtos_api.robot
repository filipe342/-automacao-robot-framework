*** Settings ***

Library    RequestsLibrary
Library    String
Library    Collections
Resource   ../../resources/keywords/api_keywords.robot
Resource   ../../resources/variables/global_variables.robot

*** Test Cases ***

Validar Cadastro de Produto com Dados Dinâmicos
    # Login antes de cadastrar um produto
    Realizar Login e Armazenar Token    ${EMAIL}    ${PASSWORD}

    ${nome}        Evaluate    "Produto_" + str(random.randint(1000,9999))    modules=random
    ${preco}       Evaluate    random.randint(100,500)    modules=random
    ${descricao}   Set Variable    "Descrição do produto"
    ${quantidade}  Evaluate    random.randint(1,500)    modules=random

    Cadastrar Produto    ${nome}    ${preco}    ${descricao}    ${quantidade}