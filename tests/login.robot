*** Settings ***
Resource    ../resources/app.resource
Resource    ../resources/login_page.resource
Resource    ../resources/signup_page.resource
Resource    ../resources/data_factory.resource
Resource    ../resources/anamnese_page.resource
Resource    ../resources/dashboard_page.resource

Suite Setup       Create User And Start
Suite Teardown    End Session

*** Test Cases ***
Login - Success - Returning User
    Go To Home
    Open Login Modal
    Fill Login Form    ${USER}
    Submit Login

    ${anamnese}=    Build Anamnese
    Fill Step 1 Basic Info       ${anamnese}
    Fill Step 2 Activity Level   Ativo
    Fill Step 3 Goal             Ganho de massa
    Fill Step 4 Restrictions     Sem restrições
    Conclude Anamnese

    Dashboard Should Be Visible

*** Keywords ***
Create User And Start
    Start Session
    Go To Home
    Open Login Modal
    Go To Signup From Login
    ${user}=    Build User
    Fill Signup Form    ${user}
    Submit Signup
    Set Global Variable    ${USER}    ${user}
