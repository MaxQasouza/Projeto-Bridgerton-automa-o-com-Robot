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

    &{user}=    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    password=${password}
    ...    question=${question}
    ...    answer=${answer}

    RETURN    ${user}

Build Anamnese
    &{anamnese}=    Create Dictionary
    ...    birthDate=1996-03-15
    ...    height=175
    ...    weight=77
    ...    gender=Masculino

    RETURN    ${anamnese}
