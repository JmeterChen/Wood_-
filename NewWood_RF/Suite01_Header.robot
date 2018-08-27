*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot
Test Setup       open_bs
Test Teardown       Teardown



*** Variables ***

*** Test Cases ***
open_wood_001
    Title Should Be    编程猫代码编辑器
    #拥有新手指导
    Element Should Contain    ${zhiyin_指引001}    欢迎来到Wood编辑器！
    #点击跳过指引
    Click Element    ${tgzy_跳过指引}
    #编辑页面默认代码
    Element Should Contain    ${bjym_编辑页面}    import

wood_zhiyin_002
    Title Should Be    编程猫代码编辑器
    #拥有新手指导
    Element Should Contain    ${zhiyin_指引001}    欢迎来到Wood编辑器！
    Click Element    ${zhiyin_任意处}
    Sleep    0.2
    Element Should Contain    ${zhiyin_指引002}    这里是编程区，在这里输入python代码。
    Click Element    ${zhiyin_箭头}
    Sleep    0.2
    Element Should Contain    ${zhiyin_指引003}    点击这里，可以在积木模式、代码模式间切换哦！快来试试吧！
    Click Element    ${zhiyin_任意处}
    Sleep    0.2
    Element Should Contain    ${zhiyin_指引004}    这里是积木编码区，你可以在这里摆放积木。注意代码和积木之间是可以转换的哦！
    Click Element    ${zhiyin_指引004}
    Sleep    0.2
    Element Should Contain    ${zhiyin_指引005}    这里是终端区，这里将看到你的代码运行结果。
    Click Element    ${zhiyin_指引005}
    Sleep    0.2
    Element Should Contain    ${zhiyin_指引006}    这里是海龟图专门的绘制区域哦。
    Click Element    ${zhiyin_指引006}
    Sleep    0.2
    Element Should Contain    ${zhiyin_指引007}    现在点击“运行”，看看效果吧
    Click Element    ${zhiyin_指引007}
    Sleep    0.2
    #新手指引结束后默认为积木模式
    Element Should Be Visible    ${shijian_事件}
    Element should Contain    ${shijian_事件}    事件
    Sleep    0.5

home_003
    Click Element    ${tgzy_跳过指引}
    #点击首页按钮
    Click Element    ${wood_首页按钮}
    Sleep    2
    #验证能够正常进入到首页
    Select Window    NEW
    Title Should Be    编程猫-海龟编辑器
    Run Keyword If    '${wood_URL}' == 'https://wood.codemao.cn/'    Location Should Contain    https://python.codemao.cn/
    ...    ELSE IF    '${wood_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Contain    https://dev-python.codemao.cn/
    ...    ELSE IF    '${wood_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Contain    https://staging-python.codemao.cn/
    Close Window
    Select Window    title=编程猫代码编辑器
    Title Should Be    编程猫代码编辑器


file_open_004
    Click Element    ${tgzy_跳过指引}
    ##未登录状态###
    #验证未登录状态下点击【打开】弹出登录框
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    1
    assert_login_exist
    login
    ###登录状态###
    # #验证登录状态下点击打开弹出打开作品页面
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    0.5
    #验证打开作品页面存在.文案显示正常
    Element Should Be Visible    ${wood_打开文件}
    #关闭云端作品弹窗
    Click Element    ${wood_打开文件_close}
    Sleep    0.5
    Element Should Not Be Visible    ${wood_打开文件}

