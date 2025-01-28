*** Settings ***

Library    RequestsLibrary
Resource   ../../resources/keywords/api_keywords.robot
Resource   ../../resources/variables/global_variables.robot

*** Test Cases ***
Validar Login e Armazenamento de Token
    Realizar Login e Armazenar Token    ${EMAIL}    ${PASSWORD}
