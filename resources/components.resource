*** Settings ***

Documentation    Main operations used to test the website
Library    SeleniumLibrary
Library    Screenshot

*** Variables ***

&{Heads}    Roll_a_thor=1    Peanut_crusher=2    DAVE=3    Andy_Roid=4    Spanner_mate=5    Drillbit_2000=6
&{Bodies}    Roll_a_thor=id-body-1    Peanut_crusher=id-body-2    DAVE=id-body-3    Andy_Roid=id-body-4    Spanner_mate=id-body-5    Drillbit_2000=id-body-6
&{Legs}    Roll_a_thor=1    Peanut_crusher=2    DAVE=3   Andy_Roid=4    Spanner_mate=5    Drillbit_2000=6
${base_speed}    0
${wait_speed}    0
${BROWSER}    chrome
${WEBSITE}    https://robotsparebinindustries.com/#/

*** Keywords ***

Open Website
    Open Browser    ${WEBSITE}    ${BROWSER}

Input Credentials
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Text    password    ${password}
Submit Credentials
    Click Button    Log in

Input robot design
    [Arguments]    ${head}    ${body}    ${leg}
    Click Link    Order your robot!
    Click Button    I guess so...
    #    Options for each of the following are:    Roll_a_thor    Peanut_crusher    DAVE    Andy_Roid    Spanner_mate    Drillbit_2000
    Select From List By Index    id:head    ${Heads.${head}}
    Select Radio Button    body    ${Bodies.${body}}
    Input Text    class:form-control    ${Legs.${leg}}
    Input Text    address    Romania

Get Robot Review
    Set Selenium Speed    ${wait_speed}
    Click Button    id:preview
    Set Selenium Speed    ${base_speed}
    Scroll Element Into View    id:robot-preview-image
    #Screenshot.Set Screenshot Directory    ./output/robots
    #Screenshot.Take Screenshot
    SeleniumLibrary.Set Screenshot Directory    ./output/robots
    Capture Element Screenshot    id:robot-preview-image
    SeleniumLibrary.Set Screenshot Directory    ./output/screenshots

Place Order
    Click Button    id:order
    Set Selenium Speed    ${wait_speed}
    Element Should Be Visible    id:receipt
    Set Selenium Speed    ${base_speed}
    SeleniumLibrary.Set Screenshot Directory    ./output/orders
    Capture Element Screenshot    id:receipt
    SeleniumLibrary.Set Screenshot Directory    ./output/screenshots

Try to place order
    Click Button    id:order
    Set Selenium Speed    ${wait_speed}
    ${present}    Run Keyword And Return Status    Element Should Be Visible    id:receipt
    IF    ${present} == True
        Set Selenium Speed    ${base_speed}
        SeleniumLibrary.Set Screenshot Directory    ./output/orders
        Capture Element Screenshot    id:receipt
        SeleniumLibrary.Set Screenshot Directory    ./output/screenshots
    ELSE
        Set Selenium Speed    ${base_speed}
        Log To Console    ! Failed to order !
        SeleniumLibrary.Set Screenshot Directory    ./output/other
        Capture Page Screenshot
        SeleniumLibrary.Set Screenshot Directory    ./output/screenshots
    END

Return Home
    Click Link    Home


Log everywhere
    [Arguments]    ${message}
    Log    ${message}
    Log To Console    ${message}