file_open_search_box
    Click Element    ${tgzy_跳过指引}
    ##未登录状态###
    #验证未登录状态下点击【打开】弹出登录框
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    1
    input text    ${wood_01用户名}    ${wood_username}
    input text    ${wood_01密码}    ${wood_password}
    Click Element    ${wood_01登录按钮}
    Wait Until Page Contains Element    ${wood_退出登录}
    ###登录状态###
    #验证登录状态下点击打开弹出打开作品页面
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    0.5
    #搜索框输入内容之前页面元素显示正常
    Element Text Should Be    ${wood_打开文件}    打开文件
    Element Should Be Visible    ${wood_打开文件_搜索}
    Element Text Should Be    ${wood_打开文件_框框1}    从本地打开
    Element Should Not Be Visible    ${wood_打开文件_无搜索结果}
    #搜索框输入短作品名
    Input Text    ${wood_打开文件_搜索}    ${wood_短作品名}
    Sleep    0.5
    #当搜索到作品后，框框1的显示发生变化
    Element Should Not Be Visible    ${wood_打开文件_框框1}    从本地打开
    Element Should Contain    ${wood_打开文件_作品1名称}    ${wood_短作品名}
    log    短作品名显示OK
    Sleep    0.5
    #搜索框输入长作品名
    Input Text    ${wood_打开文件_搜索}    ${wood_长作品名}
    Sleep    0.5
    #当搜索到作品后，框框1的显示发生变化
    Element Should Not Be Visible    ${wood_打开文件_框框1}    从本地打开
    ${wood_作品名称new}    Set Variable    13斐波那契数列...
    Element Text Should Be     ${wood_打开文件_作品1名称}    ${wood_作品名称new}
    log    长作品名显示OK
    Sleep    0.5
    #随便输入名称，搜索不存在的作品名
    Input Text    ${wood_打开文件_搜索}    ${wood_不存在作品名}
    Sleep    0.5
    #提示没有搜索到对应作品
    Element Text Should Be    ${wood_打开文件_无搜索结果}    无搜索结果
    log    不存在作品显示OK
    Sleep    0.5
    #清空输入空
    Clear Element Text    ${wood_打开文件_搜索}
    #输入文件名，查看时间显示正常
    Input Text    ${wood_打开文件_搜索}    ${wood_作品名称短}
    Sleep    0.5


file_open_filelist
    Click Element    ${tgzy_跳过指引}
    ##未登录状态###
    #验证未登录状态下点击【打开】弹出登录框
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    1
    input text    ${wood_01用户名}    ${wood_username}
    input text    ${wood_01密码}    ${wood_password}
    Click Element    ${wood_01登录按钮}
    Wait Until Page Contains Element    ${wood_退出登录}
    ###登录状态切换到代码模式###
    Click Element    ${wood_代码模式}
    Sleep    0.5
    #验证登录状态下点击打开弹出打开作品页面
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    0.5
    #默认列表作品初始排序
    ${test_zpm02}    Get Text    ${wood_打开文件_框框2作品名称}
    ${test_zpm03}    Get Text    ${wood_打开文件_框框3作品名称}
    Click Element    ${wood_打开文件_框框3}
    Sleep    0.5
    ${test_zpm}    Get Value    ${wood_作品名称}
    Should Contain    ${test_zpm}    ${test_zpm03}
    #对排序较后的作品进行更新
    Click Element    ${wood_保存按钮}
    Sleep     1
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    0.5
    #更新后作品会进行新的排序
    Element Text Should Be    ${wood_打开文件_框框2作品名称}    ${test_zpm03}
    Click Element    ${wood_打开文件_close}
    Sleep    0.2
    #切换到积木模式下，重复上述操作
    Click Element    ${wood_积木模式}
    Sleep    0.5
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    0.5
    #默认列表作品初始排序
    ${test_zpm02}    Get Text    ${wood_打开文件_框框2作品名称}
    ${test_zpm03}    Get Text    ${wood_打开文件_框框3作品名称}
    Click Element    ${wood_打开文件_框框3}
    Sleep    0.5
    ${test_zpm}    Get Value    ${wood_作品名称}
    Should Contain    ${test_zpm}    ${test_zpm03}
    #对排序较后的作品进行更新
    Click Element    ${wood_保存按钮}
    Sleep     1
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    0.5
    #更新后作品会进行新的排序
    Element Text Should Be    ${wood_打开文件_框框2作品名称}    ${test_zpm03}

file_creat_001
    Click Element    ${tgzy_跳过指引}
    Element Text Should Be    ${shijian_事件}    事件
    Click Element    ${wood_代码模式}
    Sleep    0.5
    Element Should Contain    ${bjym_编辑页面}    import
    #未登录状态
    Mouse over    ${wood_文件}
    #验证在未登录状态下点击【新建】
    Click Element    ${wood_文件_新建}
    Sleep    0.5
    #验证新建成功
    Element Should Not Contain    ${bjym_编辑页面}    import

