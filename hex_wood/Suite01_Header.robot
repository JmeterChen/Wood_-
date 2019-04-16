*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           OperatingSystem
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
    Element Text Should Be    ${Microbit}    Microbit
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
    # 这个 ${wood_username1} 号码没注册所以会失败
    Mouse Over    ${wood_文件}
    # 未登录点击打开选项
    ${num}   Set Variable    [1]
    Click Element    ${wood_文件_choices}${num}
    assert_login_exist
    # 使用新账号登录
    login    ${wood_username1}    ${wood_password}
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
    Set Selenium Speed    .4 seconds
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
    Wait Until Page Contains Element    ${wood_untrans_toast}
    # 添加下面的代码会报错，google上解释说为
    Mouse Over    ${wood_untrans_toast}
    # Element Text Should Be    ${wood_untrans_toast}>span+span>div>span:first-child    转换失败
    # Element Should Contain    ${wood_untrans_toast}>span+span>div>span+span    第 6 行代码没有办法按转换成积木T_T，可能是代码缩进有问题哦!
    Element Text Should Be    ${wood_模式切换按钮}    积木模式


button_file_open_local_py
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
    Select Window    NEW
    # 加了下面代码会出错，原因不详，后续需要查明
    # Wait Until Element Is Visible    ${wood_untrans_toast}
    # Element Text Should Be    ${wood_untrans_toast}>span+span>div>span    转换失败
    # Element Should Contain    ${wood_untrans_toast}>span+span>div>span+span    第 6 行代码没有办法按转换成积木T_T，可能是代码缩进有问题哦!
    Element Attribute Value Should Be    ${wood_input_file_name}    value    decorator
    Page Should Contain    print('the func run time is %s'%(end_time - start_time))
    # 验证无法转译时打开为代码模式
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
    [tags]    search
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
    # 这里鼠标焦点一定需要改变，不然页面局部刷新，rf是不知道的，所以下面进行鼠标点击事件进行元素重新链接
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Page Should Contain Element    ${cloud_frame}    limit>1
    Element Should Not Contain    ${cloud_frame}[1]/div    从本地打开
    Element Should Contain    ${cloud_frame}[1]/div    新的
    ${frame_name1}    Get Text    ${cloud_frame}[1]/div/span[1]
    # 使用删除键回退删除刚才所填内容
    Press Key   ${cloud_search_text}    \\8
    Press Key   ${cloud_search_text}    \\8
    # 同理，这里页面局部刷新，也需要进行重连
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Element Text Should Be    ${cloud_frame}[1]/span[2]    从本地打开
    # 输入py作品名称
    Input Text    ${cloud_search_text}    樱花树
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Element Text Should Be    ${cloud_search_noresult}    无搜索结果
    # 切换语言繁体查看
    Click Element    ${cloud_close}
    Switch Language    zh-hant
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    Input Text    ${cloud_search_text}    樱花树
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Element Text Should Be    ${cloud_search_noresult}    無搜索結果
    Press Key   ${cloud_search_text}    \\8
    Press Key   ${cloud_search_text}    \\8
    Press Key   ${cloud_search_text}    \\8
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Element Text Should Be    ${cloud_frame}[1]/span[2]    從本地打開
    # 切换语言英文查看
    Click Element    ${cloud_close}
    Switch Language    en
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${wood_打开文件页面}
    Input Text    ${cloud_search_text}    樱花树
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Element Text Should Be    ${cloud_search_noresult}    No result
    Press Key   ${cloud_search_text}    \\8
    Press Key   ${cloud_search_text}    \\8
    Press Key   ${cloud_search_text}    \\8
    Mouse Over    ${cloud_title}
    Click Element    ${cloud_title}
    Element Text Should Be    ${cloud_frame}[1]/span[2]    Open a local file


