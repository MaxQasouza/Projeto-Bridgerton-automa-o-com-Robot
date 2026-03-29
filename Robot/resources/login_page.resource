*** Settings ***
Library    Browser

*** Variables ***
${INP_LOGIN_EMAIL}       css=input[name="email"]:visible
${INP_LOGIN_PASSWORD}    css=input[name="password"]:visible
${BTN_LOGIN}             css=button[type="submit"]:has-text("Entrar")

*** Keywords ***
Fill Login Form
    [Arguments]    ${user}
    Fill Text    ${INP_LOGIN_EMAIL}       ${user.email}
    Fill Text    ${INP_LOGIN_PASSWORD}    ${user.password}

Submit Login
    Click    ${BTN_LOGIN}
    Wait For Load State    networkidle