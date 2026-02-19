*** Settings ***
Resource    ../resources/app.resource
Resource    ../resources/recovery_page.resource
Resource    ../resources/data_factory.resource

Suite Setup       Start Session
Suite Teardown    End Session

*** Test Cases ***
Recover Password - Success
    Go To Home
    Open Login Modal
    Go To Forgot Password
    Request Password Recovery    maxswell96@teste.com
    ${new_password}=    Build New Password
    Reset Password With Answer    branco    ${new_password}
    Assert Password Changed Successfully
