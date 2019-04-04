*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          hex_resource.robot


*** Test Cases ***
demo1
    # log    5
    # log    ${5}
    :FOR    ${i}    IN RANGE    ${5}
    \    Log    ${i}
