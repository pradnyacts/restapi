*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String


*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com
${page_path}    $.page
*** Test Cases ***
deletedemo
    create session    session1  ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /posts/1
    ${response}=    delete on session    session1    ${endpoint}
    log to console    ${response.status_code}
    log to console    ${response.content}

       #validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal      ${status_code}     200


