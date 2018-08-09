*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot

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

# home_003
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


# login_004
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


# third_part_005
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

# open_file_006
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


# file_button_007
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     Element Should Contain    ${bjym_编辑页面}    import
#     ##未登录状态###
#     Mouse over    ${wood_文件}
#     #验证在未登录状态下点击【打开】弹出登录按钮
#     Click Element    ${wood_文件_打开}
#     Sleep    0.5
#     assert_login_exist
#     Element Should Contain    ${bjym_编辑页面}    import
#     #修改默认作品的名称
#     Click Element    ${wood_作品名称}
#     Input Text    ${wood_作品名称默认}    ${wood_作品名称_科比}
#     Sleep    1
#     Mouse over    ${wood_文件}
#     # 验证未登录未保存状态下点击【新建】弹出保存提示框
#     Click Element    ${wood_文件_新建}
#     Sleep    0.5
#     Element Should Be Visible    ${wood_保存提示}
#     Element Should Contain    ${wood_保存提示}    当前作品还没有保存哦
#     Element Should Contain    ${wood_保存提示}    是否要继续
#     #验证 点击【否】按钮-返回作品继续编辑
#     Click Element    ${wood_保存提示_否}
#     Sleep    0.2
#     Element Should Contain    ${bjym_编辑页面}    import
#     #再次在未登录情况下点击【另存为】弹出登录按钮
#     Mouse over    ${wood_文件}
#     Click Element    ${wood_文件_另存为}
#     Sleep    0.5
#     assert_login_exist
#     Sleep    0.5
#     Element Should Contain    ${bjym_编辑页面}    import
#     Teardown


# open_py__008
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     #验证打开文件hover正常显示
#     Mouse over    ${wood_文件}
#     Element Should Be Visible    ${wood_文件_打开本地作品}    打开本地作品
#     #用特写的方法查找指定文件夹中的.Py文件，将文件名字放进一个列表
#     @{test_py_name}    Find Py    ${py_file_dir}
#     #计算列表长度
#     ${length}    Evaluate    len(@{test_py_name})
#     :FOR    ${i}    IN RANGE    ${length}
#     \    Mouse over    ${wood_文件}
#     \    Click Element    ${wood_文件_打开本地作品}
#     \    Sleep    1
#     \    Win Wait    打开    \    2
#     \    Win Exists    打开
#     \    Win Active    打开
#     \    log    ${py_file_dir}
#     \    Sleep    0.5
#     \    Control Set Text    打开    \    1148    ${py_file_dir}
#     \    Sleep    0.5
#     \    Control Click    打开    \    1
#     \    Sleep    0.5
#     \    Control Set Text    打开    \    1148     ${test_py_name[${i}]}
#     \    Sleep    0.5
#     \    Control Click    打开    \    1
#     \    Wait Until Element Is Visible    ${wood_运行}
#     \    Click Element    ${wood_运行}
#     \    Sleep    4
#     \    Element Should Be Visible    ${wood_停止}
#     \    Sleep    1
#     \    ${test_zpm}    Get Value     ${zpm_作品名}
#     \    Should Contain    ${test_zpm}    pytest
#     \    Click Element    ${wood_停止}
#     \    Sleep    1
#     Teardown


save__009
    open bs
    Click Element    ${tgzy_跳过指引}
    #获取默认作品名称
    ${wood_pyname}    Get Element Attribute    ${wood_作品名称}    value
    ###未登录状态###
    #验证未登录状态下点击【保存】弹出登录框
    Click Element    ${wood_保存文件按钮}
    Sleep    1
    #检查登录框是否存在
    Element Should Contain    //*[@id="root"]/div/div[2]/div[2]/div[3]/span[3]/div/span    登录
    Click Element    ${wood_01close}
    login
    ###登录状态###
    #保存默认作品
    Click Element    ${wood_保存文件按钮}    #点击【保存文件】按钮
    Sleep    1
    ${test_savename}    Get Element Attribute    ${wood_作品名称}    value
    @{test_newname}=    Split String    ${test_savename}    -
    Should Contain    ${test_newname[0]}    ${wood_pyname}
    #保存线上作品
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    2
    ${test_workname1}    Get Text    //*[@id="file_dialog"]/div/div[2]/div[2]/span[3]
    Click Element    //*[@id="file_dialog"]/div/div[2]/div[2]/span[1]
    ${test_workname2}    Get Element Attribute    ${wood_作品名称}    value
    Should Contain    ${test_workname1}    ${test_workname2}
    Teardown


