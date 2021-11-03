*** Settings ***
Documentation    A test robot for the RobotSpareBinIndustries Login Page
Library    SeleniumLibrary
Library    Screenshot
Resource    ../resources/components.resource

*** Variables ***
${dev}    DAVE

*** Keywords ***

*** Tasks ***
Log In Task
    Set Selenium Speed    0.3
    Open Website
    Maximize Browser Window
    Input Credentials    maria    thoushallnotpass
    Submit Credentials

Order Custom Robot
    Input robot design    Roll_a_thor    DAVE    Spanner_mate
    Get Robot Review
    Place Order
    [Teardown]    Close Browser