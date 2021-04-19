*** Settings ***
Library    RPA.Browser.Selenium

*** Keywords ***
Start challenge '${challenge}'
    Open and wait for RPA challenge website
    wait until element is visible    xpath://a[.="${challenge}"]
    click link    xpath://a[.="${challenge}"]
    wait and click button    xpath://button[.="Start"]

Open and wait for RPA challenge website
    Open RPA challenge website
    Set proper browser size

Open RPA challenge website
    ${active_browser}    open available browser    http://www.rpachallenge.com/

Finish Challenge
    Capture Page Screenshot    result-{index}.png
    [Teardown]    Close Browser

Set proper browser size
    set window size    1900    1200