file_creat_002
    Click Element    ${tgzy_跳过指引}
    Element Text Should Be    ${shijian_事件}    事件
    Click Element    ${wood_代码模式}
    Sleep    0.2
    Element Should Contain    ${bjym_编辑页面}    import
    #更改默认作品名称
    Clear Element Text    ${wood_作品名称}
    Input Text    ${wood_作品名称}    qwer
    Sleep    0.2
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_新建}
    Sleep    0.2
    #弹出保存提示弹窗，文案一致
    Element Should Contain    ${wood_保存提示}    当前作品还没有保存哦
    #点击弹窗关闭按钮
    Click Element    ${wood_保存提示_close}
    Sleep    0.2
    #验证关闭弹窗成功
    Element Should Not Be Visible    ${wood_保存提示}
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_新建}
    Sleep    0.2
    Element Should Contain    ${wood_保存提示}    当前作品还没有保存哦
    #验证取消按钮功能正常
    Click Element    ${wood_保存提示_取消}
    Sleep    0.2
    Element Should Not Be Visible    ${wood_保存提示}
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_新建}
    Sleep    0.2
    Element Should Contain    ${wood_保存提示}    当前作品还没有保存哦
    #点击确定按钮功能正常
    Click Element    ${wood_保存提示_确定}
    Sleep    0.2
    #确认新建作品页面显示正常
    Element Should Not Contain    ${bjym_编辑页面}    import
    ${test_zpm}    Get Value    ${wood_作品名称}
     Should Contain    ${test_zpm}    新的作品


file_save_as
    Click Element    ${tgzy_跳过指引}
    ${Current_URL}    Set Variable    Get Location
    Mouse over    ${wood_文件}
    #未登录状态下点击另存为触发登录弹窗
    Click Element    ${wood_文件_另存为}
    Sleep    0.2
    assert_login_exist
    Sleep    0.2
    login
    #将默认作品名称新建为另存为test
    Input Text    ${wood_作品名称}    另存为test
    #获取默认作品新名称
    ${test_zpm01}    Get Value    ${wood_作品名称}
    Mouse over    ${wood_文件}
    #点击另存为操作
    Click Element    ${wood_文件_另存为}
    Sleep    0.5
    #获取另存为成功后作品名称
    ${test_zpm02}    Get Value    ${wood_作品名称}
    #预期另存为成功后的作品名名称
    ${test_zpm02_pre}    add    ${test_zpm01}     -副本
    Sleep    0.5
    #第一次另存为操作后，根据作品名做断言
    Should Be Equal As Strings    ${test_zpm02}    ${test_zpm02_pre}
    log    第一次另存为Succeed！
    #第二次创建同名文件进行另存为操作
    Click Element    ${wood_文件_新建}
    Sleep    0.2
    Input Text    ${wood_作品名称}    另存为test
    Mouse over    ${wood_文件}
    #点击另存为操作
    Click Element    ${wood_文件_另存为}
    Sleep    0.5
    #获取另存为成功后作品名称
    ${test_zpm03}    Get Value    ${wood_作品名称}
    #预期另存为成功后的作品名名称
    ${test_zpm03_pre}    add    ${test_zpm01}     -副本-1
    Sleep    0.5
    #第二次另存为操作后，根据作品名做断言
    Should Be Equal As Strings    ${test_zpm03}    ${test_zpm03_pre}
    log    第二次另存为Succeed！
    #删除测试新增的4个作品
    Mouse Over    ${wood_登录入口}
    Click Element    ${wood_我的作品}
    Sleep    3
    Select Window    title=编程猫-海龟编辑器
    Run Keyword If    '${Current_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Be    ${myfile_URL_test}
    ...    ELSE IF    '${Current_URL}' == 'https://wood.codemao.cn/'    Location Should Be    ${myfile_URL}
    ...    ELSE IF    '${Current_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Browser    ${myfile_URL_staging}
    Element Text Should Be    //a[text()='我的作品']    我的作品
    Mouse Over    ${python_我的作品_框框4}
    Click Element    ${python_我的作品_框框4_删除}
    Element Should Contain    ${python_我的作品_删除弹窗}    确定删除该作品吗？
    Click Element    ${python_我的作品_删除弹窗_删除}
    Sleep    0.2
    Mouse Over    ${python_我的作品_框框3}
    Click Element    ${python_我的作品_框框3_删除}
    Element Should Contain    ${python_我的作品_删除弹窗}    确定删除该作品吗？
    Click Element    ${python_我的作品_删除弹窗_删除}
    Sleep    0.2
    Mouse Over    ${python_我的作品_框框2}
    Click Element    ${python_我的作品_框框2_删除}
    Element Should Contain    ${python_我的作品_删除弹窗}    确定删除该作品吗？
    Click Element    ${python_我的作品_删除弹窗_删除}
    Sleep    0.2
    Mouse Over    ${python_我的作品_框框1}
    Click Element    ${python_我的作品_框框1_删除}
    Element Should Contain    ${python_我的作品_删除弹窗}    确定删除该作品吗？
    Click Element    ${python_我的作品_删除弹窗_删除}
    Sleep    0.2
    #关闭当前窗口
    Close Window
    Sleep    2
    #验证正常回到代码编辑器
    Select Window    title=编程猫代码编辑器
    #验证已删除成功
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    0.2
    #在搜索框中输入已被全部删除含有另存为test等字眼的作品，显示应该是为没有结果即可
    Input Text    ${wood_打开文件_搜索}    另存为test
    Sleep    0.5
    #提示没有搜索到对应作品
    Element Text Should Be    ${wood_打开文件_无搜索结果}    无搜索结果

