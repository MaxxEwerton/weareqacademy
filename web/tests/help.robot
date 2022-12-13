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

    Sleep    5        