# code_pattern_010
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     #验证切换模式按钮正常显示
#     Mouse over    ${wood_积木模式}
#     Element Should Be Visible    ${wood_积木模式}
#     Element Should Contain    ${wood_积木模式}     积木模式
#     Sleep    0.4
#     Mouse over    ${wood_太阳}
#     Element Should Be Visible    ${wood_白天}
#     Element should Contain    ${wood_白天}    白天
#     Sleep    0.4
#     #模式切换按钮功能正常（代码切换到积木）
#     Click Element    ${wood_积木模式}
#     Sleep    0.5
#     #验证成功切换到积木模式
#     Element Should Be Visible    ${wood_事件积木}
#     Element Should Contain    ${wood_事件积木}    事件
#     Element Should Not Be Visible    ${wood_白天}    白天
#     Sleep    0.4
#     Element Should Be Visible     ${wood_代码模式}
#         Element Should Contain    ${wood_代码模式}     代码模式
#     Sleep    2
#     #模式切换按钮功能正常（积木切换到代码）
#     Click Element    ${wood_代码模式}
#     Sleep    1
#     #验证成功切换到代码模式
#     Mouse over    ${wood_太阳}
#     Element Should Be Visible    ${wood_白天}
#     Element Should Be Visible    ${wood_积木模式}
#     Element Should Contain    ${wood_积木模式}     积木模式
#     Sleep    1
#     Teardown


# help_011
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     #将当前网址设为变量保存
#     ${Current_URL}    Set Variable    Get Location
#     #验证帮助图标hover正常
#     Mouse over    ${wood_帮助}
#     Element Should Be Visible    ${wood_帮助}
#     Element Should Contain    ${wood_帮助}    帮助
#     #验证点击帮助按钮跳转到wood编辑器介绍页面
#     Click Element    ${wood_帮助}
#     #点击帮助，进入到帮助页面
#     Sleep    5
#     Select Window    title=Introduction · GitBook
#     Run Keyword If    '${Current_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Be    ${help_URL_test}
#     ...    ELSE IF    '${Current_URL}' == 'https://wood.codemao.cn/'    Location Should Be    ${help_URL}
#     ...    ELSE IF    '${Current_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Browser    ${help_URL_staging}
#     ${wood_introduce}    Get Text    //*[@id="1-认识wood编辑器"]
#     should Contain    ${wood_introduce}    1. 认识Wood编辑器
#     #关闭帮助窗口
#     Close Window
#     Sleep    2
#     #验证正常回到代码编辑器
#     Select Window    title=编程猫代码编辑器
#     Title Should Be    编程猫代码编辑器
#     Sleep    1
#     Teardown

# loginout&myfile_012
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     #这里login是上述登录封装起来的关键字
#     #先正常登录，此步骤已保证登录成功
#     login
#     ${Current_URL}    Set Variable    Get Location
#     #验证登录成功
#     Mouse over     ${wood_登录入口}
#     Element Should Contain    ${wood_我的作品}    我的作品
#     Element Should Contain    ${wood_退出登录}    退出登录
#     #验证点击我的作品按钮功能正常
#     Click Element    ${wood_我的作品}
#     Sleep    3
#     Select Window    编程猫Wood编辑器
#     Run Keyword If    '${Current_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Be    ${myfile_URL_test}
#     ...    ELSE IF    '${Current_URL}' == 'https://wood.codemao.cn/'    Location Should Be    ${myfile_URL}
#     ...    ELSE IF    '${Current_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Browser    ${myfile_URL_staging}
#     Element Text Should Be    //*[@id="root"]/div/div[2]/div/div[1]/div[1]/p    我的作品
#     #关闭官网我的作品
#     Close Window
#     Sleep    1
#     #验证正常回到代码编辑器
#     Select Window    title=编程猫代码编辑器
#     Title Should Be    编程猫代码编辑器
#     #点击退出登录按钮
#     Mouse over     ${wood_登录入口}
#     Click Element    ${wood_退出登录}
#     Sleep    1
#     #验证是否已经成功退出登录
#     Element Should Be Visible    ${wood_未登录}
#     Element Should Contain    ${wood_未登录}    未登录
#     Select Window    title=编程猫代码编辑器
#     Teardown

# sun_night_013
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     Sleep    0.5
#     #验证太阳hover显示正常
#     Mouse over    ${wood_太阳}
#     #验证白天模式下只显示白天，夜间隐藏
#     Element Should Contain    ${wood_白天}    白天
#     Element Should Not Be Visible    ${wood_月亮}
#     #点击太阳图标，切换到夜间模式
#     Click Element    ${wood_白天}
#     Sleep    0.5
#     #验证切换夜间模式成功，页面中月亮hover显示正常
#     Mouse over    ${wood_月亮}
#     #验证夜间模式下只显示夜间，白天隐藏
#     Element Should Contain    ${wood_夜间}    夜间
#     Element Should Not Be Visible    ${wood_太阳}
#     Click Element    ${wood_月亮}
#     Sleep    0.5
#     #验证切换日间模式成功，页面中太阳hover显示正常
#     Element Should Be Visible    ${wood_太阳}
#     Mouse over    ${wood_太阳}
#     Element Should Contain    ${wood_白天}    白天
#     Element Should Not Be Visible    ${wood_月亮}
#     Teardown


