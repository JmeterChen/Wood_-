*** Settings ***
Test Setup        Open Client
Test Teardown     Teardown
Library           SeleniumLibrary
Library           AutoItLibrary
Library           RFTestLibrary
Library           OperatingSystem
Resource          wood_resource.robot

*** Test Cases ***
new_built
    New Built
    Page Should Contain Element    ${wood_tabs_num}    limit=2
    Element Text Should Be    ${wood_tab_cur_name}    新的作品

open_file
    @{test_py_name}    Find Py    ${py_file_normal}
    ${length1}    Evaluate    len(@{test_py_name})
    : FOR    ${i}    IN RANGE    ${length1}
    \    Open_file
    \    Sleep    1
    \    Win Wait    打开    \    2
    \    Win Activate    打开
    \    Control Set Text    \    \    Edit1    ${py_file_normal}\\${test_py_name[${i}]}
    \    Control Click    \    \    Button1
    \    Sleep    1
    \    Element Text Should Be    ${wood_trans_button}    代码模式
    \    Element Should Contain    ${wood_tab_cur_name}    ${test_py_name[${i}][:-4]}
    \    Click Element    ${wood_tab_cur_close}
    # 这里还需要补充积木模式下作品名称hover
    @{test_py_name}    Find Py    ${py_file_unnormal}
    ${length2}    Evaluate    len(@{test_py_name})
    : FOR    ${i}    IN RANGE    ${length2}
    \    Open_file
    \    Sleep    1
    \    Win Wait    打开    \    2
    \    Win Activate    打开
    \    log    ${py_file_unnormal}
    \    Control Set Text    \    \    Edit1    ${py_file_unnormal}\\${test_py_name[${i}]}
    \    Control Click    \    \    Button1
    \    Sleep    0.5
    \    Element Text Should Be    ${wood_trans_button}    积木模式
    \    Element Should Contain    ${wood_tab_cur_name}    ${test_py_name[${i}][:-4]}
    \    ${tab_name}    Get Text    ${wood_tab_cur_name}
    \    ${n}    Evaluate    ${i}+1
    \    ${x}    Evaluate    ${n}*2+1
    \    ${y}    Evaluate    ${n}*2+2
    \    Mouse Over    //*[@id="root"]/div/div[2]/div[2]/span[${x}]
    \    Element Text Should Be    //*[@id="root"]/div/div[2]/div[2]/span[${y}]/span    ${tab_name}

open_untrans_file
    [Tags]    faile
    # 目前这里有个bug,转换模式后，手动打开不能转译的积木时，toast就消失了
    Open_file
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${file_untrans}
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    请打开 .py 或 .hex 后缀的文件
    Sleep    0.5
    Click Element    ${wood_trans_button}
    Open_file
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${file_untrans}
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    请打开 .py 或 .hex 后缀的文件
    Sleep    0.5
    Click Element    ${wood_trans_button}
    Open_file
    Win Wait    打开    \    2
    Win Activate    打开
    Control Set Text    \    \    Edit1    ${file_untrans}
    Control Click    \    \    Button1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    请打开 .py 或 .hex 后缀的文件

save_file
    # when save to local rename the file_name
    Save To Local
    Win Wait    另存为    \    2
    Win Activate    另存为
    ${name_code}    Creat Code    5
    ${file_name}    Add    ${name_code}    .py
    Control Set Text    \    \    Edit1    ${download_file}\\${file_name}
    # 因为win7和win10的控件按钮不一致，所以这里使用下面的通用写法
    # Control Click    \    \    Button2
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${file_name}
    New Built_hex
    Save To Local
    Win Wait    另存为    \    2
    Win Activate    另存为
    ${name_code}    Creat Code    5
    # ${file_name}    Add    ${name_code}    .hex
    Control Set Text    \    \    Edit1    ${download_file}\\${name_code}.hex
    # Control Click    \    \    Button2
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${file_name}
    # 删除该文件夹下的测试数据
    @{test_py_name}    Find Py    ${download_file}
    ${length3}    Evaluate    len(@{test_py_name})
    ${compare}    Evaluate    ${length3}>0
    : FOR    ${i}    IN RANGE    ${length3}
    \    Remove File    ${download_file}\\${test_py_name[${i}]}

