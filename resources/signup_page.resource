*** Settings ***
Library    Browser

*** Variables ***
${INP_FULLNAME}        css=#fullName
${INP_EMAIL}           css=#email
${INP_PASSWORD}        css=#password
${INP_CONFIRM_PASS}    css=#confirmPassword
${SEL_SECRET_Q}        css=#secretQuestion
${INP_SECRET_A}        css=#secretAnswer
${BTN_SUBMIT}          css=button[type="submit"]

*** Keywords ***
Signup Page Should Be Visible
    Wait For Elements State    ${INP_FULLNAME}    visible

Fill Signup Form
    [Arguments]    ${name}    ${email}    ${password}    ${confirmPassword}    ${questionLabel}    ${answer}
    Fill Text    ${INP_FULLNAME}        ${name}
    Fill Text    ${INP_EMAIL}           ${email}
    Fill Text    ${INP_PASSWORD}        ${password}
    Fill Text    ${INP_CONFIRM_PASS}    ${confirmPassword}
    Select Options By    ${SEL_SECRET_Q}    label    ${questionLabel}
    Fill Text    ${INP_SECRET_A}        ${answer}

Submit Signup
    Wait For Elements State    ${BTN_SUBMIT}    visible
    Click    ${BTN_SUBMIT}
    Wait For Load State    networkidle
