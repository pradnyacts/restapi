*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${base_url}     https://reqres.in
${user}         2

*** Test Cases ***
Get_userInfo
    Create Session    mysession     ${base_url}
    ${response}=  GET On Session        mysession        /api/users/${user}
    Log To Console     ${response.status_code}
    Log To Console     ${response.content}
    Should Be Equal As Strings       ${response.status_code}  200
    ${json_response}  Set Variable      ${response.json()}
    Log To Console   ${json_response}
   @{first_name_data}=  Get Value From Json    ${json_response}     data.first_name
   Log To Console    ${first_name_data}
   ${f_name}  Get From List    ${first_name_data}   0
   Should Be Equal    ${f_name}    Janet
   ${Content-TypeValue}=  Get From Dictionary    ${response.headers}     Content-Type
   Should Be Equal      ${Content-TypeValue}   application/json; charset=utf-8


