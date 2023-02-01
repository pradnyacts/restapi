*** Settings ***
Library                 RequestsLibrary

*** Variables ***
${base_Url}     https://gorest.co.in

*** Test Cases ***
Quick Get Request Test
    Create Session    mySession    ${base_Url}
    ${response}=    Get Request    mySession    /public/v2/users
    Log To Console    ${response.status_code}