button_file_New
    Login    ${wood_username2}    ${wood_password}
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    ${num1}    Set Variable    [1]
    ${num2}    Set Variable    [2]
    Click Element    ${wood_文件_choices}${num1}
    # 打开本地已保存的作品
    Element Should Be Visible    ${wood_打开文件页面}
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_normal1}
    Control Click    \    \    Button1
    Sleep    1
    Element Should Not Be Visible    ${wood_打开文件页面}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    normal01
    Mouse Over   ${wood_文件}
    Click Element    ${wood_文件_choices}[2]
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品
    Mouse Over   ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    # 打开本地已保存的作品,该作品在积木模式下打开会自动修改
    Element Should Be Visible    ${wood_打开文件页面}
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Should Not Be Visible    ${wood_打开文件页面}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    Mouse Over   ${wood_文件}
    # 由于积木模式下打开作品自动修改后，点击新建会弹出保存toast
    Click Element    ${wood_文件_choices}[2]
    Element Should Be Visible    ${save_toast}
    Element Should Contain    ${save_toast_text}    当前作品还没有保存哦
    Element Text Should Be    ${save_toast_text}>div>div+div+div    是否要继续
    # 校验toast关闭功能
    Click Element    ${save_toast_close}
    Element Should Not Be Visible    ${save_toast}
    # 再次触发保存toast
    Mouse Over   ${wood_文件}
    Click Element    ${wood_文件_choices}[2]
    Element Should Be Visible    ${save_toast}
    # 校验toast取消按钮功能
    Click Element    ${save_toast_cancle}
    Element Should Not Be Visible    ${save_toast}
    # 再次触发保存toast
    Mouse Over   ${wood_文件}
    Click Element    ${wood_文件_choices}[2]
    Element Should Be Visible    ${save_toast}
    # 校验toast确认按钮
    Click Element    ${save_toast_sure}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品


button_file_save_as
    [tags]    save_as
    ${Current_URL}    Set Variable    Get Location
    Mouse Over    ${wood_文件}
    ${num1}    Set Variable    [1]
    ${num2}    Set Variable    [2]
    ${num3}    Set Variable    [3]
    # 未登录点击另存为选项弹出登录框
    Click Element    ${wood_文件_choices}${num3}
    assert_login_exist
    # 使用常用账号登录
    login     ${wood_username2}    ${wood_password}
    Click Element    ${login_我的作品}
    Select Window    NEW
    Title Should Be    海龟编辑器官方下载_Python编辑器_少儿编程编辑器_图形化编程编辑器-编程猫
    Run Keyword If    '${Current_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Be    ${myfile_URL_dev}
    ...    ELSE IF    '${Current_URL}' == 'https://test-wood.codemao.cn/'    Location Should Be    ${myfile_URL_test}
    ...    ELSE IF    '${Current_URL}' == 'https://wood.codemao.cn/'    Location Should Be    ${myfile_URL}
    ...    ELSE IF    '${Current_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Browser    ${myfile_URL_staging}
    ${python_frame_name1}    Get Text    ${python_frame1}>div>div+div>p
    Close Window
    Select Window    title=编程猫海龟编辑器
    Mouse Over   ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    # 打开本地已保存的作品,该作品在积木模式下打开会自动修改
    Element Should Be Visible    ${wood_打开文件页面}
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Should Not Be Visible    ${wood_打开文件页面}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    Mouse Over   ${wood_文件}
    # 点击另存为按钮
    Click Element    ${wood_文件_choices}${num3}
    Wait Until Element Is Visible    ${save_succeed_hint}
    # Element Text Should Be    ${save_succeed_hint}>div+div    保存成功
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change-副本
    Mouse Over    ${wood_文件}
    # 校验另存为成功后点击新建无保存toast弹窗
    Click Element    ${wood_文件_choices}${num2}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品
    # 验证登录状态下修改作品名称会进行保存操作
    Execute Javascript    document.getElementsByClassName('style__project_name__input__4kDDB')[0].value='SaveTo'
    Click Element    ${wood_input_file_name}
    # 第一次点击另存为操作
    Mouse Over    ${wood_文件}
    Click Element   ${wood_文件}
    Sleep    1
    Click Element    ${wood_文件_choices}${num3}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    SaveTo-副本
    # 再次点击另存为操作
    Mouse Over   ${wood_文件}
    Click Element    ${wood_文件_choices}${num3}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    SaveTo-副本-副本
    # 删除垃圾数据
    Mouse Over    ${login_入口}
    Click Element    ${login_我的作品}
    Sleep    1
    Select Window    NEW
    Element Text Should Be    //a[text()='我的作品']    我的作品
    Mouse Over    ${python_frame1}
    :FOR    ${i}    IN RANGE    ${4}
    \    Mouse Over    ${python_frame1}
    \    Click Element    ${python_frame1}>div+div>span
    \    Click Element    ${python_delete}
    Sleep    1
    Element Text Should Be    ${python_frame1}>div>div+div>p    ${python_frame_name1}
    # 关闭当前窗口
    Close Window
    Sleep    0.5
    Select Window    title=编程猫海龟编辑器



