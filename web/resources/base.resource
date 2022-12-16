*** Settings ***
Documentation       Aqui onde ficará as resources

Resource            components/navbar.resource
Resource            components/toast.resource
Resource            components/notification.resource
Resource            components/field_question.resource
Resource            pages/login.resource
Resource            pages/enroll.resource

Resource            services/sessions.resource
Resource            services/students.resource

Resource            database.resource

Library             Browser
Library             JSONLibrary

*** Keywords ***
#Helpers
Do Login
    [Arguments]    ${user}
    Go to Login Page
    Fill Credentiais    ${user}[email]    ${user}[password]
    Submit Credentiais
    User Should be Looged In    ${user}[name]

Get Fixture
    [Arguments]    ${fixture_file}
    ${fixture}    Load Json From File    ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...                                  encoding=UTF-8

    [return]       ${fixture}    
