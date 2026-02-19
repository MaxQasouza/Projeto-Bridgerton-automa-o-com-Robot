*** Settings ***
Library    Browser

*** Variables ***
${LOGIN_TITLE}         css=h1:has-text("Bem vindo(a) de volta!")
${LOGIN_EMAIL}         css=input[id="email"]
${LOGIN_PASSWORD}      css=input[id="password"]
${LOGIN_SUBMIT}        css=button[type="submit"]:has-text("Entrar")
${LOGIN_SIGNUP_LINK}   css=button:has-text("Cadastre-se já!")
${LOGIN_FORGOT_LINK}   css=button:has-text("Esqueceu sua senha?")

*** Keywords ***
Login With Credentials
    [Arguments]    ${email}    ${password}
    Fill Text    ${LOGIN_EMAIL}       ${email}
    Fill Text    ${LOGIN_PASSWORD}    ${password}
    Click    ${LOGIN_SUBMIT}
    Wait For Load State    networkidle

Go To Signup
    Click    ${LOGIN_SIGNUP_LINK}
    Wait For Elements State    css=h1:has-text("Faça seu cadastro")    visible    5s

Go To Forgot Password
    Click    ${LOGIN_FORGOT_LINK}
    Wait For Elements State    css=h2:has-text("Recupere sua senha")    visible    5s
