*** Settings ***
Library    Browser

*** Variables ***
${INP_FULLNAME}        css=#fullName
${INP_EMAIL}           css=input[name="email"]:visible
${INP_PASSWORD}        css=input[name="password"]:visible
${INP_CONFIRM_PASS}    css=#confirmPassword
${SEL_SECRET_Q}        css=#secretQuestion
${INP_SECRET_A}        css=#secretAnswer
${BTN_SUBMIT}    text=Cadastrar

*** Keywords ***
Signup Page Should Be Visible
    Wait For Elements State    ${INP_FULLNAME}    visible

Fill Signup Form
    [Arguments]    ${user}
    Fill Text    ${INP_FULLNAME}        ${user.name}
    Fill Text    ${INP_EMAIL}           ${user.email}
    Fill Text    ${INP_PASSWORD}        ${user.password}
    Fill Text    ${INP_CONFIRM_PASS}    ${user.password}
    Select Options By    ${SEL_SECRET_Q}    label    ${user.question}
    Fill Text    ${INP_SECRET_A}        ${user.answer}

Submit Signup
    Wait For Elements State    ${BTN_SUBMIT}    visible
    Click    ${BTN_SUBMIT}
    Wait For Load State    networkidle
