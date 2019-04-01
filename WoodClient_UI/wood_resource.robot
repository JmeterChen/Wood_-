*** Variables ***
# Client manage
# ${wood_client_dir}               C:\\Users\\ChenBolin\\AppData\\Local\\Programs\\lizzy\\海龟编辑器.exe
# ${wood_client_dir}               C:\\Pyblock_dev\\海龟编辑器-dev.exe
${wood_client_dir}                 C:\\Pyblock_staging\\海龟编辑器-staging.exe

# data manage
# ${test_username}                 czx-autotest-01
${test_username}                 18682236985
${test_password}                 123456
${wood_qqusername}               2710614370
${wood_qqpassword}               pyf.18772939709
# ${test_nickname}                 czx-autotest-01
${py_file_normal}                ${CURDIR}\\ResourceFile\\Normalfile
${py_file_unnormal}              ${CURDIR}\\ResourceFile\\unNormalfile
${file_untrans}                  ${CURDIR}\\ResourceFile\\unTrans\\test.json
${download_file}                 ${CURDIR}\\ResourceFile\\downloadFile
${Save_to_cloud}                 ${CURDIR}\\ResourceFile\\Save_to_cloud
${file_to_update}                ${CURDIR}\\ResourceFile\\updateFile

# UI manage
${wood_guide_next_button}        css:   div[class^="vh-center style__footer"]>button[class^="style__btn"]
${wood_user_entrance}            xpath: //div[@id="header_click_area"]/div[1]
${wood_third_login}              xpath=//span[@class='style__third_part__3zAMJ']/span[1]
${wood_qq_icon}                  xpath=//span[@class='style__third_part__3zAMJ']/span[2]
${wood_wechat_icon}              xpath=//span[@class='style__third_part__3zAMJ']/span[3]
${wood_QQiframe}                 xpath=//*[@id="ptlogin_iframe"]
${wood_QQ账号登录}               css=#switcher_plogin
${wood_QQ账号框}                 xpath=//*[@id="u"]
${wood_QQ密码框}                 xpath=//*[@id="p"]
${wood_QQ登录按钮}               xpath=//*[@id="login_button"]
${wood_微信登录}                 xpath=//span[text()='第三方登录']//following-sibling::span[2]

${wood_user_name}                xpath=//*[@id="header_click_area"]/div[1]/div[2]/div
${wood_ue_nickname}              ${wood_user_entrance}//div[contains(@class, "style__title")]
${wood_login_dialog}             css:   div[class^="asset-style__dialog-wrap"]
${wood_ue_logout_button}         xpath: //div[contains(@class, "style__dropdown_content")]/div
${wood_ld_username}              css:   input[placeholder="用户名"]
${wood_ld_password}              css:   input[placeholder="密码"]
${wood_ld_login_button}          xpath: //span[text()="登录"]
${wood_ld_signup_button}         xpath: //span[text()="注册"]
${wood_ld_close}                 css:   span[class^="style__close_btn"]
${wood_ld_err_text}              css:   div[id="status_msg"]>span>span[class^="style__text"]
${wood_logout_dialog}            css:   div[class^="style__dialog-wrap"]
${wood_lod_close}                css:   span[class^="style__close_btn"]
${wood_lod_cancel}               css:   div[class^="style__cancel"]
${wood_lod_confirm}              css:   div[class^="style__confirm"]
${wood_signup_dialog}            css:   div[class^="asset-style__dialog-wrap"]
${wood_sd_phonenum}              css:   input[placeholder="手机号"]
${wood_sd_password}              css:   input[placeholder="密码"]
${wood_sd_vircode_text}          css:   input[placeholder="验证码"]
${wood_sd_get_vircode}           xpath: //span[text()="获取验证码"]
${wood_sd_signup_button}         xpath: //span[text()="注册"]
${wood_sd_err_text}              css:   div[id="status_msg"]>span>span[class^="style__text"]
${wood_file_icon}                xpath: //div[@id="header_click_area"]/div[2]
${wood_file_dropdown}            ${wood_file_icon}/div[3]
${wood_file_newbuilt}            ${wood_file_dropdown}/div[1]/div[1]
${wood_file_open}                ${wood_file_dropdown}/div[1]/div[2]
${wood_file_save}                ${wood_file_dropdown}/div[1]/div[3]
${wood_file_save_as}             ${wood_file_dropdown}/div[1]/div[4]
${wood_file_template}            ${wood_file_dropdown}/div[1]/div[5]
${wood_file_open_cloud}          ${wood_file_dropdown}/div[1]/div[6]
${wood_file_save_to_cloud}       ${wood_file_dropdown}/div[1]/div[7]
${wood_ft_dialog}                css:   div[class^="style__dialog-wrap"]
${wood_ftd_title}                xpath:    //span[text()='模板作品']
${wood_template_num}             xpath=//div[contains(@class, "style__item-wrapper")]/div
${wood_ftd_close}                css:   span[class*="style__icon-client-close"]

