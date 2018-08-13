*** Variables ***
#测试地址
${wood_URL}                https://wood.codemao.cn/
# ${wood_URL}              https://dev-wood.codemao.cn/
# ${wood_URL}              https://staging-wood.codemao.cn/

${shouye_URL}              https://python.codemao.cn/
# ${shouye_URL}              https://dev-python.codemao.cn/
# ${shouye_URL}              https://staging-python.codemao.cn/

${help_URL_test}           https://dev-wood.codemao.cn/docs/wood/
${help_URL}                https://wood.codemao.cn/docs/wood/
${help_URL_staging}        https://staging-wood.codemao.cn/docs/wood/

${myfile_URL_test}         https://dev-python.codemao.cn/work
${myfile_URL}              https://python.codemao.cn/work
${myfile_URL_staging}      https://staging-python.codemao.cn/work
#浏览器
${test_browser}            chrome
${test_browserdriver}      chromedriver

#数据管理
${wood_username}           18682236985
${wood_password}           123456
${test_py_dir}             ${CURDIR}\\Wood_Study
${py_file_dir}             ${CURDIR}\\Wood_PyFile
${py_file_dir_Newfile}          ${CURDIR}\\Wood_PyFile\\New_file
${wood_短作品名}         test1
${wood_长作品名}         13斐波那契数列_pytest
${wood_作品任意测试}       12天天向上_pytest


#界面元素
${tgzy_跳过指引}                  xpath=//*[@id="root"]/div/div[3]/div[2]/div[5]
${shijian_事件}                   xpath=//*[@id="tb_1"]/div
${zhiyin_指引001}                 xpath=//*[@id="root"]/div/div[3]/div[2]
${zhiyin_任意处}                  xpath=//*[@id="root"]/div/div[3]/div[2]/div[4]
${zhiyin_箭头}                    xpath=//*[@id="root"]/div/div[3]/div[2]/div[1]
${zhiyin_指引002}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引003}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引004}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引005}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引006}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引007}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${wood_首页按钮}                  css=.style__icon__A7fu1.style__icon-home__3yTuw
${bjym_编辑页面}                  xpath=//*[@id="SNAPE"]/div[2]/div
${wood_import}                     xpath=//*[@id="SNAPE"]/div[2]/div/div[3]/div[1]/span[1]



${wood_文件}                                      xpath=//*[@id="root"]//div[@style='padding-right: 0px;']
${wood_文件_打开}                              xpath=//div[text()='打开']
${wood_登录页面01}                             css=.asset-style__dialog-wrap__T7J3c
${wood_01close}                                xpath=//*[@id="root"]//span[@class='asset-style__icon__1TAph asset-style__icon-close__1ErxI']
${wood_01用户名}                               xpath=//*[@id="root"]//input[@placeholder='用户名' ]
${wood_01密码}                                 xpath=//*[@id="root"]//input[@placeholder='密码' ]

${wood_01登录按钮}                             css=.asset-style__button__2KCHg.asset-style__base_button__2gZAA.asset-style__orange__1XF9N
${wood_01登录按钮}                             xpath=//*[@id="root"]//div[@class='style__login_content__AW2Jo']/span[3]/div
${wood_01登录按钮}                             xpath=//span[text()='登录']//parent::div

${wood_打开文件}                                xpath=//span[text()='打开文件']
${wood_打开文件_close}                      xpath=//span[text()='打开文件']//preceding-sibling::span
${wood_打开文件_搜索}                           xpath=//input[@placeholder='关键词搜索作品']
${wood_不存在作品名}                          @#￥#￥￥#%#￥……
${wood_打开文件_无搜索结果}                    xpath=//span[text()='无搜索结果']
${wood_作品名称短}                             xpath=//span[text()='test1']
${wood_打开文件_框框1}                          xpath=//span[text()='从本地打开']//parent::div
${wood_打开文件_作品1名称}                   xpath=//div[4]/div[1]/div/div[2]/div[1]/div/span[1]
${wood_打开文件_作品大框}                       xpath=//*[@id="root"]//div[@class='style__client-container__30oDd']
${wood_打开文件_从本地打开}                     xpath=//span[text()='从本地打开']

${wood_打开文件_框框2}                                           xpath=//div[4]/div[1]/div/div[2]/div[2]/span[1]
${wood_打开文件_框框2作品名称}                             xpath=//div[4]/div[1]/div/div[2]/div[2]/div/span[1]
${wood_打开文件_框框3}                                          xpath=//div[4]/div[1]/div/div[2]/div[3]/span[1]
${wood_打开文件_框框3作品名称}                            xpath=//div[4]/div[1]/div/div[2]/div[3]/div/span[1]
${wood_代码模式}                                                    xpath=//div[text()='代码模式']
${wood_积木模式}                                                    xpath=//div[text()='积木模式']
${wood_保存按钮}                                                   xpath=//div[text()='保存']


