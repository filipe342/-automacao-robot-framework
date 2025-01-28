*** Settings ***

Library    RequestsLibrary
Library    String
Library    Collections
Resource   ../../resources/keywords/api_keywords.robot
Resource   ../../resources/variables/global_variables.robot

*** Test Cases ***

Validar Cadastro e Busca de Produto

    Realizar Login e Armazenar Token    ${EMAIL}    ${PASSWORD}
    
    ${nome}        Evaluate    "Produto_" + str(random.randint(1000,9999))    modules=random
    ${preco}       Evaluate    random.randint(100,500)    modules=random
    ${descricao}   Set Variable    "Descrição do produto"
    ${quantidade}  Evaluate    random.randint(1,500)    modules=random

    # Cadastrar o produto e capturar o ID corretamente
    ${produto_id}=    Cadastrar Produto    ${nome}    ${preco}    ${descricao}    ${quantidade}

    # Buscar o produto cadastrado
    Buscar Produto Por ID    ${produto_id}