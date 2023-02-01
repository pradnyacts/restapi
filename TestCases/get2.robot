*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String


*** Variables ***
${base_url}     https://reqres.in
${page_path}    $.page
*** Test Cases ***
Get_requesttest
    create session    session1  ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users?page=2
    ${response}=     get on session    session1  ${endpoint}
    log to console     ${response.headers}
    log to console     ${response.status_code}
    log to console     ${response.content}
    log                 ${response.content}

    #validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}       200

    ${json_response}=       convert string to json    ${response.content}
    ${contents}=            get value from json          ${json_response}   ${page_path}
    ${contents}=            convert to string       ${contents}
    ${contents}=            remove string using regexp    ${contents}       [.\\[\\],]
    should be equal           ${contents}       2

    ${headervalue}=     get from dictionary    ${response.headers}      Content-Type
    should be equal     ${headervalue}      application/json; charset=utf-8