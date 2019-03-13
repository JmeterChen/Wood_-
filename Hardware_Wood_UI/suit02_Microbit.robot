*** Settings ***
Test Setup        Open Bs
Test Teardown     Teardown
Library           SeleniumLibrary
Resource          wh_resource.robot
Library           AutoItLibrary
Library           OperatingSystem

*** Test Cases ***
Microbit_warn
    #硬件助手未打开弹窗-中文
    Process Close    编程猫硬件助手.exe
    Sleep    2
    Mouse Over    ${wood_雷电猴图标}
    Click Element    ${wood_microbit选项_连接按钮}
    Wait Until Page Contains Element    ${wood_硬件助手未开启提示弹窗}    5
    Page Should Contain Element    ${wood_硬件助手未开启_img}
    Element Text Should Be    ${wood_硬件助手未开启_title}    你好像还没打开编程猫硬件助手哦~
    Element Text Should Be    ${wood_硬件助手未开启_content}    使用硬件功能需要先打开这个软件哦，看到它出现在桌面的工具栏里就搞定啦！
    Element Text Should Be    ${wood_硬件助手未开启_下载massage}    还没下载？快去下载吧~
    Remove File    ${wood_Web硬件助手下载路径}
    Click Element    ${wood_硬件助手未开启_下载}
    Click Element    ${wood_硬件助手未开启_关闭}
    Sleep    0.2
    #硬件助手未打开弹窗-中文繁体
    Switch Language    zh-hant
    Mouse Over    ${wood_雷电猴图标}
    Click Element    ${wood_microbit选项_连接按钮}
    Wait Until Page Contains Element    ${wood_硬件助手未开启提示弹窗}    5
    Page Should Contain Element    ${wood_硬件助手未开启_img}
    Element Text Should Be    ${wood_硬件助手未开启_title}    妳好像還沒打開編程貓硬件哦~
    Element Text Should Be    ${wood_硬件助手未开启_content}    使用硬件功能需要先打開這個軟件哦，看到它出現在桌面的工具欄裏就搞定啦！
    Element Text Should Be    ${wood_硬件助手未开启_下载massage}    還沒下載？快去下載吧~
    Click Element    ${wood_硬件助手未开启_关闭}
    Sleep    0.2
    #硬件助手未打开弹窗-英文
    Switch Language    en
    Mouse Over    ${wood_雷电猴图标}
    Click Element    ${wood_microbit选项_连接按钮}
    Wait Until Page Contains Element    ${wood_硬件助手未开启提示弹窗}
    Page Should Contain Element    ${wood_硬件助手未开启_img}
    Element Text Should Be    ${wood_硬件助手未开启_title}    Open Hardware Assistant first
    Element Text Should Be    ${wood_硬件助手未开启_content}    To use hardware functions, you need to open this software first. It will be ready when it appears in the toolbar!
    Element Text Should Be    ${wood_硬件助手未开启_下载英文massage}    Have not downloaded yet? Download now~
    #验证打开硬件助手弹窗消失
    AutoItLibrary.Run    ${wood_硬件助手路径}
    Sleep    4
    Page Should Contain Element    ${wood_未检测到设备弹窗}
    #验证下载按钮功能
    Sleep    35
    File Should Exist    ${wood_Web硬件助手下载路径}
    #Microbit_notDetected
    #未检测到设备弹窗-中文
    #AutoItLibrary.Run    ${wood_硬件助手路径}
    #Mouse Over    ${wood_雷电猴图标}
    #Click Element    ${wood_microbit选项_连接按钮}
    #Wait Until Page Contains Element    ${wood_未检测到设备弹窗}
    #Page Should Contain Element    ${wood_未检测到设备_img}
    #Element Text Should Be    ${wood_未检测到设备_massage}    未检测到microbit\n请用USB线将它连接到电脑上
    #Mouse Over    ${wood_未检测到设备_驱动下载}
    #Element Text Should Be    ${wood_未检测到设备_驱动下载hover}    点击下载USB驱动
    #Remove File    ${wood_Web驱动下载路径}
    #Click Element    ${wood_未检测到设备_驱动下载hover}
    #Click Element    ${wood_未检测到设备_关闭}
    #Sleep    0.2
    #未检测到设备弹窗-繁体
    #Switch Language    zh-hant
    #Mouse Over    ${wood_雷电猴图标}
    #Click Element    ${wood_microbit选项_连接按钮}
    #Wait Until Page Contains Element    ${wood_未检测到设备弹窗}
    #Page Should Contain Element    ${wood_未检测到设备_img}
    #Element Text Should Be    ${wood_未检测到设备_massage}    未偵測到microbit\n請用USB線將它連接到電腦上
    #Mouse Over    ${wood_未检测到设备_驱动下载}
    #Element Text Should Be    ${wood_未检测到设备_驱动下载hover}    點擊下載USB驅動
    #Click Element    ${wood_未检测到设备_关闭}
    #Sleep    0.2
    #未检测到设备弹窗-英文
    #Switch Language    en
    #Mouse Over    ${wood_雷电猴图标}
    #Click Element    ${wood_microbit选项_连接按钮}
    #Wait Until Page Contains Element    ${wood_未检测到设备弹窗}
    #Page Should Contain Element    ${wood_未检测到设备_img}
    #Element Text Should Be    ${wood_未检测到设备_massage}    No microbit is detected.\nPlease connect it to computer by USB
    #Mouse Over    ${wood_未检测到设备_驱动下载}
    #Element Text Should Be    ${wood_未检测到设备_驱动下载hover}    Click to download USB driver.
    #Click Element    ${wood_未检测到设备_关闭}
    #验证驱动下载功能
    #Sleep    8
    #File Should Exist    ${wood_Web驱动下载路径}

