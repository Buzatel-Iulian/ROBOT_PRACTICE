*** Settings ***
Library    OperatingSystem

*** Keywords ***

*** Tasks ***
Cleanup Test Directories
    Empty Directory    ./output/orders
    Empty Directory    ./output/robots
    Empty Directory    ./output/screenshots