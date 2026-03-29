*** Variables ***
${LOGIN_MODAL}        css=div:has(h1:has-text("Bem vindo(a) de volta!"))
${FORGOT_LINK}        ${LOGIN_MODAL} >> text=Esqueceu sua senha?

${RECOVERY_TITLE}     text=Recupere sua senha
${RECOVERY_EMAIL}     css=#recoveryEmail
${RECOVERY_SUBMIT}    text=Recuperar senha

*** Keywords ***
Go To Forgot Password
    Click    ${FORGOT_LINK}
    Wait For Elements State    ${RECOVERY_TITLE}    visible

Request Password Recovery
    [Arguments]    ${email}
    Fill Text    ${RECOVERY_EMAIL}    ${email}
    Click    ${RECOVERY_SUBMIT}
    Wait For Load State    networkidle