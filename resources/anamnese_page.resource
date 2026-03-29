*** Settings ***
Library    Browser

*** Variables ***
# Passo 1
${INP_BIRTHDATE}    css=input[name="birthDate"]
${INP_HEIGHT}       css=input[name="height"]
${INP_WEIGHT}       css=input[name="weight"]
${SEL_GENDER}       css=select[name="gender"]

# Passo 4
${CHK_LGPD}         css=input[name="lgpdConsent"]

# Navegação
${BTN_AVANCAR}      text=Avançar
${BTN_CONCLUIR}     text=Concluir formulário

*** Keywords ***
Anamnese Should Be Visible
    Wait For Elements State    text=Queremos saber mais sobre você    visible

Fill Step 1 Basic Info
    [Arguments]    ${anamnese}
    Fill Text    ${INP_BIRTHDATE}    ${anamnese.birthDate}
    Fill Text    ${INP_HEIGHT}       ${anamnese.height}
    Fill Text    ${INP_WEIGHT}       ${anamnese.weight}
    Select Options By    ${SEL_GENDER}    label    ${anamnese.gender}
    Click    ${BTN_AVANCAR}
    Wait For Elements State    text=1/4    hidden

Fill Step 2 Activity Level
    [Arguments]    ${activity}
    Wait For Elements State    text=2/4    visible
    Click    css=button span.font-bold:text-is("${activity}")
    Click    ${BTN_AVANCAR}

Fill Step 3 Goal
    [Arguments]    ${goal}
    Wait For Elements State    text=3/4    visible
    Click    css=button span.font-bold:text-is("${goal}")
    Click    ${BTN_AVANCAR}
    
Fill Step 4 Restrictions
    [Arguments]    ${restriction}
    Wait For Elements State    text=4/4    visible
    Click    css=label:has-text("${restriction}")
    Click    ${CHK_LGPD}
    Click    ${BTN_AVANCAR}

Conclude Anamnese
    Wait For Elements State    text=Meta Calórica Diária    visible
    Click    ${BTN_CONCLUIR}
    Wait For Load State    networkidle