button_file_save_local
    Login    ${wood_username2}    ${wood_password}
    ${USER}    Get User
    ${files_download}    Set Variable    C:\\Users\\${USER}\\Downloads
    File Should Not Exist    ${files_download}\\Auto_change.hex
    ${num1}    Set Variable    [1]
    ${num2}    Set Variable    [2]
    ${num5}    Set Variable    [5]
    Mouse Over   ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    # 打开本地已保存的作品,该作品在积木模式下打开会自动修改
    Element Should Be Visible    ${wood_打开文件页面}
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Should Not Be Visible    ${wood_打开文件页面}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num5}
    Sleep    2
    File Should Exist    ${files_download}\\Auto_change.hex
    Remove File    ${files_download}\\Auto_change.hex
    File Should Not Exist    ${files_download}\\Auto_change.hex
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num2}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品

button_file_open_from_local_a
    Login    ${wood_username2}    ${wood_password}
    ${num1}    Set Variable    [1]
    ${num2}    Set Variable    [2]
    ${num5}    Set Variable    [5]
    ${num6}    Set Variable    [6]
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num6}
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    # 积木模式下打开自动修改的作品后点击打开选项
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    Element Should Be Visible    ${wood_打开文件页面}
    # 选择打开本本地作品
    Click Element    ${cloud_frame}[1]
    Element Should Be Visible    ${save_toast}
    Click Element    ${save_toast_close}
    # 选择打开云端某个作品
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    Element Should Be Visible    ${wood_打开文件页面}
    # 选择云端作品
    Click Element    ${cloud_frame}[2]
    Element Should Be Visible    ${save_toast}
    Click Element    ${save_toast_cancle}
    # 点击新建选项
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num2}
    Element Should Be Visible    ${save_toast}
    Click Element    ${save_toast_cancle}
    # 再次点击从本地打开选项
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num6}
    Element Should Be Visible    ${save_toast}
    Click Element    ${save_toast_cancle}

button_file_open_from_local_b
    Login    ${wood_username2}    ${wood_password}
    ${num1}    Set Variable    [1]
    ${num2}    Set Variable    [2]
    ${num5}    Set Variable    [5]
    ${num6}    Set Variable    [6]
    Element Should Be Visible    ${wood_模式切换按钮}    代码模式
    Click Element    ${wood_模式切换按钮}
    Element Should Be Visible    ${wood_模式切换按钮}    积木模式
    Mouse Over    ${wood_文件}
    # 代码模式带下打开自动修改的作品
    Click Element    ${wood_文件_choices}${num6}
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    Element Should Be Visible    ${wood_模式切换按钮}    积木模式
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    Element Should Be Visible    ${wood_打开文件页面}
    # 点击从本地打开
    Click Element    ${cloud_frame}[1]
    Win Wait    打开    \    2
    Win Activate    打开
    # 再次打开会自动修改的作品2
    Control Set Text    \    \    Edit1    ${hex_auto_change2}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change2
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    Element Should Be Visible    ${wood_打开文件页面}
    ${file_frame2_name}    Get Text    ${cloud_frame}[2]/div/span[1]
    Click Element    ${cloud_frame}[2]
    Element Attribute Value Should Be    ${wood_input_file_name}    value    ${file_frame2_name}
    # 再次打开自动修改的作品1
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num6}
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    # 点击新建选项
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num2}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品
    # 再次打开自动修改的作品1
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num6}
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    # 点击从本地打开选项
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num6}
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change2}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change2