# fold_unfold_014
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     Sleep    0.5
#     #验证收起hover显示正常
#     Mouse over    ${wood_收起按钮}
#     Element Should Be Visible    ${wood_收起}
#     Element Should Contain    ${wood_收起}    收起
#     #点击收起按钮，验证功能
#     Click Element    ${wood_收起按钮}
#     Sleep    1
#     Mouse over    ${wood_展开按钮}
#     Element Should Be Visible     ${wood_展开}
#     Element Should Contain    ${wood_展开}    展开
#     Sleep    2
#     #验证展开hover显示正常
#     Mouse over    ${wood_展开按钮}
#     Element Should Be Visible     ${wood_展开}
#     Element Should Contain    ${wood_展开}    展开
#     Click Element    ${wood_展开按钮}
#     Sleep    0.5
#     Mouse over    ${wood_收起按钮}
#     Element Should Be Visible    ${wood_收起}
#     Element Should Contain    ${wood_收起}    收起
#     Sleep    0.5
#     Teardown


# full_screen_015
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     Sleep    0.5
#     #验证全屏hover显示正常
#     Mouse over    ${wood_全屏按钮}
#     Element Should Be Visible    ${wood_全屏}
#     Element Should Contain    ${wood_全屏}    全屏
#     #验证全屏按钮功能正常
#     Click Element    ${wood_全屏按钮}
#     Sleep    1
#     #验证退出全屏hover显示正常
#     Mouse over    ${wood_退出全屏按钮}
#     Element Should Be Visible    ${wood_退出全屏}
#     Element Should Contain    ${wood_退出全屏}    退出全屏
#     #验证退出全屏按钮功能正常
#     Click Element   ${wood_退出全屏按钮}
#     Sleep    0.5
#     #验证退出全屏后全屏hover显示正常
#     Mouse over    ${wood_全屏按钮}
#     Element Should Be Visible    ${wood_全屏}
#     Element Should Contain    ${wood_全屏}    全屏
#     Sleep    0.5
#     Teardown


# Run_stop_clear_016
#     open_bs
#     Click Element    ${tgzy_跳过指引}
#     Sleep    0.5
#     #运行区运行按钮功能正常
#     Mouse over    ${wood_运行}
#     Element Should Be Visible    ${wood_运行}
#     Element Should Contain    ${wood_运行}    运行
#     #点击运行按钮
#     Click Element    ${wood_运行}
#     Sleep    0.5
#     #等待代码运行完毕
#     Wait Until Element Is Visible    ${wood_运行}
#     #验证代码中欢迎来到源码世界显示正常
#     Mouse over    ${wood_Run_area}
#     Element Should Be Visible    ${wood_Run_area}
#     Element Should Contain    ${wood_welcome}    欢迎来到源码世界！
#     Sleep    1
#     #运行区运行按钮功能正常
#     Mouse over    ${wood_运行}
#     Element Should Be Visible    ${wood_运行}
#     Element Should Contain    ${wood_运行}    运行
#     #点击开始运行，等待停止按钮显示
#     Click Element    ${wood_运行}
#     ##运行区停止按钮功能正常
#     #点击运行按钮等待停止按钮出现
#     Wait Until Element Is Visible    ${wood_停止}
#     Mouse over    ${wood_停止}
#     Element Should Be Visible    ${wood_停止}
#     Element Should Contain    ${wood_停止}    停止
#     #点击停止按钮
#     Click Element    ${wood_停止}
#     Sleep   0.5
#     #验证代码没运行完毕，运行区应该没有输出
#     Element Should Not Contain    ${wood_welcome}    欢迎来到源码世界！
#     Sleep    1
#     #验证清除按钮功能正常
#     #先运行代码
#     Mouse over    ${wood_运行}
#     Element Should Be Visible    ${wood_运行}
#     Element Should Contain    ${wood_运行}    运行
#     #点击运行按钮
#     Click Element    ${wood_运行}
#     Sleep    0.5
#     #等待代码运行完毕
#     Wait Until Element Is Visible    ${wood_运行}
#     #验证代码中欢迎来到源码世界显示正常
#     Mouse over    ${wood_Run_area}
#     Element Should Be Visible    ${wood_Run_area}
#     Element Should Contain    ${wood_welcome}    欢迎来到源码世界！
#     Sleep    0.5
#     Mouse over    ${wood_清除}
#     Element Should Be Visible    ${wood_清除}
#     Element Should Contain    ${wood_清除}    清除
#     #点击清除按钮
#     Click Element    ${wood_清除}
#     Sleep    0.5
#     Element Should Not Contain    ${wood_welcome}    欢迎来到源码世界！
#     Sleep    0.5
#     Teardown