*** Settings ***
Library    CamundaLibrary    ${CAMUNDA_HOST}


*** Variables ***
${CAMUNDA_HOST}    http://localhost:8080
${PROCESS_KEY}    rpa_challenge_1


*** Tasks ***
Init process
    Start process    ${PROCESS_KEY}    variables=${{ {'generated': True} }}