*** Settings ***
Library    DateTime

*** Keywords ***
Build User
    ${ts}=        Get Current Date    result_format=%Y%m%d%H%M%S
    ${name}=      Set Variable        João Fitness
    ${email}=     Set Variable        user_${ts}@mailinator.com
    ${password}=  Set Variable        Abc@12345
    ${question}=  Set Variable        Qual sua cor favorita ?
    ${answer}=    Set Variable        Azul
    RETURN        ${name}    ${email}    ${password}    ${question}    ${answer}

Build New Password
    ${ts}=         Get Current Date    result_format=%y%m%d%H%M%S
    ${new_pass}=   Set Variable        Nw1@${ts}
    RETURN         ${new_pass}
