*** Settings ***
Test Setup        Open Bs
Test Teardown     Teardown
Library           SeleniumLibrary
Resource          wh_resource.robot
Library           AutoItLibrary
Library           RFTestLibrary
Library           OperatingSystem

*** Test Cases ***
Website
    Click Element    ${wood_官网}
    Select Window    NEW
    Run Keyword If    '${url}'=='https://test-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://test-python.maocode.cn/
    ...    ELSE IF    '${url}'=='https://staging-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://staging-python.maocode.cn/
    ...    ELSE IF    '${url}'=='https://wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://python.maocode.cn/


i18n_default
    @{path_of_Element}    Create List    ${hex_文件}    ${wood_保存}    ${wood_模式切换}    ${wood_登录入口}    ${hex_block_基本}
    ...    ${hex_block_事件}    ${hex_block_控制}    ${hex_block_运算}    ${hex_block_字符串}    ${hex_block_变量}
    ...    ${hex_block_列表}    ${hex_block_字典}    ${hex_block_函数}    ${hex_调试}    ${hex_下载}
    @{element_text_default}    Create List    文件    保存    代码模式    未登录    基本    事件    控制    运算    字符串    变量    列表    字典    函数
    ...    调试    下载
    @{element_text_en}    Create List    File    Save    Code    Not login    Basic    Events    Control    Operators    Strings    Variable
    ...    Lists    Dictionary    Functions    Debug    Download
    @{element_text_zh_hant}    Create List    文件    保存    代碼模式    未登錄    基本    事件    控制    運算    字符串    變量    列表    字典    函數
    ...    調試    下載
    ${len_list}    Get Length    ${path_of_Element}
    : FOR    ${i}    IN RANGE    ${len_list}
    \    Element Text Should Be    ${path_of_Element[${i}]}     ${element_text_default[${i}]}
    Mouse Over    ${hex_文件}
    Page Should Contain Element    ${hex_打开_common}    limit = 6
    @{文件_hover_default}    Create List    打开    新建    另存为    模板作品    保存到本地    从本地打开
    :FOR    ${i}    IN RANGE    ${6}
    \     Element Text Should Be    ${hex_打开_common}[${i}+1]    ${文件_hover_default[${i}]}
    Mouse Over    ${hex_Microbit}
    Element Text Should Be    ${hex_Microbit_点击连接}    点击连接
    Element Should Contain    ${hex_Microbit_添加扩展}    添加扩展积木
    Element Text Should Be    ${hex_Microbit_下载助手}    下载编程猫硬件助手
    Switch Language    zh-hant
    Mouse Over    ${hex_文件}
    Page Should Contain Element    ${hex_打开_common}    limit = 6
    @{文件_hover_zh_hant}    Create List    打開    新建    另存為    模板作品    保存到本地    從本地打開
    :FOR    ${i}    IN RANGE    ${6}
    \     Element Text Should Be    ${hex_打开_common}[${i}+1]    ${文件_hover_zh_hant[${i}]}
    Mouse Over    ${hex_Microbit}
    Element Text Should Be    ${hex_Microbit_点击连接}    點擊鏈接
    Element Should Contain    ${hex_Microbit_添加扩展}    添加擴展積木
    Element Text Should Be    ${hex_Microbit_下载助手}    下載編程貓硬件助手
    Switch Language    en
    Mouse Over    ${hex_文件}
    Page Should Contain Element    ${hex_打开_common}    limit = 6
    @{文件_hover_en}    Create List    Open   New    Save as    Templates    Save to local    Local project
    :FOR    ${i}    IN RANGE    ${6}
    \     Element Text Should Be    ${hex_打开_common}[${i}+1]    ${文件_hover_en[${i}]}
    Mouse Over    ${hex_Microbit}
    Element Text Should Be    ${hex_Microbit_点击连接}    Connect
    Element Should Contain    ${hex_Microbit_添加扩展}    Add extension
    Element Text Should Be    ${hex_Microbit_下载助手}    Download Hardware Assistant


open_cloud_file
    Mouse Over    ${hex_文件}
    Click Element    ${wood_打开}
    Login
    Mouse Over    ${hex_文件}
    Click Element    ${wood_打开}
    Element Should Be Visible    ${wood_打开文件}     打开文件
    Element Text Should Be    ${wood_cloud_从本地打开}     从本地打开
    ${cloud_name1}    Get Text    ${wood_cloud_name1}
    Click Element    ${wood_cloud_作品1框}
    Sleep    2
    ${input_name}    Get Value    ${wood_作品文件名}
    Should Be Equal    ${cloud_name1}    ${input_name}
    Click Element    ${wood_模式切换}
    Mouse Over    ${hex_文件}
    Click Element    ${wood_打开}
    Element Text Should Be    ${wood_cloud_从本地打开}     从本地打开


