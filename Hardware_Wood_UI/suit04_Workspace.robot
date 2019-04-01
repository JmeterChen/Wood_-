*** Settings ***
Test Setup        Open Bs
Test Teardown     Teardown
Library           SeleniumLibrary
Library           RFTestLibrary
Library           AutoItLibrary
Resource          wh_resource.robot
Library           OperatingSystem

*** Test Cases ***
Debug
    #本地文件调试
    AutoItLibrary.Run    ${wood_硬件助手路径}
    sleep    3
    @{test_hex_name}    Find Hex    ${hw_hex_dir}    #查找所有hex文件并将名称存到列表中
    ${length}    Evaluate    len(@{test_hex_name})    #计算列表长度
    Click Element    ${wood_模式切换}
    : FOR    ${i}    IN    @{test_hex_name}
    \    Mouse Over    ${wood_文件}
    \    Click Element    ${wood_从本地打开}
    \    Win Wait    打开    \    5
    \    Win Activate    打开
    \    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\${i}
    \    Sleep    0.5
    \    Control Click    \    \    Button1
    \    Click Element    ${wood_调试}
    \    Wait Until Element Is Not Visible    ${wood_中间状态弹窗}    15
    \    Element Should Contain    ${wood_控制台打印}    正在运行...
    \    Sleep    1
    \    ${text_调试按钮}    Get Text    ${wood_调试}
    \    Run Keyword If    '${text_调试按钮}'=='调试'    Sleep    0.1
    \    ...    ELSE IF    '${text_调试按钮}'=='停止'    Click Element    ${wood_调试}
    \    Sleep    0.1
    #云端文件调试
    Click Element    ${wood_用户选项}
    Wait Until Page Contains Element    ${wood_登录弹窗}    3
    Login
    Sleep    2
    Mouse Over    ${wood_文件}
    Sleep    0.2
    Click Element    ${wood_打开文件}
    Wait Until Page Contains Element    ${wood_打开_从本地打开}    3
    Sleep    0.2
    @{list_云端文件}    Get Webelements    ${wood_云端作品列表}
    @{list}    Set Variable    @{list_云端文件}
    Click Element    ${wood_打开作品弹窗_关闭按钮}
    ${number}    Set Variable    ${1}
    : FOR    ${i}    IN    @{list}
    \    ${number}    evaluate    ${number}+${1}
    \    Mouse Over    ${wood_文件}
    \    Sleep    0.2
    \    Click Element    ${wood_打开文件}
    \    Click Element    ${wood_云端作品}[${number}]
    \    Wait Until Page Contains Element    ${wood_工程文件名}
    \    Sleep    1
    \    Click Element    ${wood_调试}
    \    Wait Until Page Does Not Contain Element    ${wood_中间状态弹窗}    15
    \    Element Should Contain    ${wood_控制台打印}    正在运行...
    \    Sleep    1
    \    ${text_调试按钮}    Get Text    ${wood_调试}
    \    Run Keyword If    '${text_调试按钮}'=='调试'    Sleep    0.1
    \    ...    ELSE IF    '${text_调试按钮}'=='停止'    Click Element    ${wood_调试}
    \    Sleep    0.1

Download
    #设备未连接下载
    Mouse Over    ${wood_文件}
    Sleep    0.2
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_工程文件名}
    Sleep    1
    ${wood_打开作品名}    Get Element Attribute    ${wood_工程文件名}    value
    Remove File    ${wood_作品下载路径}\\${wood_打开作品名}.hex
    Click Element    ${wood_下载}
    Sleep    3
    File Should Exist    ${wood_作品下载路径}\\${wood_打开作品名}.hex
    Element Text Should Be    ${wood_中间状态弹窗}    hex文件已下载\n请将其拷贝到microbit的U盘中\n完成烧录
    Click Element    ${wood_中间状态弹窗_关闭}
    #设备已连接下载
    Hw Connect
    Mouse Over    ${wood_文件}
    Sleep    0.2
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_工程文件名}
    Sleep    1
    Click Element    ${wood_下载}
    Wait Until Element Contains    ${wood_中间状态弹窗}    烧录成功！快去看看microbit吧    20
    Click Element    ${wood_中间状态弹窗_关闭}
    Mouse Over    ${wood_雷电猴图标}
    Sleep    0.2
    Page Should Contain Element    ${wood_microbit选项_未连接图标}
    Element Text Should Be    ${wood_microbit选项_连接按钮}    点击连接
    Sleep    1
