*** Variables ***
#测试地址
${wood_URL}                https://wood.maocode.cn/
# ${wood_URL}              https://dev-wood.maocode.cn/
# ${wood_URL}              https://staging-wood.maocode.cn/

${shouye_URL}              https://python.maocode.cn/
# ${shouye_URL}              https://dev-python.maocode.cn/
# ${shouye_URL}              https://staging-python.maocode.cn/

${help_URL_test}           https://dev-wood.maocode.cn/docs/wood/
${help_URL}                https://wood.maocode.cn/docs/wood/
${help_URL_staging}        https://staging-wood.maocode.cn/docs/wood/

${myfile_URL_test}         https://dev-python.maocode.cn/work
${myfile_URL}              https://python.maocode.cn/work
${myfile_URL_staging}      https://staging-python.maocode.cn/work
#浏览器
${test_browser}            chrome
${test_browserdriver}      chromedriver

#数据管理
${wood_username}           18682236985
${wood_password}           123456
${test_py_dir}             ${CURDIR}\\Wood_Study
${py_file_dir}             ${CURDIR}\\Wood_PyFile
${wood_作品名称短}         test1
${wood_作品名称长}         13斐波那契数列_pytest
${wood_作品任意测试}       12天天向上_pytest

#界面元素//*[@id="root"]/div/div[2]/div[2]/div[3]/span[3]/div/span
# ${wood_首页按钮}                                css=.asset-style__button__3aBB2
${wood_首页按钮}                               xpath=//div[@class='asset-style__header_content__1TaGn']/div[@class='asset-style__button__3aBB2']
${wood_首页}                                   xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[1]/div[2]
${wood_官网_用户名}
${wood_文件}                                   xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[2]
${wood_文件_打开}                              xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[3]/div[3]/div/div[1]
${wood_登录页面01}                             xpath=//*[@id="root"]/div/div[2]/div[2]
${wood_01close}                                xpath=//*[@id="root"]/div/div[2]/div[2]/div[1]/span/span
${wood_01用户名}                               xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[1]/span/input
${wood_01密码}                                 xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[2]/span/input
${wood_01登录按钮}                             xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[3]/div
${wood_01登录关闭}                             css=.style__close-btn__1ZVcB
${wood_登录成功}                               xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[2]/div[2]/div
${wood_第三方登录}                             xpath=//span[@class='style__third_part__1Bn05']/span[1]
${wood_QQ登录}                                 xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[6]/span[2]/span
${wood_微信登录}                               xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[6]/span[3]/span
${test_nickname}                               陈柏霖
${wood_01用户名报错文本}                       xpath=//*[@id="status_msg"]
${wood_01密码报错文本}                         xpath=//*[@id="status_msg"]
${wood_01报错文本}                             xpath=//*[@id="status_msg"]
${wood_01注册按钮}                             xpath=//*[@id="root"]/div/div[2]/div[2]/div[3]/span[5]/div
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
${wood_保存成功}                                xpath=//div[@class='style__snape__3SbfO']/div[@class='style__ide-flexbox__uPzMd']/div[@class='style__notice__3SNt-']
${wood_保存失败}                                css=.
${wood_保存成功icon}                            css=.style__container__3if3R>.style__content__2smh4
${wood_保存失败icon}                            css=.style__container__3if3R>.style__content__2smh4
${wood_作品名称}                                css=.asset-style__project_name__24CPT>input
${wood_作品名称默认}                            xpath=//*[@id="root"]/div/div[1]/header/div[1]/div[7]/input
${wood_作品名称_科比}                            科比
${wood_积木模式}                                xpath=//button[@class='style__switch-btn__7nbsI']
${wood_代码模式}                                xpath=//button[@class='style__switch-btn__7nbsI']
${wood_事件积木}                                xpath=//*[@id=":1.label"]
${wood_白天/夜间}                               css=.style__image-button-tip__3Q23C style__theme-button-tip__38DPH
${wood_太阳}                                    xpath=/html/body/div[@id='root']/div[@class='style__snape__3SbfO']/div[@class='style__ide-flexbox__uPzMd']/div[@class='style__editor-flexbox__14Lav']/div[@class='style__control-panel__3xNnx']/div[@class='style__button-space__X1_0M']/div[@class='style__image-button-panel__22L_i']/div[@class='style__image-button-wrapper__Xjv2o']/div[@class=' image-button style__theme-button__2EKZ8']
${wood_白天}                                    xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div/div/div/div[2]/div/span[1]
${wood_月亮}                                    xpath=/html/body/div[@id='root']/div[@class='style__snape__3SbfO style__snape-night__2eQyC']/div[@class='style__ide-flexbox__uPzMd']/div[@class='style__editor-flexbox__14Lav']/div[@class='style__control-panel__3xNnx']/div[@class='style__button-space__X1_0M']/div[@class='style__image-button-panel__22L_i']/div[@class='style__image-button-wrapper__Xjv2o']/div[@class=' image-button style__theme-button__2EKZ8 style__theme-button-night__2Z-W0']
${wood_夜间}                                    xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div/div/div/div[2]/div/span[3]

${wood_帮助}                                    xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[2]

${wood_收起按钮}                                css=.style__toggle-off-button__3CgWc
${wood_收起}                                    xpath=//*[@id="wood_console"]/div/div[1]/div/span
${wood_展开按钮}                                xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div/div/div[2]/div
${wood_展开}                                    xpath=//*[@id="root"]/div/div[2]/div[1]/div[2]/div/div/div[2]/div/div/span

${wood_语言}
${wood_i18n}                                    xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[1]
${wood_语言_简体中文}
${wood_语言_繁体中文}
${wood_语言_English}
${wood_帮助按钮}
${wood_未登录}                    xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]
${wood_登录入口}                  xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]
${wood_我的作品}                  xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]/div[3]/div/div[1]
${wood_退出登录}                  xpath=//*[@id="root"]/div/div[1]/header/div[2]/div[3]/div[3]/div/div[2]
${wood_运行}                      xpath=//*[@id="snape-compiler-wrapper"]/div[1]/div/div[2]
${wood_停止}                      xpath=//*[@id="wood_console"]/div/div[2]
${zpm_作品名}                     css=.asset-style__project_name__24CPT>input

${wood_全屏按钮}                  xpath=//*[@id="snape-compiler-wrapper"]/div[2]/div
${wood_全屏}                      xpath=//*[@id="snape-compiler-wrapper"]/div[2]/div/div/span
${wood_退出全屏按钮}              xpath=//*[@id="wood_compiler"]/div[1]/div[3]
${wood_退出全屏}                  xpath=//*[@id="wood_compiler"]/div[1]/div[4]/span

${wood_运行}                      xpath=//div[@class='style__run-button-label__J_YJ3']
${wood_Run_area}                  xpath=//*[@id="wood_console"]/pre
${wood_welcome}                   xpath=//div[@id='wood_console']/pre[@class='style__console-output__2yqfl']
${wood_停止}                      xpath=//*[@id="wood_console"]/div/div[2]
${wood_清除}                      xpath=//*[@id="wood_console"]/div/div[3]/div

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
${wood_import}                    xpath=//*[@id="SNAPE"]/div[2]/div/div[3]/div[1]/span[1]
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
    # Close Process    ${test_browserdriver}    #谷歌