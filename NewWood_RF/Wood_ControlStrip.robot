*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           TestLibrary
Library           String
Resource          NewWood_Resource.robot

*** Variables ***

*** Test Cases ***

# open_wood_001
#     open_bs
#     Title Should Be    编程猫代码编辑器
#     #拥有新手指导
#     Element Should Contain    ${zhiyin_指引001}    欢迎来到Wood编辑器！
#     #点击跳过指引
#     Click Element    ${tgzy_跳过指引}
#     #编辑页面默认代码
#     Element Should Contain    ${bjym_编辑页面}    import
#     Teardown

# wood_zhiyin_002
#     open_bs
#     Title Should Be    编程猫代码编辑器
#     #拥有新手指导
#     Element Should Contain    ${zhiyin_指引001}    欢迎来到Wood编辑器！
#     Click Element    ${zhiyin_任意处}
#     Sleep    0.2
#     Element Should Contain    ${zhiyin_指引002}    这里是编程区，在这里输入python代码。
#     Click Element    ${zhiyin_箭头}
#     Sleep    0.2
#     Element Should Contain    ${zhiyin_指引003}    点击这里可以切换到积木模式哦！快来试试吧！
#     Click Element    ${整个页面}
#     Sleep    0.2
#     Element Should Contain    ${zhiyin_指引004}    这里是积木编码区，你可以在这里摆放积木。注意代码和积木之间是可以转换的哦！
#     Click Element    ${zhiyin_指引004}
#     Sleep    0.2
#     Element Should Contain    ${zhiyin_指引005}    这里是终端区，这里将看到你的代码运行结果。
#     Click Element    ${zhiyin_指引005}
#     Sleep    0.2
#     Element Should Contain    ${zhiyin_指引006}    这里是海龟图专门的绘制区域哦。
#     Click Element    ${zhiyin_指引006}
#     Sleep    0.2
#     Element Should Contain    ${zhiyin_指引007}    现在点击“运行”，看看效果吧
#     Click Element    ${zhiyin_指引007}
#     Sleep    0.2
#     Element Should Be Visible    ${shijian_事件}
#     Element should Contain    ${shijian_事件}    事件
#     Sleep    0.5
#     Teardown

# home_002
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     #验证首页hover显示正常
#     Mouse over    ${wood_首页按钮}
#     Element Should Be Visible    ${wood_首页}
#     Element Should Contain    ${wood_首页}    首页
#     #点击首页按钮
#     Click Element    ${wood_首页按钮}
#     Sleep    2
#     #验证能够正常进入到首页
#     Select Window    title =编程猫Wood编辑器
#     Run Keyword If    '${wood_URL}' == 'https://wood.codemao.cn/'    Location Should Contain    https://python.codemao.cn/
#     ...    ELSE IF    '${wood_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Contain    https://dev-python.codemao.cn/
#     ...    ELSE IF    '${wood_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Contain    https://staging-python.codemao.cn/
#     Teardown


# login_003
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     #验证登录功能正常
#     Click Element    ${wood_登录入口}
#     Input Text    ${wood_01用户名}    ${wood_username}
#     Input Text    ${wood_01密码}    ${wood_password}
#     Click Element    ${wood_01登录按钮}
#     #验证hover用户昵称显示选项
#     Mouse Over    ${wood_登录入口}
#     ${test_wdzp}    Get Text    ${wood_我的作品}
#     Should Contain    ${test_wdzp}    我的作品
#     ${test_tcdl}    Get Text    ${wood_退出登录}
#     Should Contain    ${test_tcdl}    退出登录
#     Element Should Contain    ${wood_登录入口}    ${test_nickname}
#     #验证退出登录功能正常
#     Click Element    ${wood_退出登录}
#     Element Should Contain    ${wood_登录入口}    未登录
#     #验证登录框可直接关闭1
#     Click Element    ${wood_登录入口}
#     Click Element    ${wood_01close}
#     ${test_wdl}    Get text    ${wood_登录入口}
#     Should contain    ${test_wdl}    未登录
#     #验证登录框可直接关闭2
#     Click Element    ${wood_登录入口}
#     Input Text    ${wood_01用户名}    不合法
#     Input Text    ${wood_01密码}    不合法
#     Click Element    ${wood_01close}
#     ${test_wdl}    Get text    ${wood_登录入口}
#     Should contain    ${test_wdl}    未登录
#     #验证用户名密码非空校验
#     Click Element    ${wood_登录入口}
#     Click Element    ${wood_01登录按钮}
#     ${test_yhmNull}    Get Text    ${wood_01用户名报错文本}
#     Should Contain    ${test_yhmNull}    用户名不能为空
#     Input Text    ${wood_01密码}    ${wood_password}
#     Click Element    ${wood_01登录按钮}
#     ${test_yhmNull}    Get Text    ${wood_01用户名报错文本}
#     Should Contain    ${test_yhmNull}    用户名不能为空
#     Click Element    ${wood_01close}
#     #验证密码非空校验
#     Click Element    ${wood_登录入口}
#     Input Text    ${wood_01用户名}    ${wood_username}
#     Click Element    ${wood_01登录按钮}
#     ${test_mmNull}    Get Text    ${wood_01密码报错文本}
#     Should Contain    ${test_mmNull}    密码不能为空
#     Click Element    ${wood_01close}
#     #验证匹配校验
#     Click Element    ${wood_登录入口}
#     Input Text    ${wood_01用户名}    ${wood_username}
#     Input Text    ${wood_01密码}    ${wood_username}
#     Click Element    ${wood_01登录按钮}
#     Set Browser Implicit Wait    3
#     Element Should Contain    ${wood_01报错文本}    用户名或密码不正确
#     Teardown