SaveTo_Cloud
    ${num1}    Set Variable    [1]
    ${num2}    Set Variable    [2]
    ${num6}    Set Variable    [6]
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num6}
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${hex_auto_change}
    Control Click    \    \    Button1
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    Auto_change
    Click Element    ${wood_save_button}
    Element Should Be Visible    ${wood_登录页面01}
    Click Element    ${wood_01close}
    Login    ${wood_username2}    ${wood_password}
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num2}
    Element Should Be Visible    ${save_toast}
    Click Element    ${save_toast_close}
    Click Element    ${wood_save_button}
    Wait Until Page Contains    保存成功
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num2}
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    ${frame2_file_name}    Get Text    ${cloud_frame}[2]/div/span[1]
    Should Be Equal    ${frame2_file_name}    Auto_change
    Click Element    ${cloud_close}
    # 删除垃圾数据
    Mouse Over    ${login_入口}
    Click Element    ${login_我的作品}
    Sleep    2
    Select Window    NEW
    Title Should Be    海龟编辑器官方下载_Python编辑器_少儿编程编辑器_图形化编程编辑器-编程猫
    Mouse Over    ${python_frame1}
    Element Should Contain    ${python_frame1}    Auto_change
    Click Element    ${python_frame1}>div+div>span
    Click Element    ${python_delete}
    Close Window
    Select Window    title=编程猫海龟编辑器
    # 验证垃圾数据删除干净
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num1}
    Element Text Should Not Be    ${cloud_frame}[2]/div/span[1]    Auto_change


button_Microbit_18n
    Mouse Over    ${wood_Microbit}
    Element Text Should Be    ${Microbit_hover_text1}    microbit
    Element Text Should Be    ${Microbit_hover_text2}    点击连接
    Element Should Contain    ${Microbit_hover_text3}    添加扩展积木
    Element Should Contain    ${Microbit_hover_text4}    下载编程猫硬件助手
    Switch Language    zh-hant
    Mouse Over    ${wood_Microbit}
    Element Text Should Be    ${Microbit_hover_text1}    microbit
    Element Text Should Be    ${Microbit_hover_text2}    點擊鏈接
    Element Should Contain    ${Microbit_hover_text3}    添加擴展積木
    Element Should Contain    ${Microbit_hover_text4}    下載編程貓硬件助手
    Switch Language    en
    Mouse Over    ${wood_Microbit}
    Element Text Should Be    ${Microbit_hover_text1}    microbit
    Element Text Should Be    ${Microbit_hover_text2}    Connect
    Element Should Contain    ${Microbit_hover_text3}    Add extension
    Element Should Contain    ${Microbit_hover_text4}    Download Hardware Assistant

button_Microbit_function1
    [tags]    bug
    ${USER}    Get User
    ${files_download}    Set Variable    C:\\Users\\${USER}\\Downloads
    Mouse Over    ${wood_Microbit}
    Element Should Not Be Visible    ${Microbit_connect}
    Click Element    ${Microbit_hover_text2}
    Element Should Be Visible    ${Microbit_connect}
    Element Should Contain    ${Microbit_connect}    未检测到microbit
    Element Should Contain    ${Microbit_connect}    请用USB线将它连接到电脑上
    Mouse Over    ${Microbit_down_hover}
    Element Text Should Be    ${Microbit_down_hover}>div    点击下载USB驱动
    File Should Not Exist    ${files_download}\\win_driver.zip
    Click Element    ${Microbit_down_hover}
    Sleep    5
    File Should Exist    ${files_download}\\win_driver.zip
    Remove File    ${files_download}\\win_driver.zip
    File Should Not Exist    ${files_download}\\win_driver.zip
    Click Element    ${Microbit_close}
    Element Should Not Be Visible    ${Microbit_connect}