# file_saveTo_locally
#     Click Element    ${tgzy_跳过指引}
#     #创建作品名称为saveTo_locally
#     Input Text    ${wood_作品名称}    saveTo_locally
#     Mouse over    ${wood_文件}
#     Click Element    ${wood_文件_保存到本地}
#     Sleep    1
#     Win Wait    另存为    \    2
#     Win Exists    另存为
#     Win Active    另存为
#     log    ${py_file_dir_Newfile}
#     Sleep    0.5
#     Control Set Text    另存为    \    1101    ${py_file_dir_Newfile}
#     Sleep    0.5
#     Control Click    另存为    \    1
#     Sleep    0.5
#     # Control Click    编程猫代码编辑器 - Google Chrome    \    1
#     # Sleep   0.5
#     # ${wood_zpm}    Control Get Text    \    1101
#     # log    ${wood_zpm}
#     # ${wood_zpm_pre}    add    saveTo_locally    .py
#     # Element Should Be Equal As Strings    ${wood_zpm}    ${wood_zpm_pre}

file_open_py01
    #未登录状态下打开本地文件
    Click Element    ${tgzy_跳过指引}
    #保证在代码模式下打开作品，不会弹出保存弹窗提示
    Click Element    ${wood_代码模式}
    Sleep    0.5
    #验证打开文件hover正常显示
    Mouse over    ${wood_文件}
    Element Should Be Visible    ${wood_文件_从本地打开}    从本地打开
    #用特写的方法查找指定文件夹中的.Py文件，将文件名字放进一个列表
    @{test_py_name}    Find Py    ${py_file_dir}
    #计算列表长度
    ${length}    Evaluate    len(@{test_py_name})
    :FOR    ${i}    IN RANGE    ${length}
    \    Mouse over    ${wood_文件}
    \    Click Element    ${wood_文件_从本地打开}
    \    Sleep    1
    \    Win Wait    打开    \    2
    \    Win Exists    打开
    \    Win Active    打开
    \    log    ${py_file_dir}
    \    Sleep    0.5
    \    Control Set Text    打开    \    1148    ${py_file_dir}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    \    Sleep    0.5
    \    Control Set Text    打开    \    1148    ${test_py_name[${i}]}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    \    Wait Until Element Is Visible    ${wood_运行}
    \    Click Element    ${wood_运行}
    \    Element Should Be Visible    ${wood_停止}
    \    Sleep    0.2
    \    ${test_zpm}    Get Value     ${wood_作品名称}
    \    Should Contain    ${test_zpm}    pytest
    \    Click Element    ${wood_停止}
    \    Sleep    1