save_file_name
    # update_tab_name_save_to_local
    Double Click Element    ${wood_tab_current}
    ${name_code}    Creat Code    5
    ${file_name}    Add    ${name_code}    .py
    Input Text    ${wood_tab_file_name}    ${name_code}
    Sleep    1
    Save To Local
    Win Wait    另存为    \    2
    Win Activate    另存为
    # Control Set Text    \    \    Edit1    ${download_file}\\${file_name}
    # Control Click    \    \    Button2
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${file_name}
    New Built_hex
    Double Click Element    ${wood_tab_current}
    ${name_code}    Creat Code    5
    ${file_name}    Add    ${name_code}    .hex
    Input Text    ${wood_tab_file_name}    ${name_code}
    Sleep    1
    Save To Local
    Win Wait    另存为    \    2
    Win Activate    另存为
    # Control Click    \    \    Button2
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${file_name}
    # 删除该文件夹下的测试数据
    @{test_py_name}    Find Py    ${download_file}
    ${length3}    Evaluate    len(@{test_py_name})
    ${compare}    Evaluate    ${length3}>0
    : FOR    ${i}    IN RANGE    ${length3}
    \    Remove File    ${download_file}\\${test_py_name[${i}]}

save_as
    # after save as other file to checkout the name_suffix
    ${cur_tab_name}    Get Text    ${wood_tab_cur_name}
    Save As
    Win Wait    另存为    \    2
    Win Activate    另存为
    Control Set Text    \    \    Edit1    ${download_file}\\${cur_tab_name}.py
    # Control Click        \    Button2
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${cur_tab_name}.py
    Sleep    0.5
    Save As
    Win Wait    另存为    \    2
    Win Activate    另存为
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${cur_tab_name}-副本.py
    New Built_hex
    ${cur_tab_name}    Get Text    ${wood_tab_cur_name}
    Save As
    Win Wait    另存为    \    2
    Win Activate    另存为
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${cur_tab_name}.hex
    Sleep    0.5
    Save As
    Win Wait    另存为    \    2
    Win Activate    另存为
    Control Click    另存为    \    1
    Wait Until Page Contains Element    ${wood_toast_file}
    Element Text Should Be    ${wood_toast_file}    保存成功
    File Should Exist    ${download_file}\\${cur_tab_name}-副本.hex
    # delete the test rubbish
    @{test_py_name}    Find Py    ${download_file}
    ${length3}    Evaluate    len(@{test_py_name})
    ${compare}    Evaluate    ${length3}>0
    : FOR    ${i}    IN RANGE    ${length3}
    \    Remove File    ${download_file}\\${test_py_name[${i}]}

sample_works
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_template}
    Element Should Be Visible    ${wood_ft_dialog}
    Element Text Should Be    ${wood_ftd_title}    模板作品
    ${test_temp_num}    Get Element Count    ${wood_template_num}
    # Log    ${test_temp_num}
    # Should Be Equal    ${test_temp_num}    ${9}
    Click Element    ${wood_ftd_close}
    Element Should Not Be Visible    ${wood_ft_dialog}
    : FOR    ${index}    IN RANGE    ${test_temp_num}
    \    Open Template    ${index}
    Element Should Be Visible    ${wood_trans_button}    代码模式

open_cloud_file
    Page Should Contain    未登录
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    Input Text    ${wood_ld_username}    ${test_username}
    Input Text    ${wood_ld_password}    ${test_password}
    Click Element    ${wood_ld_login_button}
    Sleep    0.5
    Page Should Not Contain    未登录
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    Element Should Be Visible    ${wood_cloud_list_title}    打开文件
    Page Should Not Contain    python_file
    Page Should Not Contain    hex_file

