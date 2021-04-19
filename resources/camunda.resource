*** Settings ***
Library     CamundaLibrary    ${CAMUNDA_HOST}


*** Keywords ***
Fetch from Camunda
    ${local_workload}    Fetch Workload    ${TOPIC}    lock_duration=3000    async_response_timeout=3000
    Pass Execution If    not ${local_workload}    Quit task silently, since there is nothing to process.
    Set Global Variable    ${WORKLOAD}    ${local_workload}