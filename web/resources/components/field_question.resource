*** Settings ***
Documentation    Representação do componente de resposta ao campo de perguntas

Library    Browser

*** Keywords ***
Open Question
    
    Click    css=.scrollbar-container p

    Wait For Elements State    xpath=//label[text()="SUA RESPOSTA"]   visible    10


Answer Questions
    [Arguments]    ${admin_answer}
    
    Fill Text    xpath=//textarea[@id="answer"]    ${admin_answer} 
    Sleep    5   

    Click    css=button >> text=Enviar resposta