save_to_cloud
    [Tags]    faile
    # 这里现在有bug，保存的hex文件，客户端云端列表不会显示
    Page Should Contain    未登录
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_save_to_cloud}
    Input Text    ${wood_ld_username}    ${test_username}
    Input Text    ${wood_ld_password}    ${test_password}
    Click Element    ${wood_ld_login_button}
    Sleep    0.5
    Page Should Not Contain    未登录
    @{test_py_name}    Find Py    ${Save_to_cloud}
    ${length1}    Evaluate    len(@{test_py_name})
    : FOR    ${i}    IN RANGE    ${length1}
    \    Open_file
    \    Sleep    1
    \    Win Wait    打开    \    2
    \    Win Exists    打开
    \    Win Active    打开
    \    Control Set Text    打开    \    1148    ${Save_to_cloud}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    \    Sleep    0.5
    \    Control Set Text    打开    \    1148    ${test_py_name[${i}]}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    # 这里客户端目前存在bug，所以这条用例是跑不通的
    \    Wait Until Page Contains    ${test_py_name[${i}][:-4]}
    \    Click Element    ${wood_file_icon}
    \    Click Element    ${wood_file_save_to_cloud}
    \    Log    保存作品${i}：${test_py_name[${i}]}
    \    Wait Until Element Is Visible    ${wood_save_success}
    \    Click Element    ${wood_tab_cur_close}
    \    Click Element    ${wood_file_icon}
    \    Click Element    ${wood_file_open_cloud}
    \    Element Should Contain    ${wood_cloud_file_name}    ${test_py_name[${i}][:-4]}
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    # Page Should Contain    python_file
    # Page Should Contain    hex_file
    Click Element    ${wood_cloud_hex_icon}
    Page Should Contain    hex_file
    Page Should Not Contain    python_file
    Click Element    ${wood_cloud_hex_icon}
    Page Should Contain    python_file
    Page Should Contain    hex_file
    Click Element    ${wood_cloud_py_icon}
    Page Should Contain    python_file
    Page Should Not Contain    hex_file
    # Click Element    ${wood_cloud_py_icon}
    # Page Should Contain    python_file
    # Page Should Contain    hex_file

cloud_file_scroll
    Login
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    Page Should Contain    打开文件
    Click Element    ${wood_cloud_file_close}
    Page Should Not Contain    发开文件
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    ${num_list}    Get Element Count    ${wood_cloud_file_frame1}
    Execute Javascript    document.getElementsByClassName('style__client-container__1bZb2')[0].scrollTop=1300
    Page Should Contain Element    ${wood_cloud_file_frame1}    limit>${num_list}

cloud_icon_search
    [Tags]    faile
    Login
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    # Page Should Contain    python_file
    # Page Should Contain    hex_file
    Input Text    ${wood_cloud_search}    python_file
    Sleep    0.5
    Page Should Not Contain    hex_file
    Element Should Be Visible    ${wood_cloud_file_name}    python_file
    Log    'Python_file searching is Successfully!'
    ${file_date}    Get Text    ${wood_cloud_file_date}
    ${date}    Wood Time    .
    Should Be Equal As Strings    ${file_date}    ${date}
    Log    'The date of python_file is Normal!'
    Input Text    ${wood_cloud_search}    hex_file
    Sleep    0.5
    Page Should Not Contain    python_file
    Element Should Be Visible    ${wood_cloud_file_name}    hex_file
    Log    'hex_file searching is Successfully!'
    ${file_date}    Get Text    ${wood_cloud_file_date}
    ${date}    Wood Time    .
    Should Be Equal As Strings    ${file_date}    ${date}
    Log    'The date of hex_file is Normal!'
    Click Element    ${wood_cloud_py_icon}
    Page Should Contain Element    ${wood_cloud_unfind}    无搜索结果
    Click Element    ${wood_cloud_hex_icon}
    Element Should Be Visible    ${wood_cloud_file_name}    hex_file
    Log    'The function of Icons is Normal!'

