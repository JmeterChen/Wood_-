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
    Page Should Contain Element    ${clodu_frame}    limit=1
    Element Text Should Be    ${clodu_frame}/span[2]    从本地打开
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
    Page Should Contain Element    ${clodu_frame}    limit=1
    Element Text Should Be    ${clodu_frame}/span[2]    從本地打開
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
    Page Should Contain Element    ${clodu_frame}    limit=1
    Element Text Should Be    ${clodu_frame}/span[2]    Open a local file
    Click Element   ${cloud_close}
    Element Should Not Be Visible    ${wood_打开文件页面}
    Mouse Over    ${login_入口}
    Click Element    ${login_退出登录}
    Element Should Be Visible    ${wood_未登录}    未登录


button_file_open2
    Mouse Over    ${wood_文件}
    # 未登录点击打开选项
    ${num}   Set Variable    [1] 
    Click Element    ${wood_文件_choices}${num}
    assert_login_exist
    # 使用常用账号登录
    login     ${wood_username2}    ${wood_password}
    Mouse Over    ${wood_文件}
    # 已登录点击打开选项
    