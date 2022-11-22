*** Settings ***
Documentation       Suite de testes de matricula de alunos
...                 Administrador uma vez logado consegue matricular alunos na academia

Resource            ../resources/base.resource
Resource            ../resources/pages/enroll.resource
Library             Browser


*** Test Cases ***
Deve matricular um aluno
    ${admin}    Create Dictionary
    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    pass=qacademy

    Do Login    ${admin}

    Go to Enrolls
    Go to Enrolls Form
    Select Student    Falcão Não Mexer
    Select Plan    Smart
    Fill Start Date

    Sleep    10