file_open_py02
    Click Element    ${tgzy_跳过指引}
    #未登录下更改作品名称
    Input Text    ${wood_作品名称}    open_file
    Sleep    0.5
    Mouse Over    ${wood_未登录}
    #登录
    login
    #验证打开文件hover正常显示
    Mouse over    ${wood_文件}
    Element Should Be Visible    ${wood_文件_从本地打开}    从本地打开
    #验证未保存作品情况下，点击打开本地作品弹出保存弹窗
    Click Element    ${wood_文件_从本地打开}
    Sleep    0.5
    Element Should Contain    ${wood_保存提示}    当前作品还没有保存哦
    Element Should Contain    ${wood_保存提示}    是否要继续
    Sleep    0.5
    Click Element    ${wood_保存提示_取消}
    Sleep    0.2
    ${wood_zpm01}    Get Value    ${wood_作品名称}
    Should Be Equal As Strings    ${wood_zpm01}    open_file
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_从本地打开}
    Sleep    0.2
    Click Element    ${wood_保存提示_确定}
    Win Wait    打开    \    2
    Win Exists    打开
    Win Active    打开
    log    ${py_file_dir_Newfile}
    Sleep    0.5
    Control Set Text    打开    \    1148    ${py_file_dir_Newfile}
    Sleep    0.5
    Control Click    打开    \    1
    Sleep    0.5
    Control Set Text    打开    \    1148    新的作品-204.py
    Sleep    0.5
    Control Click    打开    \    1
    Sleep    0.5
    ${wood_zpm02}    Get Value    ${wood_作品名称}
    Should Be Equal As Strings    ${wood_zpm02}    新的作品-204



file_save
    Click Element    ${tgzy_跳过指引}
    #获取默认作品名称
    ${wood_pyname}    Get Element Attribute    ${wood_作品名称}    value
    ###未登录状态###
    #验证未登录状态下点击【保存】弹出登录框
    Click Element    ${wood_保存文件按钮}
    Sleep    0.5
    #检查登录框是否存在
    Element Should Contain    //span[text()='登录']    登录
    Click Element    ${wood_01close}
    login
    ###登录状态###
    #保存默认作品
    Click Element    ${wood_保存文件按钮}    #点击【保存文件】按钮
    Sleep    1
    #检查保存成功的作品名称格式
    ${test_savename}    Get Element Attribute    ${wood_作品名称}    value
    @{test_newname}=    Split String    ${test_savename}    -
    Should Contain    ${test_newname[0]}    ${wood_pyname}
    #打开上述保存操作的作品
    Mouse over    ${wood_文件}
    Click Element    ${wood_文件_打开}
    Sleep    1
    ${test_workname1}    Get Text    ${wood_打开文件_框框2作品名称}
    Click Element    ${wood_打开文件_框框2}
    ${test_workname2}    Get Element Attribute    ${wood_作品名称}    value
    Should Contain    ${test_workname1}    ${test_workname2}
    #删除测试新增的1个作品
    Mouse Over    ${wood_登录入口}
    Click Element    ${wood_我的作品}
    Sleep    3
    Select Window    title=编程猫-海龟编辑器
    Mouse Over    ${python_我的作品_框框1}
    Click Element    ${python_我的作品_框框1_删除}
    Element Should Contain    ${python_我的作品_删除弹窗}    确定删除该作品吗？
    Click Element    ${python_我的作品_删除弹窗_删除}