i18n_block_headline_UI
    @{eng_block}    Create List    Events    Control    Operators    Strings    Variables
    ...    Lists    Dictionary    Functions    Turtle Library    Advance    Spider    GUI
    @{com_font_block}    Create List    事件    控制    運算    字符串    變量
    ...    列表    字典    函數    海龜庫    高級    爬蟲    界面
    @{china_block}    Create List    事件    控制    运算    字符串    变量
    ...    列表    字典    函数    海龟库    高级    爬虫    界面
    ${len_block_list}    Get Length    ${com_font_block}
    Setting Language
    Page Should Contain    文件
    # 选择第3个选项-切换到英文
    Click Element    ${wood_setting_language_xpath}[3]
    Mouse Over    ${wood_file_icon}
    Click Element    ${wood_file_icon}
    Element Should Contain    ${wood_file_icon}    File
    Element Should Contain    ${wood_file_dropdown}    New
    Mouse Over    ${wood_setting_button}
    Element Should Be Visible    ${wood_setting_button_name}    Setting
    Element Should Contain    ${wood_setting_dropdown}    Language
    Page Should Contain    latest
    Mouse Over    ${wood_hex_button}
    Element Text Should Be    ${wood_hex_button_name}    Hardware
    Element Should Contain    ${wood_hex_dropdown}/div/div    New hardware project
    Mouse Over    ${wood_library_manage_button}
    Element Should Contain    ${wood_library_manage_button}    Library Management
    Element Should Contain    ${wood_run_button}    Run
    Element Text Should Be    ${wood_workspace_run_button}    Run
    Element Should Be Visible    ${wood_trans_button}    Code
    Page Should Contain Element    ${wood_toolbox_xpath}/div    limit=11
    Element Should Be Visible    ${wood_toolbox_events}
    : FOR    ${i}    IN RANGE    ${len_block_list}    10
    \    Mouse Over    ${wood_toolbox_xpath}/div[${i+1}]
    \    Element Text Should Be    ${wood_toolbox_xpath}/div[${i+1}]/div/span[2]    @{eng_block}[${i}]
    Click Element    ${wood_toolbox_xpath}/div[10]
    Element Should Be Visible    ${wood_toolbox_xpath}/div[11]/div/span[2]    @{eng_block}[10]
    # 选择第2个选项-切换到繁体
    Mouse Over    ${wood_setting_button}
    Mouse Over    ${wood_setting_language}
    Click Element    ${wood_setting_language_xpath}[2]
    Mouse Over    ${wood_file_icon}
    Click Element    ${wood_file_icon}
    Element Should Contain    ${wood_file_icon}    文件
    Element Should Contain    ${wood_file_dropdown}    新建
    Mouse Over    ${wood_setting_button}
    Element Should Be Visible    ${wood_setting_button_name}    設置
    Element Should Contain    ${wood_setting_dropdown}    語言
    Page Should Contain    最新
    Mouse Over    ${wood_hex_button}
    Element Text Should Be    ${wood_hex_button_name}    硬件
    Element Should Contain    ${wood_hex_dropdown}/div/div    新建硬件作品
    Mouse Over    ${wood_library_manage_button}
    Element Should Contain    ${wood_library_manage_button}    庫管理
    Element Should Contain    ${wood_run_button}    運行
    Element Text Should Be    ${wood_workspace_run_button}    運行
    Element Should Be Visible    ${wood_trans_button}    代碼模式
    Page Should Contain Element    ${wood_toolbox_xpath}/div    limit=11
    Element Should Be Visible    ${wood_toolbox_events}
    : FOR    ${i}    IN RANGE    ${len_block_list}    10
    \    Mouse Over    ${wood_toolbox_xpath}/div[${i+1}]
    \    Element Text Should Be    ${wood_toolbox_xpath}/div[${i+1}]/div/span[2]    @{com_font_block}[${i}]
    Click Element    ${wood_toolbox_xpath}/div[10]
    Element Should Be Visible    ${wood_toolbox_xpath}/div[11]/div/span[2]    @{com_font_block}[10]

i18n_tab_name
    ${tab_name}    Get Text    ${wood_tab_cur_name}
    Should Be Equal As Strings    ${tab_name}    新的作品
    Setting Language
    Click Element    ${wood_setting_language_xpath}[3]
    ${tab_name}    Get Text    ${wood_tab_cur_name}
    Should Be Equal As Strings    ${tab_name}    新的作品
    New Built
    ${tab_name}    Get Text    ${wood_tab_cur_name}
    Should Be Equal As Strings    ${tab_name}    New project
    Setting Language
    Click Element    ${wood_setting_language_xpath}[2]
    ${tab_name}    Get Text    ${wood_tab_cur_name}
    Should Be Equal As Strings    ${tab_name}    New project
    New Built_hex
    Setting Language
    Click Element    ${wood_setting_language_xpath}[3]
    ${tab_name}    Get Text    ${wood_tab_cur_name}
    Should Be Equal As Strings    ${tab_name}    microbit作品
    New Microbit
    ${tab_name}    Get Text    ${wood_tab_cur_name}
    Should Be Equal As Strings    ${tab_name}    Microbit Project
    Click Element    ${wood_tab_cur_close}
    ${tab_name}    Get Text    ${wood_tab_cur_name}
    Should Be Equal As Strings    ${tab_name}    microbit作品

