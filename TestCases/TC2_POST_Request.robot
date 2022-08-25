*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://gorest.co.in/public/v2/
${bearerToken}      "Bearer f697706c0d042cba4dbd39d4e0d0ac14ad97231437b21ef3f5576208c3f34090"

*** Test Cases ***
Post new user
    create session    mySession     ${base_url}
    ${body}=    create dictionary    name=AlexSouza    gender=male     email=mail@gmail.com    status=active
    ${header}=      create dictionary    Authorization=${bearerToken}   Content-Type=application/json
    ${response}=     post on session    mySession    users    data=${body}    headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}