${wood_cloud_list_title}         xpath:    //span[text()='打开文件']
${wood_cfd_list}                 xpath:  //div[contains(@class, "style__client-container")]
${wood_cloud_file_dialog}        css:   div[class*="style__dialog-wrap"]
${wood_cloud_py_icon}            css:   .style__python__YSwEL
${wood_cloud_hex_icon}           css:   .style__hardware__1MVNo
${wood_cloud_file_frame1}         //div[contains(@class, "style__client-container")]/div
${wood_cloud_search}             xpath=//input[@placeholder='关键词搜索作品']
${wood_cloud_file_name}          ${wood_cloud_file_frame1}/div[1]/span[1]
${wood_cloud_file_date}          ${wood_cloud_file_frame1}/div[1]/span[2]
${wood_cloud_unfind}             xpath=//span[text()='无搜索结果']
${wood_cloud_file_close}         css:   span[class*='style__icon__1O_ez style__icon-client-close']

${wood_save_success}             css:    .style__container__VJrU4

${wood_setting_button}           xpath: //div[@id="header_click_area"]/div[3]
${wood_setting_button_name}      ${wood_setting_button}/div[2]/div
${wood_setting_dropdown}         ${wood_setting_button}/div[3]
${wood_setting_language}         xpath: //*[@id="header_click_area"]/div[3]/div[3]/div/div[1]
${wood_setting_language_xpath}   //div[contains(@class,'style__sub')]//div[@class='style__item__32aYM']
${wood_setting_search}           ${wood_setting_dropdown}/div/div[3]
${wood_search_pull_down}         css=.style__button__2nMMl.style__search-switch__1_n5D
${wood_search_value}             css=#search-value
${wood_replace_value}            css=#replace-value

${wood_hex_button}               xpath=//*[@id="header_click_area"]/div[4]
${wood_hex_button_name}          ${wood_hex_button}/div[2]/div
${wood_hex_dropdown}             ${wood_hex_button}/div[3]
${wood_new_hex}                  ${wood_hex_button}/div[3]
${wood_选择设备}                 css:   title_3WQkc
${wood_hex_device_connect}       xpath: //div[text()='Microbit']
${wood_hex_device_cancle}        css:    .cancel_btn_3P1AG
${wood_hex_device_confirm}       css:    .confirm_btn_2ZLKR.active_1j6cO
${wood_new_microbit}             ${wood_hex_button}//div[@class='style__item__32aYM'][2]

${wood_library_manage_button}    xpath=//*[@id="header_click_area"]/div[5]
${wood_library_frame_库管理}     css=.vh-center.style__title__3YDUV
${wood_library_xpath}            //div[@class='vh-center style__lib-item-wrap__PqO2B']
${wood_library_search}           xpath=//i[@class='style__kw-search-icon__1SE_5']//following-sibling::input
${wood_install_third_lib}        xpath=//div[@class='vh-center style__install-others__2H3gu']/span
${wood_third_noresult}           css=.style__no_result__1ADaH
${wood_library_others}           css=.vh-center.style__libs-type-name__1XXuP
${wood_library_third_search}     xpath=//i[@class='style__search-icon__spYSO']//following-sibling::input
${wood_library_others_return}    css=.vh-center.style__btn-go-back__2QKqh
${wood_library_others_close}     css=.style__close-icon__3FHHd
${wood_third_search_result}      xpath=//div[@class='style__result__3pWPo']
${wood_lib_install_button}       ${wood_third_search_result}/button
${wood_lib_install_cancle}       ${wood_third_search_result}/div[3]
${wood_third_search_icon}        css=.style__search-icon__spYSO
${wood_third_search_toast}       css=.style__notice-text__W7f9D