# third_part_004
#     open bs
#     Click Element    ${tgzy_跳过指引}
#        Sleep    0.3
#     Click Element    ${wood_登录入口}
#     Sleep    0.5
#     #验证登录页面含有第三方登录接口
#     Element Should Contain    ${wood_第三方登录}    第三方登录
#     #验证通过QQ登录
#     Click Element    ${wood_QQ登录}
#     Sleep    0.5
#     #跳转到QQ登录界面正常
#     Select Window    NEW
#     Title Should Be    QQ帐号安全登录
#     Close Window
#     Select Window    编程猫代码编辑器
#     Click Element    ${wood_登录入口}
#     Sleep    0.3
#     Click Element    ${wood_微信登录}
#     #跳转到微信登录界面正常
#     Select Window    NEW
#     Title Should Be    微信登录
#     Close Window
#     Teardown

# open_file_005
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     ##未登录状态###
#     # 验证未登录状态下点击【打开】弹出登录框
#     Mouse over    ${wood_文件}
#     Click Element    ${wood_文件_打开}
#     Sleep    1
#     assert_login_exist
#     login
#     ###登录状态###
#     # new built
#     # #验证登录状态下点击打开弹出打开作品页面
#     Mouse over    ${wood_文件}
#     Click Element    ${wood_文件_打开}
#     #验证打开作品页面存在
#     Element Should Be Visible    ${wood_打开作品页面}
#     ##选择打开某个作品(名称短)
#     Input Text    ${wood_打开作品_搜索}    ${wood_作品名称短}
#     Click Element    ${wood_打开作品_搜索icon}
#     Element Should Be Visible    ${wood_打开作品_作品}
#     ${wood_作品名称new}    Set Variable    ${wood_作品名称短}
#     Element Should Contain    ${wood_打开作品_作品1}    ${wood_作品名称new}
#     Click Element    ${wood_打开作品_作品}
#     Sleep    1
#     ${test_zpm}    Get Value    ${wood_作品名称}
#     Should Contain    ${test_zpm}    ${wood_作品名称短}
#     open_testpy    #打开一个本地作品后打开作品
#     Mouse over    ${wood_文件}
#     Click Element    ${wood_文件_打开}
#     Wait Until Page Contains Element    ${wood_打开作品页面}
#     ##选择打开某个作品(名称长)
#     Input Text    ${wood_打开作品_搜索}    ${wood_作品名称长}
#     Click Element    ${wood_打开作品_搜索icon}
#     Element Should Be Visible    ${wood_打开作品_作品}
#     ${wood_作品名称new}    Set Variable    13斐波那契数列...
#     Element Should Contain    ${wood_打开作品_作品1}    ${wood_作品名称new}
#     Click Element    ${wood_打开作品_作品}
#     Sleep    1
#     ${test_zpm}    Get Value    ${wood_作品名称}
#     Should Contain    ${test_zpm}    ${wood_作品名称长}
#     Click Element    ${wood_保存文件按钮}    #保存上个作品后打开新作品
#     Mouse over    ${wood_文件}
#     Click Element    ${wood_文件_打开}
#     Wait Until Page Contains Element    ${wood_打开作品页面}
#     Input Text    ${wood_打开作品_搜索}    ${wood_作品任意测试}
#     # ${GetLen}    Cal Filename    ${wood_作品任意测试}
#     Click Element    ${wood_打开作品_搜索icon}
#     Element Should Be Visible    ${wood_打开作品_作品}
#     ${wood_作品名称new}    Set Variable    12天天向上_pyt...
#     # Run Keyword If    ${GetLen} <= 14    ${wood_作品名称new}    Set Variable    ${wood_作品任意测试}
#     # ...    ELSE If    ${GetLen} >14    ${wood_作品名称new}    Set Variable    12天天向上_pyt...
#     Element Should Contain    ${wood_打开作品_作品1}    ${wood_作品名称new}
#     Click Element    ${wood_打开作品_作品}
#     Sleep    1
#     ${test_zpm}    Get Value    ${wood_作品名称}
#     Should Contain    ${test_zpm}    ${wood_作品任意测试}
#     Teardown

creat_file_006
    open_bs
    Click Element    ${tgzy_跳过指引}
    Element Should Contain    ${bjym_编辑页面}    import
    ##未登录状态###
    # 验证未登录状态下点击【新建】弹出保存提示框
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_新建}
    Sleep    0.5
    Element Should Be Visible    ${wood_保存提示}
    Element Should Contain    ${wood_保存提示}    当前作品还没有保存哦
    #点击【否】按钮-打开默认作品
    Click Element    ${wood_保存提示_否}
    Sleep    0.2
    Element Should Not Contain    ${bjym_编辑页面}    import
    #点击【是】按钮弹出登录框
    Click Element    ${wood_保存提示_是}
    Sleep    0.2
    assert_login_exist
    login
    Wait Until Page Contains Element    ${wood_保存成功icon}    6
    Teardown


# case_001
#     Open browser    http://psms.findingroof.com/h5/power-login.html    Chrome
#     Input Text    id=username    taoding
#     Input Password    id=password    tdroof@201803
#     select checkbox    id=remeber-user
#     Click button    id=login-button
#     Maximize Browser Window
#     Sleep    4
#     ${title}    Get title
#     should contain    ${title}     淘顶网电站运维管理系统
#     Click Element    ${电站图标}
#     Teardown