i18n
    Click Element    ${tgzy_跳过指引}
    #使用自定义关键字，去匹配设定选择的语言参数
    Switch Language    zh-hant
    Sleep    0.5
    #挑选几个区域代表文案做断言
    # Should Be Equal As Strings    ${wood_文件_打開}    打開
    Mouse Over    ${wood_文件}
    Element Text Should Be    ${wood_文件_打開}    打開
    Element Should Contain    ${wood_代碼模式}    代碼模式
    Sleep    0.2
    Mouse Over    ${wood_登录入口}
    Element Should Be Visible    ${wood_未登錄}
    Mouse Over    ${wood_運行}
    Element Text Should Be    ${wood_運行}    運行
    Element Should Contain    ${wood_海龜圖}    海龜圖
    Mouse Over    ${wood_變量}
    Sleep    0.2
    Element Text Should Be    ${wood_變量}    變量
    log    繁体中文OK！
    Sleep    0.5
    Mouse Over    ${wood_切换语言}
    Switch Language    en
    Sleep    0.2
    Mouse Over    ${wood_文件}
    #这里就看出来xpath不同写法的区别，通用写法与独特写法
    Element Text Should Be    ${wood_文件_Open}    Open
    Element Should Contain    ${wood_Code}    Code
    Sleep    0.2
    Mouse Over    ${wood_登录入口}
    Element Should Be Visible    ${wood_Not login}
    Mouse Over    ${wood_Run}
    Element Text Should Be    ${wood_Run}    Run
    Element Should Contain    ${wood_海龜圖}    Turtle graphics
    Mouse Over    ${wood_Variables}
    Sleep    0.2
    Element Text Should Be    ${wood_Variables}    Variables
    log    English OK！
    Mouse Over    ${wood_切换语言}

help
    Click Element    ${tgzy_跳过指引}
    #将当前网址设为变量保存
    ${Current_URL}    Set Variable    Get Location
    #验证帮助图标hover正常
    Mouse over    ${wood_图码源鉴}
    #验证点击帮助按钮跳转到wood编辑器介绍页面
    Click Element    ${wood_图码源鉴}
    #点击帮助，进入到帮助页面
    Sleep    3
    Select Window    title=Introduction · GitBook
    Run Keyword If    '${Current_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Be    ${help_URL_test}
    ...    ELSE IF    '${Current_URL}' == 'https://wood.codemao.cn/'    Location Should Be    ${help_URL}
    ...    ELSE IF    '${Current_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Browser    ${help_URL_staging}
    ${wood_introduce}    Get Text    //*[@id="1-认识wood编辑器"]
    should Contain    ${wood_introduce}    1. 认识Wood编辑器
    #关闭帮助窗口
    Close Window
    Sleep    2
    #验证正常回到代码编辑器
    Select Window    title=编程猫代码编辑器
    Title Should Be    编程猫代码编辑器
    Sleep    1
    log    图码源鉴OK

login_fail
    Click Element    ${tgzy_跳过指引}
    #验证登录功能正常
    Click Element    ${wood_登录入口}
    #验证登录框显示正常
    Input Text    ${wood_01用户名}    ${wood_username}
    Input Text    ${wood_01密码}    ${wood_password}
    Click Element    ${wood_01登录按钮}
    #验证hover用户昵称显示选项
    Mouse Over    ${wood_登录入口}
    ${test_wdzp}    Get Text    ${wood_我的作品}
    Should Contain    ${test_wdzp}    我的作品
    ${test_tcdl}    Get Text    ${wood_退出登录}
    Should Contain    ${test_tcdl}    退出登录
    Element Should Contain    ${wood_登录入口}    ${test_nickname}
    #验证退出登录功能正常
    Click Element    ${wood_退出登录}
    Element Should Contain    ${wood_登录入口}    未登录
    #验证登录框可直接关闭1
    Click Element    ${wood_登录入口}
    Click Element    ${wood_01close}
    ${test_wdl}    Get text    ${wood_登录入口}
    Should contain    ${test_wdl}    未登录
    #验证登录框可直接关闭2
    Click Element    ${wood_登录入口}
    Input Text    ${wood_01用户名}    不合法
    Input Text    ${wood_01密码}    不合法
    Click Element    ${wood_01close}
    ${test_wdl}    Get text    ${wood_登录入口}
    Should contain    ${test_wdl}    未登录
    #验证用户名密码非空校验
    Click Element    ${wood_登录入口}
    Click Element    ${wood_01登录按钮}
    ${test_yhmNull}    Get Text    ${wood_01用户名报错文本}
    Should Contain    ${test_yhmNull}    用户名不能为空
    Input Text    ${wood_01密码}    ${wood_password}
    Click Element    ${wood_01登录按钮}
    ${test_yhmNull}    Get Text    ${wood_01用户名报错文本}
    Should Contain    ${test_yhmNull}    用户名不能为空
    Click Element    ${wood_01close}
    #验证密码非空校验
    Click Element    ${wood_登录入口}
    Input Text    ${wood_01用户名}    ${wood_username}
    Click Element    ${wood_01登录按钮}
    ${test_mmNull}    Get Text    ${wood_01密码报错文本}
    Should Contain    ${test_mmNull}    密码不能为空
    Click Element    ${wood_01close}
    #验证匹配校验
    Click Element    ${wood_登录入口}
    Input Text    ${wood_01用户名}    ${wood_username}
    Input Text    ${wood_01密码}    ${wood_username}
    Click Element    ${wood_01登录按钮}
    Set Browser Implicit Wait    3
    Element Should Contain    ${wood_01报错文本}    用户名或密码不正确

