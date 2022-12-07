*** Settings ***
Documentation    Componente que representa o rodapé

Library    AppiumLibrary

*** Variables ***
${HO_BTN}    xpath=//android.widget.TextView[@text='Pedir ajuda']

*** Keywords ***
Go To Help Order
    Wait Until Element Is Visible    ${HO_BTN}            15
    Click Element                    ${HO_BTN} 