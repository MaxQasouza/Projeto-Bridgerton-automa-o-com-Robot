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
    Signup Page Should Be Visible

    ${name}    ${email}    ${password}    ${question}    ${answer}=    Build User
    Fill Signup Form    ${name}    ${email}    ${password}    ${password}    ${question}    ${answer}
    Submit Signup
