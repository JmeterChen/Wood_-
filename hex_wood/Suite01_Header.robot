*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          hex_resource.robot
Test Setup        open_bs
Test Teardown       Teardown


*** Variables ***

*** Test Cases ***
open_wood_hex_001
    #断言title显示正确
    Title Should Be    编程猫海龟编辑器
    #确定是硬件模式
    Element Text Should Be    Microbit
    Element Should Be Visible    ${hex_基本}    基本

home_002
    #点击首页按钮
    Click Element    ${wood_首页按钮}
    Sleep    2
    #验证能够正常进入到首页
    Select Window    NEW
    Title Should Be    海龟编辑器官方下载_Python编辑器_少儿编程编辑器_图形化编程编辑器-编程猫
    Run Keyword If    '${wood_hex_URL}' == 'https://wood.codemao.cn/'    Location Should Contain    https://python.codemao.cn/
    ...    ELSE IF    '${wood_hex_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Contain    https://dev-python.codemao.cn/
    ...    ELSE IF    '${wood_hex_URL}' == 'https://test-wood.codemao.cn/'    Location Should Contain    https://test-python.codemao.cn/
    ...    ELSE IF    '${wood_hex_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Contain    https://staging-python.codemao.cn/
    Close Window
    Select Window    title=编程猫海龟编辑器
    Title Should Be    编程猫海龟编辑器

button_file_18n
    Mouse Over    ${wood_文件}
    Page Should Contain Element    ${wood_文件_choices}    limit=6
    @{file_choices_ch}    Create List    打开    新建    另存为    模板作品    保存到本地    从本地打开
    @{file_choices_com_ch}    Create List    打開    新建    另存為    模板作品    保存到本地    從本地打開
    @{file_choices_en}    Create List    Open    New    Save as    Templates    Save to local    Local project
    ${len_choice_list}    Get Length    ${file_choices_ch}
    : FOR    ${i}    IN RANGE    ${len_choice_list}
    \    Mouse Over    ${wood_文件_choices}[${i+1}]
    \    Element Text Should Be    ${wood_文件_choices}[${i+1}]    @{file_choices_ch}[${i}]
    #切换为繁体
    Switch Language    zh-hant
    Mouse File Button    ${file_choices_com_ch}    ${wood_文件_choices}
    #切换为英文
    Switch Language    en
    Mouse File Button    ${file_choices_en}    ${wood_文件_choices}
    #切换回中文
    Switch Language    zh
    Mouse File Button    ${file_choices_ch}    ${wood_文件_choices}

button_file_open1
    [Tags]    debug
    Mouse Over    ${wood_文件}
    # 未登录点击打开选项
    ${num}   Set Variable    [1]
    Click Element    ${wood_文件_choices}${num}
    assert_login_exist
    # 使用新账号登录
    login     ${wood_username1}    ${wood_password}
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    # 验证云端作品列表
    Element Should Be Visible    ${wood_打开文件页面}
    Element Text Should Be     ${cloud_title}     打开文件
    Element Attribute Value Should Be     ${cloud_search_text}     placeholder    关键词搜索作品
    Element Should Be Visible     ${cloud_close}
    Page Should Contain Element    ${cloud_frame}    limit=1
    Element Text Should Be    ${cloud_frame}/span[2]    从本地打开
    Click Element   ${cloud_close}
    Element Should Not Be Visible    ${wood_打开文件页面}
    Switch Language    zh-hant
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num}
    # 验证云端作品列表
    Element Should Be Visible    ${wood_打开文件页面}
    Element Text Should Be     ${cloud_title}     打開文件
    Element Attribute Value Should Be     ${cloud_search_text}     placeholder    關鍵詞搜索作品
    Element Should Be Visible     ${cloud_close}
    Page Should Contain Element    ${cloud_frame}    limit=1
    Element Text Should Be    ${cloud_frame}/span[2]    從本地打開
    Click Element   ${cloud_close}
    Element Should Not Be Visible    ${wood_打开文件页面}
    Switch Language    en
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num}
    # 验证云端作品列表
    Element Should Be Visible    ${wood_打开文件页面}
    Element Text Should Be     ${cloud_title}     Open
    Element Attribute Value Should Be     ${cloud_search_text}     placeholder    Search
    Element Should Be Visible     ${cloud_close}
    Page Should Contain Element    ${cloud_frame}    limit=1
    Element Text Should Be    ${cloud_frame}/span[2]    Open a local file
    Click Element   ${cloud_close}
    Element Should Not Be Visible    ${wood_打开文件页面}
    Mouse Over    ${login_入口}
    Click Element    ${login_退出登录}
    Element Should Be Visible    ${wood_未登录}

button_file_open_cloud
    Mouse Over    ${wood_文件}
    # 未登录点击打开选项
    ${num}    Set Variable    [1]
    Click Element    ${wood_文件_choices}${num}
    assert_login_exist
    # 使用常用账号登录
    login     ${wood_username2}    ${wood_password}
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    # 验证云端作品列表
    Element Should Be Visible    ${wood_打开文件页面}
    Element Text Should Be     ${cloud_title}     打开文件
    Element Attribute Value Should Be     ${cloud_search_text}     placeholder    关键词搜索作品
    Element Should Be Visible     ${cloud_close}
    Page Should Contain Element    ${cloud_frame}    limit>1
    Element Text Should Be    ${cloud_frame}/span[2]    从本地打开
    Click Element   ${cloud_close}
    Element Should Not Be Visible    ${wood_打开文件页面}
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    Element Text Should Be     ${cloud_title}     打开文件
    Page Should Contain Element    ${cloud_frame}    limit>1
    ${frame2_file_name}    Get Text    ${cloud_frame}[2]/div/span[1]
    Log    ${frame2_file_name}
    Click Element    ${cloud_frame}[2]
    Wait Until Element Is Not Visible    ${wood_打开文件页面}
    Mouse Over    ${wood_input_file_name}
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    ${frame2_file_name}
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num}
    # 验证打开云端作品后，第一个frame框从本地打开没有消失
    Element Text Should Be    ${cloud_frame}/span[2]    从本地打开