Open_local_files
    #未登录打开本地hex文件
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_作品文件名}
    Sleep    1
    ${wood_打开作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    01hellobit    ${wood_打开作品名}
    #未登录打开本地py文件
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\欢迎来到源码世界.py
    Sleep    0.5
    Control Click    \    \    Button1
    Wait Until Keyword Succeeds    2 min    5 sec    Title Should Be    编程猫海龟编辑器
    Sleep    2
    Select Window    CURRENT
    Run Keyword If    '${url}'=='https://dev-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://dev-wood.maocode.cn
    ...    ELSE IF    '${url}'=='https://test-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://test-wood.maocode.cn
    ...    ELSE IF    '${url}'=='https://staging-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://staging-wood.maocode.cn
    ...    ELSE IF    '${url}'=='https://wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://wood.maocode.cn
    Sleep    1
    #Close Window
    Select Window    url=${url}
    #未登录打开非hex和py文件
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\新建 RTF 文档.rtf
    Sleep    0.5
    Control Click    \    \    Button1
    sleep    0.1s
    Wait Until Page Contains Element    ${wood_非hex文件打开警告}
    Element Text Should Be    ${wood_非hex文件打开警告}    请打开 .py 或 .hex 后缀的文件
    Sleep    2
    #登录打开文件
    Mouse Over    ${hex_文件}
    Click Element    ${wood_打开}
    Login
    Mouse Over    ${hex_文件}
    Click Element    ${wood_打开}
    Wait Until Page Contains Element    ${wood_cloud_从本地打开}
    #验证弹窗页面元素，打开本地，搜索，关闭按钮
    Page Should Contain Element    ${wood_cloud_从本地打开}
    Page Should Contain Element    ${wood_关键词搜索作品}
    Page Should Contain Element    ${wood_cloud_close}
    Click Element    ${wood_cloud_框框1}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_作品文件名}
    Sleep    1s
    ${wood_打开作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    01hellobit    ${wood_打开作品名}
    #登录打开py文件
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\欢迎来到源码世界.py
    Sleep    0.5
    Control Click    \    \    Button1
    Wait Until Keyword Succeeds    2 min    5 sec    Title Should Be    编程猫海龟编辑器
    Select Window    CURRENT
    Run Keyword If    '${url}'=='https://dev-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://dev-wood.maocode.cn
    ...    ELSE IF    '${url}'=='https://test-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://test-wood.maocode.cn
    ...    ELSE IF    '${url}'=='https://staging-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://staging-wood.maocode.cn
    ...    ELSE IF    '${url}'=='https://wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://wood.maocode.cn
    Sleep    1
    Select Window    url=${url}
    #登录打开非hex和py文件
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\新建 RTF 文档.rtf
    Sleep    0.5
    Control Click    \    \    Button1
    Sleep    0.1s
    Wait Until Page Contains Element    ${wood_非hex文件打开警告}
    Element Text Should Be    ${wood_非hex文件打开警告}    请打开 .py 或 .hex 后缀的文件

NewBuild_without_saveToast
    #验证新建功能
    Mouse Over    ${hex_文件}
    Click Element    ${wood_新建}
    Sleep    1s
    ${wood_新建作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    ${wood_新建作品名}    新的作品
    #验证打开本地作品后新建功能
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Sleep    2
    Mouse Over    ${hex_文件}
    Click Element    ${wood_新建}
    Sleep    1s
    ${wood_新建作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    ${wood_新建作品名}    新的作品

newBuild_with_saveToast
    #验证未登录积木打开本地作品自动修改后，新建时弹出save弹窗
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\must_change.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Sleep    2
    ${wood_新建作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    ${wood_新建作品名}    must_change
    NewBuilt_withToast
    Click Element    ${wood_save_close}
    # 积木模式下关闭save保存弹窗，再次点击新建触发确保save弹窗
    NewBuilt_withToast
    Click Element    ${wood_save_cancle}
    # 切换代码模式下点击新建确保触发save弹窗
    Click Element    ${wood_模式切换}
    Page Should Contain    from microbit import *
    NewBuilt_withToast
    Click Element    ${wood_save_close}
    # 代码模式下关闭save保存弹窗，再次点击新建触发确保save弹窗
    Mouse Over    ${hex_文件}
    NewBuilt_withToast
    Click Element    ${wood_save_cancle}


newBuild_saveToast_confirm
    #验证未登录积木打开本地作品自动修改后，新建时弹出save弹窗
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\must_change.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Sleep    2
    ${wood_新建作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    ${wood_新建作品名}    must_change
    NewBuilt_withToast
    Click Element    ${wood_save_confirm}
    Sleep    1
    ${wood_新建作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    ${wood_新建作品名}    新的作品


Save
    #验证未登录保存功能
    Click Element    ${wood_保存}
    Page Should Contain Element    ${wood_登录弹窗}
    #验证已登录后保存功能
    Login
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    sleep    1s
    ${wood_作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    ${wood_作品名}    01hellobit
    Click Element    ${wood_保存}
    Sleep    0.1
    Wait Until Page Contains Element    ${wood_保存toast提示}
    Element Text Should Be    ${wood_保存toast提示}    保存成功
    Mouse Over    ${hex_文件}
    Click Element    ${wood_打开}
    Sleep    1s
    ${wood_云端作品名}    Get Text    ${wood_cloud_name1}
    Should Be Equal    ${wood_云端作品名}    01hellobit
    Click Element    ${wood_cloud_close}
    #删除云端产生的垃圾数据
    Mouse Over    ${wood_登录入口}
    sleep    0.2s
    Click Element    ${wood_我的作品}
    Select Window    New
    Wait Until Page Contains Element    ${wood_我的作品列表first}    10
    Mouse Over    ${wood_我的作品列表first}
    Click Element    ${wood_我的作品列表first}/div[2]
    Click Element    ${wood_我的作品删除}
    Sleep    0.2s


Save_as
    #验证未登录另存为功能
    Mouse Over    ${hex_文件}
    Sleep    0.2
    Click Element    ${wood_另存为}
    Page Should Contain Element    ${wood_登录弹窗}
    #验证已登录后另存为功能
    Login
    Mouse Over    ${hex_文件}
    Sleep    0.2
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Sleep    0.5
    ${wood_作品名}    Get Element Attribute    ${wood_作品文件名}    value
    Should Be Equal    ${wood_作品名}    01hellobit
    Mouse Over    ${hex_文件}
    Sleep    0.2
    Click Element    ${wood_另存为}
    Wait Until Page Contains Element    ${wood_保存toast提示2}
    Element Text Should Be    ${wood_保存toast提示2}    保存成功
    Sleep    1
    Mouse Over    ${hex_文件}
    Sleep    0.2
    Click Element    ${wood_打开}
    Sleep    1s
    ${wood_云端作品名}    Get Text    ${wood_cloud_name1}
    Should Be Equal    ${wood_云端作品名}    01hellobit-副本
    Click Element    ${wood_cloud_close}
    #删除云端产生的垃圾数据
    Mouse Over    ${wood_登录入口}
    sleep    0.2s
    Click Element    ${wood_我的作品}
    Select Window    New
    Wait Until Page Contains Element    ${wood_我的作品列表first}    10
    Mouse Over    ${wood_我的作品列表first}
    Click Element    ${wood_我的作品列表first}/div[2]
    Click Element    ${wood_我的作品删除}
    Sleep    0.2s

Save_local
    #验证保存到本地功能
    ${USER}    Get User
    ${wood_作品下载路径}    Set Variable    C:\\Users\\${USER}\\Downloads
    File Should Not Exist    ${wood_作品下载路径}\\新的作品.hex
    Mouse Over    ${hex_文件}
    Click Element    ${wood_保存到本地}
    Sleep    5
    File Should Exist    ${wood_作品下载路径}\\新的作品.hex
    Remove File    ${wood_作品下载路径}\\新的作品.hex
    File Should Not Exist    ${wood_作品下载路径}\\新的作品.hex
    #验证保存作品名与当前打开作品名一致
    Mouse Over    ${hex_文件}
    Click Element    ${wood_从本地打开}
    Win Wait    打开    \    5
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hw_hex_dir}\\01hellobit.hex
    Sleep    0.5
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_工程文件名}
    File Should Not Exist    ${wood_作品下载路径}\\01hellobit.hex
    Mouse Over    ${hex_文件}
    Sleep    0.5s
    Click Element    ${wood_保存到本地}
    Sleep    5s
    File Should Exist    ${wood_作品下载路径}\\01hellobit.hex
    Remove File    ${wood_作品下载路径}\\01hellobit.hex
    File Should Not Exist    ${wood_作品下载路径}\\01hellobit.hex


Docs
    #验证源码图鉴功能
    Click Element    ${wood_源码图鉴}
    Select Window    NEW
    Run Keyword If    '${url}'=='https://dev-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://dev-wood.maocode.cn/wood_docs/web/
    ...    ELSE IF    '${url}'=='https://test-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://test-wood.maocode.cn/wood_docs/web/
    ...    ELSE IF    '${url}'=='https://staging-wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://staging-wood.maocode.cn/wood_docs/web/
    ...    ELSE IF    '${url}'=='https://wood.maocode.cn/?editor_mode=1'    Location Should Contain    https://wood.maocode.cn/wood_docs/web/
