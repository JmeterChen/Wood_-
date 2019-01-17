*** Settings ***
Library           SeleniumLibrary
Library           RFTestLibrary
Resource          wood_resource.robot
Test Setup        Open Client
Test Teardown     Teardown

*** Test Cases ***
signup ui
    # 验证 title 显示正确
    Title Should Be    海龟编辑器
    # 验证未登录状态
    Element Should Contain    ${wood_user_entrance}    未登录
    # 验证注册页面显示正常
    Open Signup
    Element Should Contain    ${wood_sd_get_vircode}    获取验证码
    Element Should Contain    ${wood_sd_signup_button}    注册
    #验证注册框可正常关闭
    Click Element    ${wood_ld_close}

signup failed
    [Documentation]    验证输入非法格式的用户名或密码会给出对应提示
    ...                Data-driven testing
    [Template]    Signup Failed
    # 手机号        密码        验证码       错误提示
    ${EMPTY}       12345       123456      手机号不能为空
    1111111111     12345       123456      手机格式不正确
    aaaaaaaaaaa    12345       123456      手机格式不正确
    11111111111    ${EMPTY}    123456      密码不能为空
    11111111111    12345       123456      密码格式错误，至少包含6个字符或数字
    11111111111    123abc      ${EMPTY}    验证码不能为空
    11111111111    abcdef      1           获取验证码失败，请重新尝试
    11111111111    abcdef      123456      获取验证码失败，请重新尝试

login
    [tags]    kobe
    Click Element    ${wood_user_entrance}
    Sleep    0.5
    Element Should Be Visible    ${wood_login_dialog}
    Click Element    ${wood_ld_close}
    Element Should Not Be Visible    ${wood_login_dialog}
    Click Element    ${wood_user_entrance}
    Sleep    0.5
    Input Text    ${wood_ld_username}    ${test_username}
    Input Text    ${wood_ld_password}    ${test_password}
    Click Element    ${wood_ld_login_button}
    Wait Until Page Does Not Contain    未登录


login_third_part
    Click Element    ${wood_user_entrance}
    Sleep    0.5
    #验证登录页面含有第三方登录接口
    Element Text Should Be    ${wood_third_login}    第三方登录
    Element Should Be Visible    ${wood_qq_icon}
    Element Should Be Visible    ${wood_wechat_icon}
    #验证通过QQ登录
    Click Element    ${wood_qq_icon}
    Sleep    0.5
    #跳转到QQ登录界面正常
    Select Window    NEW
    Title Should Be    QQ帐号安全登录
    Close Window
    Select Window    海龟编辑器
    Click Element    ${wood_user_entrance}
    Sleep    0.3
    Click Element    ${wood_wechat_icon}
    #跳转到微信登录界面正常
    Select Window    NEW
    Title Should Be    微信登录
    Close Window
    Select Window    海龟编辑器
    Click Element    ${wood_user_entrance}
    Sleep    0.3
    #验证通过QQ登录
    Click Element    ${wood_qq_icon}
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
    Select Window    title=海龟编辑器
    Page Should Not Contain    未登录


login failed
    [Documentation]    验证输入错误的用户名和密码会给出对应提示
    ...                Data-driven testing
    [Template]    Login Failed
    # 用户名             密码                 错误提示
    ${EMPTY}            ${test_password}    用户名不能为空
    ${test_username}    ${EMPTY}            密码不能为空
    ${test_username}    123                 用户名或密码不正确