*** Settings ***
Documentation    Representação do componente de notificação

Library    Browser

*** Keywords ***
Open Notifications
    Click       xpath=(//aside//button)[1]

Notification Should Be
    [Arguments]    ${text}

    ${elements}    Set Variable    css=.scrollbar-container p

    Wait For Elements State    ${elements}
    ...                        visible
    ...                        10

    Get Text    ${elements}   equal    ${text}