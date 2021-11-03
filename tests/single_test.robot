*** Settings ***
Documentation    A test robot for the RobotSpareBinIndustries Login and Order Pages
Library    SeleniumLibrary
Library    Screenshot
Resource    ../resources/components.resource

*** Variables ***
${rhead}    DAVE
${rbody}    DAVE
${rlegs}    DAVE
${base_speed}    0
${wait_speed}    0.5
${user_id}    maria
${user_pass}    thoushallnotpass

*** Keywords ***

*** Tasks ***

Test Setup
    Set Selenium Speed    ${base_speed}
    Open Website
    Maximize Browser Window

Log In Task
    Input Credentials    ${user_id}    ${user_pass}
    Submit Credentials

Order Custom Robot
    Input robot design    ${rhead}    ${rbody}    ${rlegs}
    Get Robot Review
    Place Order

Close Setup
    Log    Done.
    Log To Console    Done Testing
    [Teardown]    Close Browser