*** Settings ***
Documentation       Suite de testes de login do Administrador
...                 Administrador com permissão deve conseguir logar com e-mail e senha válidos.

Resource            ../resources/base.resource

Test Teardown    Take Screenshot

*** Test Cases ***
Login do Administrador
    Go to Login Page
    Fill Credentiais    admin@smartbit.com    qacademy
    Submit Credentiais
    User Should be Looged In    Admin

Email não cadastrado
    Go to Login Page
    Fill Credentiais    404@smartbit.com    qacademy
    Submit Credentiais
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha inválida
    Go to Login Page
    Fill Credentiais    admin@smartbit.com    abc123
    Submit Credentiais
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Email no Formato Incorreto
    Go to Login Page
    Fill Credentiais    @smartbit.com    abc123
    Submit Credentiais
    Field Type Should Be Email

Senha em Branco
    Go to Login Page
    Fill Credentiais    admin@smartbit.com    ${EMPTY}
    Submit Credentiais
    Alert Text Should Be    password    A senha é obrigatória

Email em Branco
    Go to Login Page
    Fill Credentiais    ${EMPTY}    abc123
    Submit Credentiais
    Alert Text Should Be    email    O e-mail é obrigatório

Email e senha são obrigátorios
    Go to Login Page
    Submit Credentiais
    Alert Text Should Be    password    A senha é obrigatória
    Alert Text Should Be    email    O e-mail é obrigatório
