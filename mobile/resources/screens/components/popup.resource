*** Settings ***
Documentation    Componente que representa o pop-up

Library    AppiumLibrary

*** Variables ***
${OK_BTN}    id=android:id/button1

*** Keywords ***
Confirm Pop-Up
    Wait Until Element Is Visible    ${OK_BTN}         15
    Click Element                    ${OK_BTN} 