${wood_文件_新建}                               xpath=//div[text()='新建']
${wood_作品名称}                                css=.style__project_name__2ADmE>input
${wood_保存提示}                    xpath=//div[4]/div/div/div/div[1]/div
${wood_保存提示_取消}               css=.style__cancel__3EADI
${wood_保存提示_确定}               css=.style__confirm__ep4ll
${wood_保存提示_close}             css=.style__close_btn__1mONV


${wood_文件_另存为}                        xpath=//div[text()='另存为']
${wood_我的作品}                             xpath=//div[text()='我的作品']
${python_我的作品_框框4}                  xpath=//div/div[2]/div[2]/div[4]
${python_我的作品_框框4_删除}          xpath=//div/div[2]/div[2]/div[4]/div[2]
${python_我的作品_框框3}                  xpath=//div/div[2]/div[2]/div[3]
${python_我的作品_框框3_删除}          xpath=//div/div[2]/div[2]/div[3]/div[2]
${python_我的作品_框框2}                  xpath=//div/div[2]/div[2]/div[2]
${python_我的作品_框框2_删除}          xpath=//div/div[2]/div[2]/div[2]/div[2]
${python_我的作品_框框1}                  xpath=//div/div[2]/div[2]/div[1]
${python_我的作品_框框1_删除}          xpath=//div/div[2]/div[2]/div[1]/div[2]
${python_我的作品_删除弹窗}                css=.msg_WgAbp
${python_我的作品_删除弹窗_删除}        css=.delete_3uLkB
${python_我的作品_删除弹窗_取消}        css=.cancel_1GVnU

${wood_文件_从本地打开}                         xpath=//div[text()='从本地打开']

${wood_保存文件按钮}                            xpath=//div[text()='保存']

${wood_01注册按钮}                             css=.asset-style__button__2KCHg.asset-style__base_button__2gZAA.asset-style__white__gz-t7
${wood_01注册按钮}                             xpath=//*[@id="root"]//div[@class='style__login_content__AW2Jo']/span[5]/div
${wood_01注册按钮}                             xpath=//span[text()='注册']//parent::div

${wood_文件_新建}                               xpath=//div[text()='新建']
${wood_文件_另存为}                             xpath=//div[text()='另存为']
${wood_运行}                      xpath=//div[text()='运行']



${wood_切换语言}                          xpath=//*[@id="translate_button"]/div
#繁体/英文
${wood_文件_打開}                              xpath=//header/div[1]/div[2]/div[3]/div/div[1]
${wood_文件_Open}                            xpath=//div[text()='Open']
${wood_代碼模式}                               css=.style__switch-client-btn__2M4Je
${wood_Code}                                     css=.style__switch-client-btn__2M4Je
${wood_未登錄}                                   xpath=//div[text()='未登錄']
${wood_運行}                                      xpath=//div[text()='運行']
${wood_Run}                                       xpath=//div[text()='Run']
${wood_海龜圖}                                   xpath=//*[@id="snape-compiler-wrapper"]/div[2]/span
${wood_變量}                                       xpath=//*[@id="tb_23"]/div
${wood_Variables}                                 xpath=//*[@id="tb_41"]/div
${wood_作品名称默认}                            css=.style__project_name__2ADmE>input
${wood_作品名称_科比}                            科比
${wood_积木模式}                                css=.style__switch-client-btn__2M4Je
${wood_代码模式}                                xpath=//div[@class='style__switch-client-btn__2M4Je']
${wood_i18n}                                    css=.style__icon__A7fu1.style__icon-translate__3xYgf
${wood_语言_简体中文}                           xpath=//div[text()='简体中文']
${wood_语言_繁体中文}                           xpath=//div[text()='繁體中文']
${wood_语言_English}                            xpath=//div[text()='English']
${wood_帮助}                                    xpath=//div[text()='帮助']//preceding-sibling::div

${wood_登录入口}                 xpath=//header/div[2]/div[3]
${wood_未登录}                    xpath=//div[text()='未登录']
${wood_Not login}                xapth=//div[text()='Not login']
${wood_我的作品}                  xpath=//div[text()='我的作品']
${wood_退出登录}                  xpath=//div[text()='退出登录']

${wood_图码源鉴}                 css=.style__icon__A7fu1.style__icon-help__39_l0