${wood_run_button}               xpath=//*[@id="header_click_area"]/div[7]
${wood_workspace_run_button}     css=.style__button-wrapper__1dYDp

${wood_trans_button}             css:   div[class^="style__switch-client-btn"]


${wood_tabs_num}                 //div[contains(@class,"tabs_container")]/span[@class='style__fullname_container__222jR']


${wood_tabs_container}           css:   div[class^=tabs_container]
${wood_tab_current}              ${wood_tabs_container}>span[class*="style__current"]
${wood_tab_cur_close}            ${wood_tab_current}>span[class*="style__close-icon"]
${wood_tab_cur_name}             ${wood_tab_current}>span[class^="style__text"]
${wood_toast_file}               //div[@class='style__container__VJrU4']
${wood_tab_file_name}            css:   .style__text_input__1egqJ
${wood_tab_cur_textarea}         ${wood_tab_current}>input
${wood_tab_cur_name_hover}       ${wood_tab_current}>span[class*="fullname_container"]

${wood_toolbox_list}             //div[@class="blocklyToolboxDiv"]/div[1]
${wood_toolbox_xpath}            xpath=//div[@class="blocklyToolboxDiv"]/div[1]
${wood_toolbox_events}           ${wood_toolbox_list}/div[1]
${wood_toolbox_control}          ${wood_toolbox_list}/div[2]
${wood_toolbox_operators}        ${wood_toolbox_list}/div[3]
${wood_toolbox_strings}          ${wood_toolbox_list}/div[4]
${wood_toolbox_variables}        ${wood_toolbox_list}/div[5]
${wood_toolbox_lists}            ${wood_toolbox_list}/div[6]
${wood_toolbox_dictionary}       ${wood_toolbox_list}/div[7]
${wood_toolbox_functions}        ${wood_toolbox_list}/div[8]
${wood_toolbox_turtle}           ${wood_toolbox_list}/div[9]
${wood_box_var}                  xpath: //div[@class="blocklyToolboxDiv"]/div/div[5]
${wood_box_list}                 xpath: //div[@class="blocklyToolboxDiv"]/div/div[6]
${wood_box_addvar}               css:   g.blocklyAddVariableButton
${wood_flyout_block_num}         xpath: //*[@class="blocklyBlockCanvas"]/*[@class="blocklyDraggable"]
${wood_addvar_dialog}            css:   div[class^="style__dialog-wrap"]
${wood_ad_text}                  id:    snape-variable-input
${wood_ad_cancel_button}         css:   span[class*=style__cancel-btn]
${wood_ad_confirm_button}        css:   span[class*=style__confirm-btn]
${wood_ad_close_button}          css:   span[class^=style__close_btn]

${wood_blocks_num}               //*[@class="blocklyDraggable"]
${wood_blocks_line}              xpath=//*[@class='blocklyLine']
${wood_blocks_time库}            xpath=//*[@class='blocklyUploadText']
${wood_blocks_XX库}              //*[@class='blocklyUploadText']
${wood_lines}                    //*[@class='blocklyLine']
${wood_blocks_creat_var}         xpath=//*[@class="blocklyAddVariableText"]
${wood_creat_var}                xpath=//*[@class="style__input-label__1g6FX"]
${wood_creat_var_close}          xpath=//*[@class="style__close_btn__2RsCq"]
${wood_creat_var_cancle}         xpath=//div[@class='style__btn-wrap__WnlnY']/span[1]
${wood_input_var_name}           xpath=//*[@class="style__input_element__4yD-w"]
${wood_creat_var_sure}           xpath=//div[@class='style__btn-wrap__WnlnY']/span[2]
${wood_workspace_textarea}       id:    SNAPE

