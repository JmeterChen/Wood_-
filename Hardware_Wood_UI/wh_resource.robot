*** Settings ***

*** Variables ***
# ${url}           https://dev-wood.maocode.cn/?editor_mode=1
# ${url}           https://test-wood.maocode.cn/?editor_mode=1
# ${url}           https://staging-wood.maocode.cn/?editor_mode=1
${url}            https://wood.maocode.cn/?editor_mode=1

${broswer}        chrome

${username}       18682236985
${password}       123456

${wood_官网}        //div[@class='style__button__1AJUG'][1]
${hex_文件}            //div[@class='asset-style__header_content__1TaGn']/div[2]
${wood_保存}            //div[text()='保存']
${wood_模式切换}        css=div[class^='style__switch']
${wood_登录入口}        css=div[class*=header_content__right]>div:nth-child(3)

${hex_block_基本}       //*[@id="tb_11"]/div/span[2]
${hex_block_事件}       //*[@id="tb_18"]/div/span[2]
${hex_block_控制}       //*[@id="tb_19"]/div/span[2]
${hex_block_运算}       //*[@id="tb_20"]/div/span[2]
${hex_block_字符串}    //*[@id="tb_21"]/div/span[2]
${hex_block_变量}     //*[@id="tb_22"]/div/span[2]
${hex_block_列表}     //*[@id="tb_23"]/div/span[2]
${hex_block_字典}     //*[@id="tb_24"]/div/span[2]
${hex_block_函数}     //*[@id="tb_25"]/div/span[2]
${hex_调试}         //div[@class='style__button-wrapper__2jmUy'][1]
${hex_下载}         //div[@class='style__button-wrapper__2jmUy'][2]

${hex_Microbit}              //header/div/div[4]/div[2]
${hex_Microbit_点击连接}      //header/div/div[4]/div[3]/div/div[1]/div[2]
${hex_Microbit_添加扩展}      //header/div/div[4]/div[3]/div/div[1]/div[4]
${hex_Microbit_下载助手}       //header/div/div[4]/div[3]/div/div[2]

${wood_打开}                  //header/div[1]/div[2]/div[3]/div/div[1]
${wood_新建}                  //header/div[1]/div[2]/div[3]/div/div[2]
${wood_另存为}                //header/div[1]/div[2]/div[3]/div/div[3]
${wood_模板作品}              //header/div[1]/div[2]/div[3]/div/div[4]
${wood_保存到本地}            //header/div[1]/div[2]/div[3]/div/div[5]
${wood_从本地打开}            //header/div[1]/div[2]/div[3]/div/div[6]
${wood_打开文件}              css=.style__title__Zu2yi
${wood_cloud_从本地打开}      css=.style__add-words__1VFD9
${wood_cloud_作品1框}         css=.style__clickable_area__2-PZY
${wood_cloud_name1}          css=.style__client_workname__TNkSB
${wood_作品文件名}            css=.style__project_name__input__4kDDB
${wood_Microbit积木盒}           //*[@id="tb_10"]/div[1]/span[2]
${wood_非hex文件打开警告}         //*[@id="root"]/div/div[2]/div[3]
${wood_关键词搜索作品}           //span[@class='style__input-client__2dfqF']
${wood_cloud_close}           css=span[class*='style__icon-client-close']
${wood_cloud_框框1}           css=.style__file_client_item__2h55A.style__add_item__2bbbF
${wood_save_toast}           css=div[class^='style__dialog-wrap__uZUg1']
${wood_save_toast1}          css=div[class^=style__pic]+div
${wood_save_toast2}          css=div[class^=style__text]>div:nth-child(3)
${wood_save_cancle}          css=div[class^=style__cancel]
${wood_save_confirm}         css=div[class^=style__cancel]+div
${wood_save_close}           css=span[class^=style__close]
${wood_登录弹窗}              css=div[class^=asset-style__dialog-wrap__]
${wood_保存toast提示}         css=div[class=style__container__1xk6B]
${wood_保存toast提示2}       //div[@class='style__image-button-wrapper__Xjv2o']/div[1]
${wood_我的作品}             //div[text()='我的作品']
${wood_我的作品列表first}     //div[@class='vh-center project-wrapper_uv7Es']/div[1]
${wood_我的作品删除}          //span[text()='删除']

${hw_hex_dir}              ${CURDIR}\\AutoTestResource
${wood_源码图鉴}      css=span[class*=style__icon-help]



${header_Microbit}    //div[@class='asset-style__header_content__1TaGn']/div[4]
${wood_microbit选项_连接按钮}    //div[@class='link_btn_3mWQG']
${wood_雷电猴图标}     //span[@class='client_icon_2WdQ4 web_3CRP-']
${wood_microbit选项}    //div[@class='hardware_item_1Pnf_ web_3CRP-']
${wood_下载编程猫硬件助手}    //div[@class='asset-style__header_content__1TaGn']/div[4]/div[3]/div[1]/div[2]
${wood_microbit选项_未连接图标}    //div[@class='status_icon_3b1x3 disconnected_1iSB8']
${wood_未检测到设备_massage}    //div[@class='message_1Deju waiting_3XGMG']
${wood_驱动下载}      //img[@class='download_icon_3RuBl']
${wood_未检测到设备_关闭}    //img[@class='close_btn_znfsf']
${wood_未登录}       //div[@class='asset-style__header_content__right__1z-EZ']/div[3]/div[2]/div[1]
${wood_切换语言}      //div[@class='asset-style__header_content__right__1z-EZ']/div[1]/div[1]