login_success
    Click Element    ${tgzy_跳过指引}
    Click Element    ${wood_未登录}
    Sleep    0.2
    input text    ${wood_01用户名}    ${wood_username}
    input text    ${wood_01密码}    ${wood_password}
    Click Element    ${wood_01登录按钮}
    Wait Until Page Contains Element    ${wood_退出登录}
    Wait Until Page Contains Element    ${wood_我的作品}

loginout
    Click Element    ${tgzy_跳过指引}
    login
    ${Current_URL}    Set Variable    Get Location
    #验证登录成功
    Mouse over     ${wood_登录入口}
    Element Should Contain    ${wood_我的作品}    我的作品
    Element Should Contain    ${wood_退出登录}    退出登录
    #验证点击我的作品按钮功能正常
    Click Element    ${wood_我的作品}
    Sleep    2
    Select Window    编程猫-海龟编辑器
    Run Keyword If    '${Current_URL}' == 'https://dev-wood.codemao.cn/'    Location Should Be    ${myfile_URL_test}
    ...    ELSE IF    '${Current_URL}' == 'https://wood.codemao.cn/'    Location Should Be    ${myfile_URL}
    ...    ELSE IF    '${Current_URL}' == 'https://staging-wood.codemao.cn/'    Location Should Browser    ${myfile_URL_staging}
    Element Text Should Be    //a[text()='我的作品']    我的作品    我的作品
    #关闭官网我的作品
    Close Window
    Sleep    0.5
    #验证正常回到代码编辑器
    Select Window    title=编程猫代码编辑器
    Title Should Be    编程猫代码编辑器
    #点击退出登录按钮
    Mouse over     ${wood_登录入口}
    Click Element    ${wood_退出登录}
    Sleep    0.5
    #验证是否已经成功退出登录
    Element Should Be Visible    ${wood_未登录}
    Element Should Contain    ${wood_未登录}    未登录
    Select Window    title=编程猫代码编辑器

third_part
    Click Element    ${tgzy_跳过指引}
    Click Element    ${wood_登录入口}
    Sleep    0.5
    #验证登录页面含有第三方登录接口
    Element Should Contain    ${wood_第三方登录}    第三方登录
    #验证通过QQ登录
    Click Element    ${wood_QQ登录}
    Sleep    0.5
    #跳转到QQ登录界面正常
    Select Window    NEW
    Title Should Be    QQ帐号安全登录
    Close Window
    Select Window    编程猫代码编辑器
    Click Element    ${wood_登录入口}
    Sleep    0.3
    Click Element    ${wood_微信登录}
    #跳转到微信登录界面正常
    Select Window    NEW
    Title Should Be    微信登录
    Close Window
    Select Window    编程猫代码编辑器
    Click Element    ${wood_登录入口}
    Sleep    0.3
    #验证通过QQ登录
    Click Element    ${wood_QQ登录}
    Sleep    0.5
    #跳转到QQ登录界面正常
    Select Window    title=QQ帐号安全登录
    Title Should Be    QQ帐号安全登录
    Select Frame    ${wood_QQiframe}
    Mouse Over    ${wood_QQ账号登录}
    Click Element    ${wood_QQ账号登录}
    Sleep    0.2
    Input Text    ${wood_QQ账号框}    ${wood_qqusername}
    Input Text    ${wood_QQ密码框}    ${wood_qqpassword}
    Click Element    ${wood_QQ登录按钮}
    Sleep    1
    Select Window    title=编程猫代码编辑器
    Mouse Over    ${wood_登录入口}
    Element Should Contain    ${wood_退出登录}    退出登录