button_Microbit_function2
    [tags]    bug
    ${USER}    Get User
    ${files_download}    Set Variable    C:\\Users\\${USER}\\Downloads
    Page Should Not Contain    更多
    Mouse Over    ${wood_Microbit}
    Click Element    ${Microbit_hover_text3}
    Element Should Be Visible    ${Microbit_ELF}
    Click Element    ${Microbit_ELF_close}
    Element Should Not Be Visible    ${Microbit_ELF}
    Mouse Over    ${wood_Microbit}
    Click Element    ${Microbit_hover_text3}
    Element Should Be Visible    ${Microbit_ELF}
    Click Element    ${Microbit_ELF_add}
    Wait Until Element Is Visible    ${Microbit_ELF_toast}
    Page Should Contain    更多
    Mouse Over    ${wood_Microbit}
    Element Should Contain    ${Microbit_hover_text3}     micro:bit - ELF扩展板
    Element Text Should Be    ${Microbit_hover_text3}+span    已添加

button_Microbit_function3
    [tags]    bug
    ${USER}    Get User
    ${files_download}    Set Variable    C:\\Users\\${USER}\\Downloads
    Mouse Over    ${wood_Microbit}
    File Should Not Exist    ${files_download}\\编程猫硬件助手_windows_32.zip
    Click Element    ${Microbit_hover_text4}
    Sleep    15
    File Should Exist    ${files_download}\\编程猫硬件助手_windows_32.zip
    Remove File    ${files_download}\\编程猫硬件助手_windows_32.zip
    File Should Not Exist    ${files_download}\\编程猫硬件助手_windows_32.zip


file_input_frame
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品
    Press Key    ${wood_input_file_name}    \\8
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作
    Mouse Over    ${wood_文件}
    ${num}    Set Variable    [2]
    Click Element    ${wood_文件_choices}${num}
    Element Should Be Visible    ${save_toast}
    Click Element    ${save_toast_close}
    Login    ${wood_username2}    ${wood_password}
    Click Element    ${wood_save_button}
    Wait Until Element Is Visible    ${save_succeed_hint}
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_choices}${num}
    Sleep    1
    Element Attribute Value Should Be    ${wood_input_file_name}    value    新的作品
    # 删除垃圾数据
    Mouse Over    ${login_入口}
    Click Element    ${login_我的作品}
    Select Window    New
    Element Text Should Be    ${python_frame1}>div>div+div>p    新的作
    Mouse Over    ${python_frame1}
    Click Element    ${python_frame1}>div+div>span
    Click Element    ${python_delete}
    Close Window
    Select Window    title=编程猫海龟编辑器


help
    ${Current_URL}    Set Variable    Get Location
    Click Element    ${wood_help}
    Select Window    NEW
    Title Should Be    源码图鉴 | 源码图鉴
    Run Keyword If    '${Current_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Be    ${help_URL_dev}
    ...    ELSE IF    '${Current_URL}' == 'https://test-wood.codemao.cn/'    Location Should Be    ${help_URL_test}
    ...    ELSE IF    '${Current_URL}' == 'https://wood.codemao.cn/'    Location Should Be    ${help_URL}
    ...    ELSE IF    '${Current_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Browser    ${help_URL_staging}
    Close Window
    Select Window    title=编程猫海龟编辑器


open_files
    ${num6}    Set Variable    [6]
    #用特写的方法查找指定文件夹中的.py或者.hex文件，将文件名字放进一个列表
    @{test_py_name}    Find Py    ${py_file_dir}
    ${length}    Evaluate    len(@{test_py_name})
    :FOR    ${i}    IN RANGE    ${length}
    \    Click Element    ${wood_模式切换按钮}
    \    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    \    Mouse over    ${wood_文件}
    \    Click Element    ${wood_文件_choices}${num6}
    \    Sleep    1
    \    Win Wait    打开    \    2
    \    Win Activate    打开
    \    Control Set Text    \    \    Edit1    ${py_file_dir}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    \    Sleep    0.5
    \    Control Set Text    打开    \    1148    ${test_py_name[${i}]}
    \    Control Click    打开    \    1
    \    Sleep    0.5
    \    Element Attribute Value Should Be    ${wood_input_file_name}    value    ${test_py_name[${i}][:-4]}
    \    Click Element    ${wood_模式切换按钮}
    \    Wait Until Page Contains    代码模式