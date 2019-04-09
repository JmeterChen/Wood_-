*** Variables ***

#测试地址
# ${wood_hex_URL}     https://dev-wood.codemao.cn/?editor_mode=1
# ${wood_hex_URL}     https://test-wood.codemao.cn/?editor_mode=1
${wood_hex_URL}     https://staging-wood.codemao.cn/?editor_mode=1
# ${wood_hex_URL}     https://wood.codemao.cn/?editor_mode=1

# ${shouye_URL}    https://dev-python.codemao.cn/
# ${shouye_URL}    https://test-python.codemao.cn/
${shouye_URL}    https://staging-python.codemao.cn/
# ${shouye_URL}    https://python.codemao.cn/

${help_URL_dev}             https://dev-wood.codemao.cn/docs/wood/
${help_URL_test}            https://test-wood.codemao.cn/docs/wood/
${help_URL_staging}         https://staging-wood.codemao.cn/docs/wood/
${help_URL}                 https://wood.codemao.cn/docs/wood/

${myfile_URL_dev}            https://dev-python.codemao.cn/work
${myfile_URL_test}           https://test-python.codemao.cn/work
${myfile_URL}                https://python.codemao.cn/work
${myfile_URL_staging}        https://staging-python.codemao.cn/work

#浏览器
${test_browser}    chrome
${test_browserdriver}    chromedriver

#数据管理
${wood_username1}    18123874372
${wood_username2}    18682236985
${wood_password}     123456

# ${wood_username2}    18339956220
# ${wood_password}     qwe123
#资源管理
${hex_normal1}                    ${CURDIR}\\AutomationFiles\\normal01.hex
${hex_normal2}                    ${CURDIR}\\AutomationFiles\\normal02.hex
${hex_untrans}                    ${CURDIR}\\AutomationFiles\\decorator.hex
${py_normal3}                     ${CURDIR}\\AutomationFiles\\normal03.py
${py_untrans}                     ${CURDIR}\\AutomationFiles\\decorator.py
${hex_auto_change}                ${CURDIR}\\AutomationFiles\\Auto_change.hex
${hex_auto_change2}                ${CURDIR}\\AutomationFiles\\Auto_change2.hex

${Microbit}                       xpath=//*[@id="tb_10"]/div[1]/span[2]
${hex_基本}                       xpath=//*[@id="tb_11"]/div/span[2]
${login_入口}                     xpath=//header/div[2]/div[3]
${wood_未登录}                    ${login_入口}/div[2]div
${wood_首页按钮}                   css=.style__icon__A7fu1.style__icon-home__3yTuw
${wood_文件}                      xpath=//*[@id="root"]//div[@style='padding-right: 0px;']
${wood_文件_choices}              xpath=//header/div[1]/div[2]/div[3]/div/div
${wood_切换语言}                  xpath=//*[@id="translate_button"]/div
${wood_登录页面01}                css=.asset-style__dialog-wrap__T7J3c
${wood_01close}                  css=.asset-style__icon__1TAph.asset-style__icon-close__1ErxI
${wood_01用户名}                  xpath=//input[@placeholder='用户名']
${wood_01密码}                    xpath=//input[@placeholder='密码']
${wood_01登录按钮}                css=div[class*='asset-style__base_button__2gZAA asset-style__orang']
${wood_打开文件页面}               css=div[class^='style__dialog-wrap__']
${cloud_title}                   css=.style__title__Zu2yi
${cloud_search_text}             css=span[class^='style__input-client__2dfqF']>input
${cloud_close}                   css=span[class*='style__icon-client-close']
${cloud_frame}                   xpath=//div[starts-with(@class,'style__file_client_item__')]
${login_我的作品}                 ${login_入口}/div[3]/div/div[1]
${login_退出登录}                 ${login_入口}/div[3]/div/div[2]
${wood_input_file_name}          css=input[class^='style__project_name__input__']
${wood_模式切换按钮}               css=div[class^='style__switch-client-btn__']
${wood_untrans_toast}            css=div[class='midi-panel_RL1Pk']+div
${tgzy_跳过指引}                  css=div[class^='style__user-guide-cat-exit__']
${cloud_search_noresult}         css=span[class^='style__no_result__']
${save_toast}                    css=div[class^='style__dialog-wrap__']
${save_toast_close}              css=span[class^='style__close_btn__']
${save_toast_text}               css=div[class='style__content__1D9A_']
${save_toast_cancle}             css=div[class^='style__cancel__']
${save_toast_sure}               css=div[class^='style__confirm__']
${save_succeed_hint}             css=div[class*=' style__container-in-blockly__']
${python_frame1}                 css=div[class='vh-center project-wrapper_uv7Es']>div:first-child
${python_delete}                 xpath=//span[text()='删除']
${wood_save_button}              xpath=//header/div[1]/div[3]
${wood_save_success}             css=.style__container__1xk6B

${wood_Microbit}                 xpath=//header/div[1]/div[4]
${wood_Microbit_hover}           ${wood_Microbit}/div[3]
${Microbit_hover_text1}          css=div[class^='hardware_name_']>div+div
${Microbit_hover_text2}          css=div[class^='link_btn_']
${Microbit_hover_text3}          css=div[class^='hardware_expand_item_']
${Microbit_hover_text4}          xpath=//div[contains(@class,'download_')]//parent::div

${Microbit_connect}             css=div[class^='style__dialog-wrap__']
${Microbit_down_hover}          css=div[class^='download_usb_2EXxs']
${Microbit_close}               css=img[class^='close_btn_znfsf']
${Microbit_ELF}                 css=div[class^='select_expand_dialog_3DyUi']
${Microbit_ELF_close}           css=div[class^='close_btn_']
${Microbit_ELF_add}             css=div[class^='add_btn_']
${Microbit_ELF_toast}           css=.style__container__1xk6B



*** Keywords ***
open_bs
    #关键字管理
    Open browser    ${wood_hex_URL}    ${test_browser}
    Maximize Browser Window
    Set Selenium Speed    .2 seconds
    Set Browser Implicit Wait    10 seconds
    #确定是未登录
    Element Should Contain    ${login_入口}    未登录
    Sleep    1

Switch Language
    [Arguments]    ${wood_language}
    Click Element    ${wood_切换语言}
    # 切换中文
    Run Keyword If    "${wood_language}" == "zh"    Click Element    ${wood_切换语言}/div[3]/div/div[1]
    ...    ELSE IF    "${wood_language}" == "zh-hant"    Click Element    ${wood_切换语言}/div[3]/div/div[2]
    ...    ELSE IF    "${wood_language}" == "en"    Click Element    ${wood_切换语言}/div[3]/div/div[3]    # 切换中文繁体    # 切换英文

Mouse File Button
    [Arguments]    ${file_choices}    ${xpaht_of_choices}
    Mouse Over    ${wood_文件}
    ${len_choice_list}    Get Length    ${file_choices}
    : FOR    ${i}    IN RANGE    ${len_choice_list}
    \    Mouse Over    ${xpaht_of_choices}[${i+1}]
    \    Element Text Should Be    ${xpaht_of_choices}[${i+1}]    @{file_choices}[${i}]

assert_login_exist
    Element Should Be Visible    ${wood_登录页面01}
    Click Element    ${wood_01close}


Login
    [Arguments]     ${username}    ${password}
    Click Element    ${login_入口}
    input text    ${wood_01用户名}    ${username}
    input text    ${wood_01密码}    ${password}
    Click Element    ${wood_01登录按钮}
    Mouse Over    ${login_入口}
    Element Should Be Visible    ${login_我的作品}    我的作品

Logout
    P




Teardown
    Close All Browsers