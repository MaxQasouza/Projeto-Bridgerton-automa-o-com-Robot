*** Settings ***
Library    Browser

*** Variables ***
${LOGIN_MODAL}            css=div:has(h1:has-text("Bem vindo(a) de volta!"))
${FORGOT_LINK}            ${LOGIN_MODAL} >> css=button:has-text("Esqueceu sua senha?")

${RECOVERY_EMAIL_MODAL}   css=div:has(h2:has-text("Recupere sua senha")):has(input#recoveryEmail)
${RECOVERY_EMAIL}         ${RECOVERY_EMAIL_MODAL} >> id=recoveryEmail
${RECOVERY_SUBMIT}        ${RECOVERY_EMAIL_MODAL} >> css=button[type="submit"]:has-text("Recuperar senha")

${RESET_MODAL}            css=div:has(h2:has-text("Recupere sua senha")):has(input#answer)
${RESET_ANSWER}           ${RESET_MODAL} >> id=answer
${RESET_PASSWORD}         ${RESET_MODAL} >> id=password
${RESET_CONFIRM}          ${RESET_MODAL} >> id=confirmPassword
${RESET_SUBMIT}           ${RESET_MODAL} >> css=button[type="submit"]:has-text("Cadastrar nova senha")
${RESET_SUCCESS}          ${RESET_MODAL} >> css=p:has-text("Senha alterada com sucesso")

*** Keywords ***
Go To Forgot Password
    Click    ${FORGOT_LINK}
    Wait For Elements State    ${RECOVERY_EMAIL}    visible

Request Password Recovery
    [Arguments]    ${email}
    Fill Text    ${RECOVERY_EMAIL}    ${email}
    Click        ${RECOVERY_SUBMIT}
    Wait For Elements State    ${RESET_ANSWER}    visible

Reset Password With Answer
    [Arguments]    ${answer}    ${new_password}
    Fill Text    ${RESET_ANSWER}    ${answer}
    Fill Text    ${RESET_PASSWORD}  ${new_password}
    Fill Text    ${RESET_CONFIRM}   ${new_password}
    Click        ${RESET_SUBMIT}
    Wait For Load State    networkidle
    Wait For Load State    networkidle

Assert Password Changed Successfully
    Wait For Elements State    ${RESET_SUCCESS}    visible
