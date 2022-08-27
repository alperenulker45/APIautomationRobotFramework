*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}         https://gorest.co.in/public/v2/
${bearerToken}      Bearer 8bef0d339d5ea79cf4e015e51edc31cf296d00754539a3c0e44c51f1576f3374

*** Test Cases ***
Post new user
    create session    mySession     ${base_url}
    ${body}=    create dictionary    name=Alperen    gender=male     email=mail@gmail.com    status=active
    ${header}=      create dictionary       Authorization=${bearerToken}
    ${response}=     post on session    mySession   users   data=${body}   headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}