*** Settings ***
Documentation    Arquivo que representa a tela de pedido de ajuda

Library    AppiumLibrary

*** Variables ***
${HELP_BTN}     xpath=//android.widget.TextView[@text='Enviar dúvida']
${HELP_TEXT}    xpath=//android.widget.EditText[@text='Escreva sua dúvida aqui']    

*** Keywords ***
Submit Help Order
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${HELP_BTN}       15 
    Click Element                    ${HELP_BTN} 
    
    Wait Until Element Is Visible    ${HELP_TEXT}      15 
    Input Text                       ${HELP_TEXT}      ${text}
    Click Text                       Enviar