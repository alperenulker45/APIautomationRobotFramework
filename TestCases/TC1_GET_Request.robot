*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://gorest.co.in/public/v2/
${type}     users

*** Test Cases ***
Get user info
    create session    mySession     ${base_url}
    ${response}=    get on session    mySession        ${type}

    #VALIDATIONS
    ${status_code}=     convert to string   ${response.status_code}
    should be equal    ${status_code}   200

    ${body}=     convert to string    ${response.content}
    should contain    ${body}   2894
    log to console    ${body}

    ${contentTypeValue}=   get from dictionary    ${response.headers}   Content-Type
    should be equal    ${contentTypeValue}      application/json; charset=utf-8

Get user by ID
    create session    getUserById   ${base_url}
    ${response}=    get on session      getUserById    ${type}/2880
    ${body}=    convert to string    ${response.content}
    log to console    ${body}
    ${status_code}=     convert to string     ${response.status_code}
    should be equal    ${status_code}   200