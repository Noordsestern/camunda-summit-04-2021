*** Settings ***
Library    CamundaLibrary    ${CAMUNDA_HOST}
Library    RPA.Browser.Selenium
Library    RPA.Excel.Files
Resource    ../resources/camunda.resource
Task Setup    Fetch from Camunda


*** Variables ***
${TOPIC}    fill_out_challenge.robot
${CAMUNDA_HOST}    http://localhost:8080


*** Tasks ***
Fill The Forms
    ${people}=    Get The List Of People From The Excel File
    Start The Challenge
    FOR    ${person}    IN    @{people}
        Fill And Submit The Form    ${person}
    END
    Collect The Results


*** Keywords ***
Start The Challenge
    Open Available Browser    http://rpachallenge.com/
    Click Button    Start

Get The List Of People From The Excel File
    ${excel_file}    Download file from variable    data
    Open Workbook    ${excel_file}
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    [Return]    ${table}

Fill And Submit The Form
    [Arguments]    ${person}
    Input Text    //input[@ng-reflect-name="labelFirstName"]    ${person}[First Name]
    Input Text    //input[@ng-reflect-name="labelLastName"]    ${person}[Last Name]
    Input Text    //input[@ng-reflect-name="labelCompanyName"]    ${person}[Company Name]
    Input Text    //input[@ng-reflect-name="labelRole"]    ${person}[Role in Company]
    Input Text    //input[@ng-reflect-name="labelAddress"]    ${person}[Address]
    Input Text    //input[@ng-reflect-name="labelEmail"]    ${person}[Email]
    Input Text    //input[@ng-reflect-name="labelPhone"]    ${person}[Phone Number]
    Click Button    Submit

Collect The Results
    Capture Element Screenshot    css:div.congratulations
    Close All Browsers