*** Settings ***
Documentation    A test robot for repeated RobotSpareBinIndustries Robot orders
Library    SeleniumLibrary
Library    Screenshot
Library    OperatingSystem
Resource    ../resources/components.resource

*** Variables ***

${base_speed}    0
${wait_speed}    0.5
${robots}    resources/model_orders.json

*** Keywords ***

*** Tasks ***

Browser Setup
    Set Selenium Speed    ${base_speed}
    Open Website
    Maximize Browser Window

Order Custom Robots
    ${file}    Get File    ${robots}
    ${models}    Evaluate    json.loads($file)    json
    #Log To Console    Test access json: ${models["2"]["head"]}        # Tested access to elements
    FOR    ${element}    IN    @{models}
        Log To Console    Ordering robot nr.${element}
        Log    Ordering robot nr.${element}
        Input robot design    ${models["${element}"]["head"]}    ${models["${element}"]["body"]}    ${models["${element}"]["legs"]}
        Get Robot Review
        Place Order
        Return Home
    END

Close Setup
    Log    Done.
    Log To Console    Done Testing
    [Teardown]    Close Browser