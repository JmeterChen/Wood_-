*** Variables ***
#测试地址

${wood_URL}                https://wood.codemao.cn/
# ${wood_URL}              https://dev-wood.codemao.cn/
# ${wood_URL}              https://staging-wood.codemao.cn/

${shouye_URL}              https://python.codemao.cn/
# ${shouye_URL}              https://dev-python.codemao.cn/
# ${shouye_URL}              https://staging-python.codemao.cn/

${help_URL_test}
${help_URL}                https://wood.codemao.cn/docs/wood/

#浏览器
${test_browser}            chrome
${test_browserdriver}      chromedriver

#数据管理
${wood_username}           18682236985
${wood_password}           123456
${test_py_dir}             C:\\Users\\ChenBolin\\Desktop\\NewWood_RF\\wood_Study
${wood_作品名称短}         test1
${wood_作品名称长}         13斐波那契数列_pytest
${wood_作品任意测试}       12天天向上_pytest

#界面元素
# ${wood_首页按钮}                                css=.asset-style__button__3aBB2
${wood_首页按钮}                                xpath=//div[@class='asset-style__header_content__1TaGn']/div[@class='asset-style__button__3aBB2']
${wood_首页}                                    xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[1]/div[2]
${wood_官网_用户名}
${wood_文件}                                    xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[2]
${wood_文件_打开}                               xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[3]/div/div[1]
${wood_登录页面01}                              xpath=//*[@id="root"]/div/div[2]/div[2]
${wood_01close}                                 xpath=//*[@id="root"]/div/div[2]/div[2]/div[1]/span/span
${wood_01用户名}                                xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[1]/span/input
${wood_01密码}                                  xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[2]/span/input
${wood_01登录按钮}                              xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[3]/div
${wood_第三方登录}                              xpath=//span[@class='style__third_part__1Bn05']/span[1]
${wood_QQ登录}                                  xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[6]/span[2]/span
${wood_微信登录}                                xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[6]/span[3]/span
${test_nickname}                                陈柏霖
${wood_01用户名报错文本}                        xpath=//*[@id="status_msg"]
${wood_01密码报错文本}                          xpath=//*[@id="status_msg"]
${wood_01报错文本}                              xpath=//*[@id="status_msg"]
${wood_01注册按钮}                              xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[5]/div
${wood_注册页面02}
${wood_02close}
${wood_02手机号}
${wood_02密码}
${wood_02验证码}
${wood_02获取验证码按钮}
${wood_已有账号？立即登录按钮}
${wood_打开作品页面}                            xpath=//*[@id="file_dialog"]/div
${wood_打开作品_搜索}                           css=.style__input__3OALY>input
${wood_打开作品_搜索icon}                       css=.style__input__3OALY>span
${wood_打开作品_作品}                           xpath=//*[@id="file_dialog"]/div/div[2]/div[1]/span[1]
${wood_打开作品_作品1}                          xpath=//*[@id="file_dialog"]/div/div[2]/div/span[3]
${wood_打开作品_作品2}                          xpath=//span[@class='style__full_workname__I-a9W']
${wood_文件_新建}                               xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[3]/div/div[2]
${wood_文件_另存为}                             xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[3]/div/div[3]
${wood_文件_保存到本地}                         xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[3]/div/div[4]
${wood_文件_打开本地作品}                       xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[3]/div/div[5]
${wood_打开本地作品}                            xpath=//span[@class='style__add-words__32Qr3']
${wood_保存文件按钮}                            xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[5]/div[1]
${wood_保存成功icon}                            css=.style__container__3if3R>.style__content__2smh4
${wood_保存失败icon}
${wood_作品名称}                                css=.asset-style__project_name__24CPT>input
${wood_积木模式}
${wood_代码模式}
${wood_白天}
${wood_夜间}
${wood_收起}
${wood_展开}
${wood_语言}
${wood_语言_简体中文}
${wood_语言_繁体中文}
${wood_语言_English}
${wood_帮助按钮}
${wood_未登录}                    xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]
${wood_登录入口}                  xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]
${wood_我的作品}                  xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]/div[3]/div/div[1]
${wood_退出登录}                  xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]/div[3]/div/div[2]
${wood_运行}
${wood_停止}
${wood_清除}
${wood_全屏}
${wood_退出全屏}

${zhiyin_指引001}                 xpath=//*[@id="root"]/div/div[3]/div[2]
${zhiyin_任意处}                  xpath=//*[@id="root"]/div/div[3]/div[2]/div[4]
${zhiyin_箭头}                    xpath=//*[@id="root"]/div/div[3]/div[2]/div[1]
${zhiyin_指引002}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引003}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引004}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引005}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引006}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${zhiyin_指引007}                 xpath=//*[@id="root"]/div/div[3]/div[2]/div[3]
${tgzy_跳过指引}                  xpath=//*[@id="root"]/div/div[3]/div[2]/div[5]
${shijian_事件}                   xpath=//*[@id=":1.label"]
${bjym_编辑页面}                  xpath=//*[@id="SNAPE"]/div[2]/div
${整个页面}                       xpath=//*[@id="root"]/div/div[3]/div[1]

${wood_保存提示}                  xpath=//*[@id="confirm_dialog"]/div/div[1]/div[2]/div[2]
${wood_保存提示_是}               xpath=//*[@id="confirm_dialog"]/div/div[2]/div[1]
${wood_保存提示_否}               xpath=//*[@id="confirm_dialog"]/div/div[2]/div[2]

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
    Close Process    ${test_browserdriver}    #谷歌