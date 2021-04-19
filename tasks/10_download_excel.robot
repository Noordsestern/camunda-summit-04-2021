*** Settings ***
Library    CamundaLibrary    ${CAMUNDA_HOST}
Library    RPA.HTTP
Resource    ../resources/camunda.resource


*** Variables ***
${CAMUNDA_HOST}    http://localhost:8080
${TOPIC}    download_excel.robot
${WORKLOAD}    ${EMPTY}
${EXCEL_FILE}    ${EMPTY}


*** Tasks ***
Add Exceldata to Workflow
    Fetch from Camunda
    Download Excel data
    Send data to Camunda


*** Keywords ***
Download Excel data
    Download    http://rpachallenge.com/assets/downloadFiles/challenge.xlsx    target_file=${OUTPUT_DIR}/challenge.xlsx    overwrite=True
    Set Global Variable    ${EXCEL_FILE}    ${OUTPUT_DIR}/challenge.xlsx

Send data to Camunda
    ${files}    Create Dictionary    data=${EXCEL_FILE}
    Complete task    files=${files}