${wood_01用户名报错文本}                    xpath=//span[text()='用户名不能为空']
${wood_01密码报错文本}                       xpath=//span[text()='密码不能为空']
${wood_01报错文本}                             xpath=//span[text()='用户名或密码不正确']

${wood_01登录}                                 xpath=//span[text()='登录']
${wood_第三方登录}                             xpath=//span[text()='第三方登录']
${wood_QQ登录}                                 xpath=//span[text()='第三方登录']//following-sibling::span[1]
${wood_微信登录}                                xpath=//span[text()='第三方登录']//following-sibling::span[2]
${test_nickname}                               陈柏霖


${wood_太阳}                                    css=.image-button.style__theme-button__2EKZ8
${wood_白天}                                    xpath=//span[text()='白天']
${wood_月亮}                                    css=.image-button.style__theme-button__2EKZ8.style__theme-button-night__2Z-W0
${wood_夜间}                                    xpath=//span[text()='夜间']

${wood_事件积木盒}                              xpath=#tb_1
${wood_控制积木盒}                              xpath=#tb_2
${wood_运算积木盒}                              xpath=#tb_3
${wood_字符串积木盒}                            xpath=#tb_4
${wood_变量积木盒}                              xpath=#tb_5
${wood_列表积木盒}                              xpath=#tb_6
${wood_字典积木盒}                              xpath=#tb_7
${wood_函数积木盒}                              xpath=#tb_8
${wood_海龟库积木盒}                            xpath=#tb_9

${wood_收起按钮}                                css=.style__toggle-off-button__3CgWc
${wood_收起}                                    xpath=//span[text()='收起']
${wood_展开按钮}                                xpath=//*[@id="sidebar"]/div

${wood_全屏按钮}                  xpath=//span[text()='海龟图']/following::div
${wood_全屏}                         xpath=//span[text()='全屏']
${wood_退出全屏按钮}              xpath=//*[@id="wood_compiler"]/div[1]/div[3]
${wood_退出全屏}                  xpath=//span[text()='退出全屏']

${wood_Run_area}                  xpath=//*[@id="wood_console"]/pre
${wood_welcome}                   css=.style__console-output__2yqfl
${wood_停止}                      xpath=//*[@id="wood_console"]/div/div[2]
${wood_清除}                      xpath=//*[@id="wood_console"]/div/div[3]/div



${电站图标}                       xpath=//div[@class='echarts-title page-title-span']/span[@class='page-header-chart']


*** Keywords ***
#关键字管理
open_bs
    Open browser    ${wood_URL}    ${test_browser}
    Maximize Browser Window
    Set Selenium Speed    .6 seconds
    Set Browser Implicit Wait    10 seconds
    Sleep    3

open_signin
    Click Element    ${wood_未登录}
    Click Element    ${wood_01注册}

assert_login_exist
    Element Should Be Visible    ${wood_登录页面01}
    Click Element    ${wood_01close}

new_built
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_新建}

Switch Language
    [Arguments]    ${wood_language}
    Click Element    ${wood_切换语言}
    # 切换中文
    Run Keyword If    "${wood_language}" == "zh"    Click Element    ${wood_切换语言}/div[3]/div/div[1]
    # 切换中文繁体
    ...    ELSE IF    "${wood_language}" == "zh-hant"    Click Element    ${wood_切换语言}/div[3]/div/div[2]
    # 切换英文
    ...    ELSE IF    "${wood_language}" == "en"    Click Element    ${wood_切换语言}/div[3]/div/div[3]

open_testpy
    Mouse Over    ${wood_文件}
    Click Element    ${wood_文件_打开本地作品}
    Win Wait    打开    \    2
    Win Exists    打开
    log    ${test_py_dir}
    Sleep    1
    Control Set Text    打开    \    1148    ${test_py_dir}
    Sleep    1
    Control Click    打开    \    1
    Sleep    1
    Control Set Text    打开    \    1148    pytest24.py
    Sleep    1
    Control Click    打开    \    1

login
    Click Element    ${wood_未登录}
    input text    ${wood_01用户名}    ${wood_username}
    input text    ${wood_01密码}    ${wood_password}
    Click Element    ${wood_01登录按钮}
    Wait Until Page Contains Element    ${wood_退出登录}

logout
    Mouse Over    ${wood_登录入口}
    Click Element    ${wood_退出登录}
    Sleep    0.5
    Wait Until Page Contains Element    ${wood_未登录}


Teardown
    Close All Browsers
    # Close Process    ${test_browserdriver}    #谷歌