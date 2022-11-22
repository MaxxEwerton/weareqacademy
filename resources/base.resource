*** Settings ***
Documentation       Aqui onde ficará as resources

Resource            components/navbar.resource
Resource            components/toast.resource
Resource            pages/login.resource


*** Keywords ***
#Helpers
Do Login
    [Arguments]    ${user}
    Go to Login Page
    Fill Credentiais    ${user}[email]    ${user}[pass]
    Submit Credentiais
    User Should be Looged In    ${user}[name]
