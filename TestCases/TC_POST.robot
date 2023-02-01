*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String

*** Variables ***
${base_url}     https://reqres.in
${page_path}    $.page
${id_path}      $.id
&{header}       Content-Type=application/json    charset=utf-8

*** Test Cases ***
POST_userInfo
    Create Session    mysession     ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users
    ${body}=    create dictionary      name=Prad    job=SW engineer
    ${response}=    POST On Session    mysession    ${endpoint}     data=${body}
    log to console    ${response.status_code}
    log to console    ${response.content}

    #validations
    ${status_code}=     convert to string    ${response.status_code}
    should be equal      ${status_code}     201

    ${json_response}=   convert string to json    ${response.content}
    ${contents}=        get value from json    ${json_response}     ${id_path}
    should not be empty    ${contents}

