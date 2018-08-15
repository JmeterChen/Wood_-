*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot
Test Setup       open_bs
Test Teardown       Teardown



*** Test Cases ***
full_screen
    Click Element    ${tgzy_跳过指引}
    Sleep    0.5
    #验证全屏hover显示正常
    Mouse over    ${wood_全屏按钮}
    Element Should Be Visible    ${wood_全屏}
    Element Should Contain    ${wood_全屏}    全屏
    #验证全屏按钮功能正常
    Click Element    ${wood_全屏按钮}
    Sleep    1
    #验证退出全屏hover显示正常
    Mouse over    ${wood_退出全屏按钮}
    Element Should Be Visible    ${wood_退出全屏}
    Element Should Contain    ${wood_退出全屏}    退出全屏
    #验证退出全屏按钮功能正常
    Click Element   ${wood_退出全屏按钮}
    Sleep    0.5
    #验证退出全屏后全屏hover显示正常
    Mouse over    ${wood_全屏按钮}
    Element Should Be Visible    ${wood_全屏}
    Element Should Contain    ${wood_全屏}    全屏