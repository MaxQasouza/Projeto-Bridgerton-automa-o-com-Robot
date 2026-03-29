*** Settings ***
Resource    ../resources/app.resource
Resource    ../resources/signup_page.resource
Resource    ../resources/data_factory.resource

Suite Setup       Start Session
Suite Teardown    End Session

*** Test Cases ***
Signup - Success
    Go To Home
    Open Login Modal
    Go To Signup From Login

    ${user}=    Build User

    Fill Signup Form    ${user}
    Submit Signup

    Set Global Variable    ${USER}    ${user}