search_function
    Mouse Over    ${wood_setting_button}
    Click Element    ${wood_setting_button}
    Element Should Be Visible    ${wood_setting_search}    意见反馈
    Click Element    ${wood_trans_button}
    Element Should Be Visible    ${wood_trans_button}    积木模式
    Mouse Over    ${wood_setting_button}
    Click Element    ${wood_setting_button}
    Element Text Should Be    ${wood_setting_search}    搜索
    Click Element    ${wood_setting_search}
    ${search_value}    Get Value    ${wood_search_value}
    Should Be Equal    ${search_value}    Find
    Click Element    ${wood_search_pull_down}
    ${replace_value}    Get Value    ${wood_replace_value}
    Should Be Equal    ${replace_value}    Replace
    Element Should Be Visible    ${wood_replace_value}

library_manage
    Mouse Over    ${wood_library_manage_button}
    Element Should Contain    ${wood_library_manage_button}    库管理
    Click Element    ${wood_library_manage_button}
    Element Should Be Visible    ${wood_library_frame_库管理}    库管理
    Page Should Contain Element    ${wood_library_xpath}    limit=26
    Execute Javascript    document.getElementsByClassName('style__libs-item-wrap__1xnIf')[0].scrollTop=2400
    Sleep    1
    Element Text Should Be    ${wood_install_third_lib}    安装其他第三方库
    Click Element    ${wood_install_third_lib}
    Element Text Should Be    ${wood_library_others}    其他库
    Click Element    ${wood_library_others_close}
    Page Should Not Contain    其他库
    Mouse Over    ${wood_library_manage_button}
    Element Should Contain    ${wood_library_manage_button}    库管理
    Click Element    ${wood_library_manage_button}
    Element Should Be Visible    ${wood_library_frame_库管理}    库管理
    Click Element    ${wood_install_third_lib}
    Element Should Contain    ${wood_library_others_return}    返回
    Click Element    ${wood_library_others_return}
    Click Element    ${wood_library_others_close}
    Element Should Not Be Visible    ${wood_library_frame_库管理}    库管理

library_search
    Mouse Over    ${wood_library_manage_button}
    Click Element    ${wood_library_manage_button}
    Input Text    ${wood_library_search}    pygame
    Sleep    1
    ${wood_library_num}    Get Element Count    ${wood_library_xpath}
    # 这里有pygame和新增的pygame Zero
    Should Be Equal As Integers    ${wood_library_num}    2
    Page Should Contain    已安装
    Sleep    1
    Input Text    ${wood_library_search}    py
    Page Should Contain Element    ${wood_library_xpath}    limit > ${wood_library_num}
    Input Text    ${wood_library_search}    ty
    Element Text Should Be    ${wood_third_noresult}    无搜索结果
    Press Key    ${wood_library_search}    \\8
    Press Key    ${wood_library_search}    \\8
    Page Should Contain Element    ${wood_library_xpath}    limit=24
    Execute Javascript    document.getElementsByClassName('style__libs-item-wrap__1xnIf')[0].scrollTop=2400
    Click Element    ${wood_install_third_lib}
    Page Should Contain    返回
    Input Text    ${wood_library_third_search}    ty
    Click Element    ${wood_third_search_icon}
    Wait Until Element Contains    ${wood_third_search_result}    ty     15
    Element Text Should Be    ${wood_lib_install_button}    安装
    Click Element    ${wood_lib_install_button}
    Mouse Over    ${wood_lib_install_cancle}
    Element Should Contain    ${wood_lib_install_cancle}    取消
    Wait Until Element Contains    ${wood_lib_install_cancle}    已安装     5
    Input Text    ${wood_library_third_search}    pygame
    Click Element    ${wood_third_search_icon}
    Wait Until Element Contains    ${wood_third_search_toast}    Pygame已在库列表中，请返回上一页安装！    5
    Input Text    ${wood_library_third_search}    ...
    Press Key    ${wood_library_third_search}    \\13
    Wait Until Page Contains    未找到名为
    Input Text    ${wood_library_third_search}    ty
    Press Key    ${wood_library_third_search}    \\13
    Wait Until Element Contains    ${wood_third_search_toast}    ty已安装，请直接使用！    10
