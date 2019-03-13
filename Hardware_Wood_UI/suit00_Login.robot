*** Settings ***
Test Setup        Open Bs
Test Teardown     Teardown
Library           SeleniumLibrary
Resource          wh_resource.robot

*** Test Cases ***
Not_login
    #验证title是否正确
    Title Should Be    编程猫海龟编辑器
    #验证未登录 显示中文
    Element Text Should Be    ${wood_未登录}    未登录
    #验证未登录显示中文繁体
    Switch Language    zh-hant
    Element Text Should Be    ${wood_未登录}    未登錄
    #验证未登录显示英文
    Switch Language    en
    Element Text Should Be    ${wood_未登录}    Not login

Login
    #验证登录功能正常
    Page Should Contain    未登录
    Click Element    ${wood_登录入口}
    Wait Until Page Contains Element    ${wood_登录弹窗}    3
    Input Text    ${wood_用户名输入}    ${username}
    Input text    ${wood_密码输入}    ${password}
    Click Element    ${wood_登录按钮}
    Sleep    1
    Page Should Not Contain    未登录


Log_off
    Click Element    ${wood_登录入口}
    Wait Until Page Contains Element    ${wood_登录弹窗}    3
    Login
    Mouse Over    ${wood_用户选项}
    Click Element    ${wood_退出登录}
    Wait Until Page Contains Element    ${wood_未登录}    3
    Sleep    1
    Element Text Should Be    ${wood_未登录}    未登录
