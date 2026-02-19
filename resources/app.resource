*** Settings ***
Library    Browser

*** Variables ***
${BASE_URL}     https://bridgerton.qacoders.dev.br
${TIMEOUT}      15s

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=True
    New Context    ignoreHTTPSErrors=True
    Set Browser Timeout    ${TIMEOUT}

End Session
    Close Browser

Go To Home
    New Page    ${BASE_URL}/
    Wait For Load State    load

Open Login Modal
    Wait For Elements State    text=Acessar    visible
    Click    text=Acessar
    Wait For Elements State    text=Bem vindo(a) de volta!    visible

Go To Signup From Login
    Wait For Elements State    text=Cadastre-se já!    visible
    Click    text=Cadastre-se já!
    Wait For Elements State    text=Faça seu cadastro    visible