button_file_open_local_hex
    [tags]    haha
    Mouse Over    ${wood_文件}
    # 未登录点击打开选项
    ${num}    Set Variable    [1]
    Click Element    ${wood_文件_choices}${num}
    assert_login_exist
    # 使用常用账号登录
    login     ${wood_username2}    ${wood_password}
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    # 默认积木模式下打开正常hex作品
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_normal1}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    normal01
    Element Text Should Be    ${wood_模式切换按钮}    代码模式
    Click Element    ${wood_模式切换按钮}
    # 切换到代码模式
    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    Page Should Contain    accelerometer.is_gesture('shake')
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    # 代码模式下打开正常hex作品
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_normal2}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    normal02
    Page Should Contain    print(accelerometer.get_x())
    # 切换回积木模式
    Click Element    ${wood_模式切换按钮}
    Element Text Should Be    ${wood_模式切换按钮}    代码模式
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    # 积木模式下打开不可转译hex文件
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_untrans}
    Control Click    \    \    Button1
    Sleep    1
    Wait Until Page Contains Element    ${wood_untrans_toast}
    Element Text Should Be    ${wood_untrans_toast}>span+span>div>span    转换失败
    Element Should Contain    ${wood_untrans_toast}>span+span>div>span+span    第 6 行代码没有办法按转换成积木T_T，可能是代码缩进有问题哦!
    Element Text Should Be    ${wood_模式切换按钮}    积木模式


button_file_open_local_py
    [tags]    open_local_py
    Mouse Over    ${wood_文件}
    # 未登录点击打开选项
    ${num}    Set Variable    [1]
    Click Element    ${wood_文件_choices}${num}
    assert_login_exist
    # 使用常用账号登录
    login     ${wood_username2}    ${wood_password}
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    # 默认积木模式下打开正常py作品
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${py_normal3}
    Control Click    \    \    Button1
    Sleep    1
    Select Window    NEW
    Title Should Be    编程猫海龟编辑器
    Click Element    ${tgzy_跳过指引}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    normal03
    Element Text Should Be    ${wood_模式切换按钮}    代码模式
    # 切换到代码模式
    Click Element    ${wood_模式切换按钮}
    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    Page Should Contain    print('欢迎来到源码世界！')
    Close Window
    Select Window    title=编程猫海龟编辑器
    Element Should Be Visible    ${wood_打开文件页面}
    # 积木模式下打开不可转译py作品
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${py_untrans}
    Control Click    \    \    Button1
    Sleep    1
    Select Window    NEW
    Title Should Be    编程猫海龟编辑器
    Wait Until Page Contains Element    ${wood_untrans_toast}
    # 加了下面这两行代码会出错，原因不详，后续需要查明
    # Element Text Should Be    ${wood_untrans_toast}>span+span>div>span    转换失败
    # Element Should Contain    ${wood_untrans_toast}>span+span>div>span+span    第 6 行代码没有办法按转换成积木T_T，可能是代码缩进有问题哦!
    Element Attribute Value Should Be    ${wood_input_file_name}    value    decorator
    Page Should Contain    print('the func run time is %s'%(end_time - start_time))
    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    Close Window
    Select Window    title=编程猫海龟编辑器
    Element Should Be Visible    ${wood_打开文件页面}
    Click Element    ${cloud_close}
    # 切换到代码模式
    Click Element    ${wood_模式切换按钮}
    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    # 代码模式下打开正常py作品
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${py_normal3}
    Control Click    \    \    Button1
    Sleep    1
    Select Window    NEW
    Title Should Be    编程猫海龟编辑器
    Element Attribute Value Should Be    ${wood_input_file_name}    value    normal03
    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    Page Should Contain    print('欢迎来到源码世界！')
    Close Window
    Select Window    title=编程猫海龟编辑器
    Element Should Be Visible    ${wood_打开文件页面}
    # 代码模式下打开不可转译py作品
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${py_untrans}
    Control Click    \    \    Button1
    Sleep    1
    Select Window    NEW
    Title Should Be    编程猫海龟编辑器
    Element Attribute Value Should Be    ${wood_input_file_name}    value    decorator
    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    Page Should Contain    print('the func run time is %s'%(end_time - start_time))
    Close Window
    Select Window    title=编程猫海龟编辑器
    Element Should Be Visible    ${wood_打开文件页面}


button_file_search
    Mouse Over    ${wood_文件}
    # 未登录点击打开选项
    ${num}    Set Variable    [1]
    Click Element    ${wood_文件_choices}${num}
    assert_login_exist
    # 使用常用账号登录
    login     ${wood_username2}    ${wood_password}
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    Input Text    ${cloud_search_text}    新的
    # 这里鼠标焦点一定需要改变，不然页面局部刷新，rf链是不知道的，所以下面进行鼠标点击事件进行元素重新链接
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Page Should Contain Element    ${cloud_frame}    limit>1
    Element Should Not Contain    ${cloud_frame}[1]/div    从本地打开
    Element Should Contain    ${cloud_frame}[1]/div/spanp[1]    新的
    ${frame_name1}    Get Text    ${cloud_frame}[1]/div/spanp[1]
    Clear Element Text    ${cloud_search_text}
    Element Text Should Be    ${cloud_frame}[2]    从本地打开

