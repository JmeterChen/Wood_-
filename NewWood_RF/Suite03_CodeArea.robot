*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot
Test Setup       open_bs
Test Teardown       Teardown


*** Test Cases ***
Run_stop_clear
    Click Element    ${tgzy_跳过指引}
    Sleep    0.5
    #运行区运行按钮功能正常
    Mouse over    ${wood_运行}
    Element Should Be Visible    ${wood_运行}
    Element Text Should Be    ${wood_运行}    运行
    #点击运行按钮
    Click Element    ${wood_运行}
    Sleep    0.5
    #等待代码运行完毕
    Wait Until Element Is Visible    ${wood_运行}
    #验证代码中欢迎来到源码世界显示正常
    Mouse over    ${wood_Run_area}
    Element Should Contain    ${wood_welcome}    欢迎来到源码世界！
    Sleep    0.5
    #运行区运行按钮功能正常
    Mouse over    ${wood_运行}
    Element Should Be Visible    ${wood_运行}
    Element Should Contain    ${wood_运行}    运行
    #点击开始运行，等待停止按钮显示
    Click Element    ${wood_运行}
    ##运行区停止按钮功能正常
    #点击运行按钮等待停止按钮出现
    Wait Until Element Is Visible    ${wood_停止}
    Mouse over    ${wood_停止}
    Element Should Be Visible    ${wood_停止}
    Element Should Contain    ${wood_停止}    停止
    #点击停止按钮
    Click Element    ${wood_停止}
    Sleep   0.5
    #验证代码没运行完毕，运行区应该没有输出
    Mouse over    ${wood_Run_area}
    Element Should Not Contain    ${wood_welcome}    欢迎来到源码世界！
    Sleep    1
    #验证清除按钮功能正常
    #先运行代码
    Mouse over    ${wood_运行}
    Element Should Be Visible    ${wood_运行}
    Element Should Contain    ${wood_运行}    运行
    #点击运行按钮
    Click Element    ${wood_运行}
    Sleep    0.5
    #等待代码运行完毕
    Wait Until Element Is Visible    ${wood_运行}
    #验证代码中欢迎来到源码世界显示正常
    Mouse over    ${wood_Run_area}
    Element Should Contain    ${wood_welcome}    欢迎来到源码世界！
    Sleep    0.5
    Mouse over    ${wood_清除}
    Element Should Be Visible    ${wood_清除}
    Element Should Contain    ${wood_清除}    清除
    #点击清除按钮
    Click Element    ${wood_清除}
    Sleep    0.5
    Element Should Not Contain    ${wood_welcome}    欢迎来到源码世界！
    Sleep    0.5




fold_unfold
    Click Element    ${tgzy_跳过指引}
    Sleep    0.5
    #验证收起hover显示正常
    Mouse over    ${wood_收起按钮}
    Element Should Be Visible    ${wood_收起}    收起
    Element Should Be Visible    ${wood_运行}    运行
    Element Text Should Be    ${wood_海龜圖}    海龟图
    #点击收起按钮，验证功能
    Click Element    ${wood_收起按钮}
    Sleep    0.5
    Element Should Not Be Visible    ${wood_收起按钮}
    Element Should Not Be Visible    ${wood_运行}
    Element Should Not Be Visible    ${wood_海龜圖}
    Sleep    0.5
    Click Element    ${wood_展开按钮}
    Mouse over    ${wood_收起按钮}
    Element Should Be Visible    ${wood_收起}
    Element Text Should Be    ${wood_收起}    收起
    Sleep    0.5