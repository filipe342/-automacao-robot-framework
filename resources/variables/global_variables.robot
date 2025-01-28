*** Settings ***

Library    Collections
Library    String
Library    OperatingSystem
Library    RequestsLibrary

*** Variables ***

# Browsers
${BROWSER}    chrome

# URLs
${FRONTEND_URL}        https://front.serverest.dev
${API_URL}             https://serverest.dev
${LOGIN_ENDPOINT}      ${API_URL}/login
${PRODUTOS_ENDPOINT}   ${API_URL}/produtos
${USUARIOS_ENDPOINT}   ${API_URL}/usuarios 

# Credenciais
${EMAIL}         fulano@qa.com
${PASSWORD}      teste

# Token Global
${TOKEN}        NONE
