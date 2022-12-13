*** Settings ***
Documentation       Verifica se aplicação está online

Library             Browser

Test Teardown    Take Screenshot

*** Test Cases ***
Portal Admin deve estar online
    New Browser    headless=false    browser=chromium
    New Page    http://localhost:3000
    Get Text    h1    contains    Painel do Administrador
    Sleep    5
