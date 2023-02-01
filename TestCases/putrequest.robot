*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String


*** Variables ***
${base_url}     https://reqres.in
${page_path}    $.page
*** Test Cases ***
puttest
    create session    session1  ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users/2
    ${response}=     get on session    session1  ${endpoint}
    ${body}=    create dictionary      name=AAA    job=QA
    ${response}=    put on session    session1    ${endpoint}     data=${body}
    log to console    ${response.status_code}
    log to console    ${response.content}

       #validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal      ${status_code}     200