${python_我的作品}               xpath=//a[text()='我的作品']
${python_login用户名}            xpath://input[@placeholder='用户名']
${python_login密码}              xpath://input[@placeholder='密码']
${python_登录按钮}               xpath://span[text()='登录']
${python_frame[1]}               xpath=//div[@class='vh-center project-wrapper_uv7Es']/div[1]
${python_delete_sure}            xpath=//span[text()='删除']



*** Keywords ***
Open Client
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${wood_client_dir}
    Create WebDriver    Chrome    chrome_options=${options}
    Set Selenium Speed    0.5 seconds
    Sleep    2
    ${test_flag}    Get Element Count    ${wood_guide_next_button}
    Run Keyword If    '${test_flag}' == '0'    Restart
    Skip Guide
    # if Login state not exists login
    ${test_log_sign}    Get Text    ${wood_ue_nickname}
    Run Keyword If    '${test_log_sign}' != '未登录'    Logout

Open Client With Login
    Open Client
    Login

Teardown
    # clear cache
    Execute Javascript    indexedDB.deleteDatabase('snape_app')
    Close Window
    Close Process    chromedriver

Restart
    Teardown
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${wood_client_dir}
    Create WebDriver    Chrome    chrome_options=${options}
    Set Selenium Speed    0.5 seconds
    Sleep    3

Skip Guide
    # Click Button    ${wood_guide_next_button}    # click next
    # Click Button    ${wood_guide_next_button}    # click i Know
    # Click Button    ${wood_guide_next_button}    # click start
    Repeat Keyword    3 times    Click Button    ${wood_guide_next_button}

Open Signup
    Click Element    ${wood_user_entrance}
    Click Element    ${wood_ld_signup_button}

Signup Failed
    [Arguments]    ${usernaem}    ${password}    ${ver_code}    ${error}
    Open Signup
    Input Text    ${wood_sd_phonenum}    ${usernaem}
    Input Text    ${wood_sd_password}    ${password}
    Input Text    ${wood_sd_vircode_text}    ${ver_code}
    Click Element    ${wood_sd_signup_button}
    Element Should Contain    ${wood_sd_err_text}    ${error}
    Click Element    ${wood_ld_close}

Login
    Click Element    ${wood_user_entrance}
    Sleep    0.5
    Input Text    ${wood_ld_username}    ${test_username}
    Input Text    ${wood_ld_password}    ${test_password}
    Click Element    ${wood_ld_login_button}
    Sleep    0.5

Login Failed
    [Arguments]    ${usernaem}    ${password}    ${error}
    Click Element    ${wood_user_entrance}
    Input Text    ${wood_ld_username}    ${usernaem}
    Input Text    ${wood_ld_password}    ${password}
    Click Element    ${wood_ld_login_button}
    Element Should Contain    ${wood_ld_err_text}    ${error}
    Click Element    ${wood_ld_close}

Logout
    Click Element    ${wood_user_entrance}
    Click Element    ${wood_ue_logout_button}
    Click Element    ${wood_lod_confirm}

Logout And Login
    Logout
    Login


New Built
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_newbuilt}

New Built_hex
    Page Should Not Contain    microbit作品
    Click Element    ${wood_hex_button}
    Click Element    ${wood_new_hex}
    # Page Should Contain    选择设备
    Click Element    ${wood_hex_device_connect}
    Click Element    ${wood_hex_device_cancle}
    Click Element    ${wood_hex_button}
    Click Element    ${wood_new_hex}
    # Page Should Contain    选择设备
    Click Element    ${wood_hex_device_connect}
    Click Element    ${wood_hex_device_confirm}
    Page Should Contain    microbit作品

New Microbit
    Page Should Contain    microbit作品
    Mouse Over    ${wood_hex_button}
    Click Element    ${wood_hex_button}
    Click Element    ${wood_new_microbit}



Open_file
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open}


Save To Local
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_save}

Save As
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_save_as}

Save To Cloud
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_save_to_cloud}

Open Template
    [Arguments]    ${index}
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_template}
    Click Element    ${wood_template_num}[${index+1}]

Setting Language
    Click Element    ${wood_setting_button}
    Mouse Over    ${wood_setting_language}
    ${language_num}    Get Element Count    ${wood_setting_language_xpath}
    Should Be True    ${language_num}    3

