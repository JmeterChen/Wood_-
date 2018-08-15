*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot
Test Setup       open_bs
Test Teardown       Teardown


*** Test Cases ***
code_pattern
    Click Element    ${tgzy_跳过指引}
    #默认模式为积木模式
    Element Should Be Visible    ${wood_代码模式}
    #验证切换模式按钮正常显示
    Mouse over    ${wood_代码模式}
    Element Should Contain    ${wood_代码模式}     代码模式
    Element Should Be Visible    ${shijian_事件}
    Element Should Contain    ${shijian_事件}    事件
    Sleep    0.4
    Page Should Not Contain Element    ${wood_白天}
    #模式切换按钮功能正常（积木切换到代码）
    Click Element    ${wood_代码模式}
    Sleep    0.5
    Mouse over    ${wood_太阳}
    Element Should Be Visible    ${wood_白天}    白天
    Sleep    0.4
    Element Should Be Visible     ${wood_积木模式}
    Element Should Contain    ${wood_积木模式}     积木模式

sun_night
    Click Element    ${tgzy_跳过指引}
    Click Element    ${wood_代码模式}
    Sleep    0.5
    #验证太阳hover显示正常
    Mouse over    ${wood_太阳}
    #验证白天模式下只显示白天，夜间隐藏
    Element Text Should Be    ${wood_白天}    白天
    Element Should Not Be Visible    ${wood_月亮}
    #点击太阳图标，切换到夜间模式
    Click Element    ${wood_白天}
    Sleep    0.5
    #验证切换夜间模式成功，页面中月亮hover显示正常
    Mouse over    ${wood_月亮}
    #验证夜间模式下只显示夜间，白天隐藏
    Element Text Should Be    ${wood_夜间}    夜间
    Click Element    ${wood_月亮}
    Sleep    0.5
    #验证切换日间模式成功，页面中太阳hover显示正常
    Element Should Be Visible    ${wood_太阳}
    Mouse over    ${wood_太阳}
    Element Should Contain    ${wood_白天}    白天
    Element Should Not Be Visible    ${wood_月亮}