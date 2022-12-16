*** Settings ***
Documentation    Suite de testes de recebumento de pedido de ajuda

Resource    ../resources/base.resource

Test Teardown    Take Screenshot

*** Test Cases ***
Deve receber uma notificação de pedido de ajuda
    
    # 1a Pessoa => Admin
    # 3a Pessoa => (João)  

    # Dado que tenho um aluno cadastrado
    
    ${admin}   Get Fixture    admin    
    ${joao}    Get Fixture    joao   

    Reset Student       ${joao}[student][email]

    ${token}         Get Service Token    ${admin}
    ${student_id}    POST New Student     ${token}     ${joao}[student]

    # Quando esse aluno (João) envia um pedido de ajuda via mobile

    POST Question    ${student_id}   ${joao}[question]

    # Então devo ver uma notificação no painel do administrador
    
    Do Login    ${admin}
    Open Notifications
    NOtification Should Be    ${joao}[question]    

Deve poder responder um pedido de ajuda

    # Dado que abri um novo pedido de ajuda

    ${admin}   Get Fixture    admin    
    ${max}     Get Fixture     max

    Reset Student       ${max}[student][email]

    ${token}         Get Service Token    ${admin}
    ${student_id}    POST New Student     ${token}     ${max}[student]

    POST Question    ${student_id}        ${max}[question]

    Do Login         ${admin}
    Open Notifications
    Notification Should Be    ${max}[question]
    
    Open Question

    # Quando respondo esse pedido
   
    Answer Questions    O ideal é correr durante 45 minutos na esteira, de 4 a 5 vezes por semana.  

    # Então devo ver uma mensagem de sucesso

    Verify Toaster    Resposta enviada com sucesso    