Open Local Test py
    [Arguments]    ${files_path}    ${py_name}
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open}
    Win Wait    打开    \    2
    Win Exists    打开
    Sleep    1
    Control Set Text    打开    \    1148    ${files_path}
    Sleep    1
    Control Click    打开    \    1
    Sleep    1
    Control Set Text    打开    \    1148    ${py_name}
    Sleep    1
    Control Click    打开    \    1
    Sleep    0.5

Open Cloud Test py
    [Arguments]    ${py_name}
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    Sleep    0.3
    Click Element    ${wood_cfd_list}//span[contains(text(), "${py_name}")]/../..

Open Cloud Test py Random
    Click Element    ${wood_file_icon}
    Click Element    ${wood_file_open_cloud}
    ${test_cf_count}    Get Element Count    ${wood_cfd_list[7::]}/div
    ${test_cf_count+1}    Evaluate    ${test_cf_count}+${1}
    @{test_file_list}    Create List
    Log Many    @{test_file_list}
    :FOR    ${i}    IN RANGE    1    ${test_cf_count+1}
    \    ${test_filename}    Get Text    ${wood_cfd_list}/div[${i}]//span[contains(@class, "style__client_workname")]
    \    @{test_file_list}    Create List    @{test_file_list}    ${test_filename}
    Log Many    @{test_file_list}
    ${random}    Evaluate    random.randrange(${test_cf_count})    random
    Click Element    ${wood_cfd_list}//span[contains(text(), "${test_file_list[${random}]}")]/../..
    # Returns the name of the selected file
    Sleep    2
    Return From Keyword    ${test_file_list[${random}]}


# Open Cloud Test py Random
#     Click Element    ${wood_file_icon}
#     Click Element    ${wood_file_open_cloud}
#     ${test_cf_count}    Get Element Count    ${wood_cfd_list[7::]}/div
#     ${random}    Evaluate    random.randrange(${test_cf_count})    random
#     Click Element    ${wood_cfd_list[7::]}/div[${random}]


Get Tab Save State
    [Arguments]    ${index}
    ${class_value}    Get Element Attribute    //div[contains(@class,"tabs_container")]/span[${index}]/span[2]    class
    # log    ${class_value}
    ${test_res}    Evaluate    "${class_value}".find("close")
    # 如果已保存则返回 True
    Run Keyword If    "${test_res}" == "30"    Return From Keyword    ${True}
    # 如果未保存则返回 False
    Run Keyword If    "${test_res}" != "30"    Return From Keyword    ${False}

# Generator File Name
#     ${test_name}    Set Variable    ${EMPTY}
#     :FOR    ${index}    IN RANGE    ${5}
#     \    ${test_letter}    Evaluate    chr(random.randint(97,122))    random
#     \    ${test_name}    Catenate    SEPARATOR=    ${test_name}    ${test_letter}
#     ${test_name}    Evaluate    "test_"+"${test_name}"
#     Return From Keyword    ${test_name}



# Handle Row
#     [Arguments]    @{row}
#     : FOR    ${cell}    IN    @{row}
#     \    log    ${cell}


# Catch_Url
#     ${user_name}    Get Text    ${wood_user_name}
#     Run Keyword If    '${wood_user_name}' == '陈柏霖'   Return From Keyword    ${https://python.codemao.cn}
#     ...   ELSE    Return From Keyword    ${https://test-python.codemao.cn}


Delete_python_files
    [Arguments]    ${num}    ${env}
    Open Browser    ${env}    chrome
    Maximize Browser Window
    Set Selenium Speed    .6 seconds
    Click Element    ${python_我的作品}
    Sleep    0.5
    input text    ${python_login用户名}    ${test_username}
    input text    ${python_login密码}    ${test_password}
    Click Element    ${python_登录按钮}
    Sleep    2
    Click Element    ${python_我的作品}
    : FOR    ${i}    IN RANGE    ${num}
    \    Mouse Over    ${python_frame[1]}
    # 点击删除
    \    Click Element    ${python_frame[1]}/div[2]
    # 删除确认
    \    Click Element    ${python_delete_sure}
    Close Window