Microbit_disconnect
    #验证未连接时microbit显示-中文
    Remove File    ${wood_Web硬件助手下载路径}
    Mouse Over    ${wood_雷电猴图标}
    Sleep    0.1s
    Click element    ${wood_下载编程猫硬件助手}
    AutoItLibrary.Run    ${wood_硬件助手路径}
    Mouse Over    ${wood_雷电猴图标}
    Sleep    0.1s
    Page Should Contain Element    ${wood_microbit选项_未连接图标}
    Mouse Over    ${wood_雷电猴图标}
    Element Text Should Be    ${wood_microbit选项_name}    microbit
    Element Text Should Be    ${wood_下载编程猫硬件助手}    下载编程猫硬件助手
    Element Text Should Be    ${wood_microbit选项_连接按钮}    点击连接
    #验证未连接时microbit显示-繁体
    Switch Language    zh-hant
    Mouse Over    ${wood_雷电猴图标}
    Sleep    0.1s
    #Page Should Contain Element    ${wood_microbit选项_未连接图标}
    Element Text Should Be    ${wood_microbit选项_name}    microbit
    Element Text Should Be    ${wood_下载编程猫硬件助手}    下載編程貓硬件助手
    Element Text Should Be    ${wood_microbit选项_连接按钮}    點擊鏈接
    #验证未连接时microbit显示-英文
    Switch Language    en
    Mouse Over    ${wood_雷电猴图标}
    Sleep    0.1s
    #Page Should Contain Element    ${wood_microbit选项_未连接图标}
    Element Text Should Be    ${wood_microbit选项_name}    microbit
    Element Text Should Be    ${wood_下载编程猫硬件助手}    Download Hardware Assistant
    Element Text Should Be    ${wood_microbit选项_连接按钮}    Connect
    #验证硬件助手下载功能
    Sleep    35
    File Should Exist    ${wood_Web硬件助手下载路径}

Microbit_connect
    #验证连接功能
    Remove File    ${wood_Web硬件助手下载路径}
    Mouse Over    ${wood_雷电猴图标}
    Sleep    0.5
    Click element    ${wood_下载编程猫硬件助手}
    AutoItLibrary.Run    ${wood_硬件助手路径}
    sleep    3
    Mouse Over    ${wood_雷电猴图标}
    Click Element    ${wood_microbit选项_连接按钮}
    Wait Until Page Does Not Contain Element    ${wood_中间状态弹窗}    15
    Mouse Over    ${wood_雷电猴图标}
    Page Should Contain Element    ${wood_microbit选项_已连接图标}
    Element Text Should Be    ${wood_microbit选项_name}    microbit
    Element Text Should Be    ${wood_下载编程猫硬件助手}    下载编程猫硬件助手
    Element Text Should Be    ${wood_microbit选项_连接按钮}    断开连接
    #验证已连接时microbit显示-繁体
    Switch Language    zh-hant
    Mouse Over    ${wood_雷电猴图标}
    Page Should Contain Element    ${wood_microbit选项_已连接图标}
    Element Text Should Be    ${wood_microbit选项_name}    microbit
    Element Text Should Be    ${wood_下载编程猫硬件助手}    下載編程貓硬件助手
    Element Text Should Be    ${wood_microbit选项_连接按钮}    斷開連接
    #验证已连接时microbit显示-英文
    Switch Language    en
    Mouse Over    ${wood_雷电猴图标}
    Page Should Contain Element    ${wood_microbit选项_已连接图标}
    Element Text Should Be    ${wood_microbit选项_name}    microbit
    Element Text Should Be    ${wood_下载编程猫硬件助手}    Download Hardware Assistant
    Element Text Should Be    ${wood_microbit选项_连接按钮}    Disconnect
    #验证硬件助手下载功能
    Sleep    35
    File Should Exist    ${wood_Web硬件助手下载路径}