${wood_用户名输入}     //input[@type='text']
${wood_密码输入}      //input[@type='password']
${wood_登录按钮}      //span[@class='style__content_item__1jSKG'][3]/div[1]

${wood_nickname_dev}    勇敢的阿米巴804
${wood_用户选项}      //div[@class='asset-style__header_content__right__1z-EZ']/div[3]
${wood_退出登录}      //div[@class='asset-style__header_content__right__1z-EZ']/div[3]/div[3]/div[1]/div[2]

${wood_打开_从本地打开}    //div[@class='style__file_client_item__2h55A style__add_item__2bbbF']
${wood_云端作品列表}    //div[@class='style__file_client_item__2h55A']
${wood_云端作品名}     ${EMPTY}
${wood_文件路径}      D:\\课程\\顺德8年级下册案例hex程序\\01hellobit.hex

${wood_积木盒列表}     //div[@class='blocklyToolboxDiv']/div[1]/div
${wood_积木盒数量}     ${9}
${wood_Microbit积木盒}    //div[@class='blocklyToolboxDiv']/div[1]/div[1]/div[1]
${wood_Microbit积木盒列表}    //div[@class='blocklyToolboxDiv']/div[1]/div[1]/div[2]/div

${wood_调试}        //div[@class='style__button-wrapper__2jmUy'][1]
${wood_下载}        //div[@class='style__button-wrapper__2jmUy'][2]
${wood_控制台打印}     //div[@class='style__hardware_content__3Riz6']
${wood_中间状态弹窗}    //div[@class='style__dialog__3IAhA']/div[1]

${wood_云端作品}      //div[@class='style__client-container__30oDd']/div
${wood_硬件助手未开启提示弹窗}    //div[@class='style__dialog__3IAhA']/div[1]
${wood_硬件助手未开启_title}    //div[@class='title_1_-Zr web_26M3h']
${wood_硬件助手未开启_content}    //div[@class='content_rn_3H web_26M3h']
${wood_硬件助手未开启_img}    //img[@src='asset/whblocks_pic_win.6e2c355.png']
${wood_硬件助手未开启_下载}    //div[@class='download_btn_17PAl']
${wood_硬件助手未开启_下载massage}    //div[@class='download_message_zuDK4 web_26M3h']
${wood_硬件助手未开启_关闭}    //img[@class='close_btn_2qq6Y']
${wood_硬件助手路径}    C:\\Program Files (x86)\\maocode-hardware-agent\\编程猫硬件助手.exe
${wood_硬件助手未开启_下载英文massage}    //div[@class='download_message_zuDK4 web_26M3h english_1-qJC']
${wood_未检测到设备弹窗}    //div[@class='style__dialog__3IAhA']/div[1]
${wood_硬件助手下载地址}    http://static.maocode.cn/hardware/
${wood_硬件助手未开启_下载英文}    //div[@class='download_btn_17PAl english_1-qJC']
${wood_未检测到设备_img}    //img[@src='asset/whblocks_cannot_find.c99d670.gif']
${wood_未检测到设备_驱动下载}    //div[@class='download_usb_2EXxs']
${wood_未检测到设备_驱动下载hover}    //div[@class='hover_message_2ianc web_3rSOp']
${wood_microbit选项_name}    //div[@class='hardware_name_mLctn']
${wood_microbit选项_已连接图标}    //div[@class='status_icon_3b1x3 connected_3qcZX']
${wood_Web硬件助手下载路径}    C:\\Users\\cx\\Downloads\\编程猫硬件助手_windows_32*.zip
${wood_Web驱动下载路径}    C:\\Users\\cx\\Downloads\\win_driver*.zip

${wood_中间状态弹窗_关闭}    //img[@class='close_btn_2kmh1']





${wood_nickname_staging}    People

*** Keywords ***
Switch Language
    [Arguments]    ${wood_language}
    Click Element    ${wood_切换语言}
    Run Keyword If    "${wood_language}" == "zh"    Click Element    ${wood_切换语言}/div[3]/div[1]/div[1]
    ...    ELSE IF    "${wood_language}" == "zh-hant"    Click Element    ${wood_切换语言}/div[3]/div[1]/div[2]
    ...    ELSE IF    "${wood_language}" == "en"    Click Element    ${wood_切换语言}/div[3]/div[1]/div[3]
    # 切换中文    # 切换中文繁体    #切换英文

Open Bs
    Open browser    ${url}    ${broswer}
    Maximize Browser Window
    Set Selenium Speed    .2 seconds
    Set Selenium Implicit Wait    8 seconds
    Switch Language    zh

Login
    Input Text    ${wood_用户名输入}    ${username}
    Input text    ${wood_密码输入}    ${password}
    Click Element    ${wood_登录按钮}
    Sleep    1
    Wait Until Page Does Not Contain    未登录

Teardown
    Close All Browsers


NewBuilt_withToast
    Mouse Over    ${hex_文件}
    Click Element    ${wood_新建}
    Wait Until Page Contains Element    ${wood_save_toast}
    Element Text Should Be    ${wood_save_toast1}    当前作品还没有保存哦
    Element Text Should Be    ${wood_save_toast2}    是否要继续
    Page Should Contain Element    ${wood_save_close}



Hw Connect
    Mouse Over    ${wood_雷电猴图标}
    Sleep    0.2
    Click Element    ${wood_microbit选项_连接按钮}
    Wait Until Page Does Not Contain Element    ${wood_中间状态弹窗}    15

Check text
    [Arguments]     ${path_of_Element}    ${text_msg}    ${language}

