*** Settings ***
Library    Browser

*** Keywords ***
Dashboard Should Be Visible
    Wait For Elements State    text=Seja bem-vindo    visible
    Wait For Elements State    text=Acompanhamento Diário    visible