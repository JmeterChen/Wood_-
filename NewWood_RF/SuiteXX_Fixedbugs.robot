*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot
Test Setup       open_bs
Test Teardown       Teardown


*** Test Cases ***

clear_input
    Click Element    ${tgzy_跳过指引}
    Execute Javascript    document.getElementsByClassName('style__project_name__input__4kDDB')[0].value='open-file'
    Sleep    0.5