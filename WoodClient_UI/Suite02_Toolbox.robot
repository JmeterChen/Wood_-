*** Settings ***
Library           SeleniumLibrary
Library           RFTestLibrary
Resource          wood_resource.robot
Test Setup        Open Client
Test Teardown     Teardown

*** Test Cases ***
blocks_flyout
    # 事件积木盒
    Element Should Contain    ${wood_toolbox_events}/div/span[2]    事件
    Click Element    ${wood_toolbox_events}
    Page Should Contain Element    ${wood_blocks_num}    limit=7
    # 控制积木盒
    Element Should Contain    ${wood_toolbox_control}/div/span[2]    控制
    Click Element    ${wood_toolbox_control}
    Page Should Contain Element    ${wood_blocks_num}    limit=11
    Element Should Be Visible    ${wood_blocks_time库}    time库
    Page Should Contain Element    ${wood_blocks_line}
    # 运算积木盒
    Element Should Contain    ${wood_toolbox_operators}/div/span[2]    运算
    Click Element    ${wood_toolbox_operators}
    Page Should Contain Element    ${wood_blocks_num}    limit=25
    ${operation_lib_num}    Get Matching Xpath Count    ${wood_blocks_XX库}
    ${operation_line_num}    Get Matching Xpath Count    ${wood_lines}
    Should Be Equal    ${operation_lib_num}    ${operation_line_num}
    # 字符串积木盒
    Element Should Contain    ${wood_toolbox_strings}/div/span[2]    字符串
    Click Element    ${wood_toolbox_strings}
    Page Should Contain Element    ${wood_blocks_num}    limit=10
    # 变量积木盒
    Element Should Contain    ${wood_toolbox_variables}/div/span[2]    变量
    Click Element    ${wood_toolbox_variables}
    Page Should Contain Element    ${wood_blocks_num}    limit=0
    Element Should Be Visible    ${wood_blocks_creat_var}    创建变量
    Click Element    ${wood_blocks_creat_var}
    Page Should Contain Element    ${wood_creat_var}    添加变量
    Click Element    ${wood_creat_var_close}
    Page Should Not Contain    添加变量
    Click Element    ${wood_blocks_creat_var}
    Input Text    ${wood_input_var_name}    aaa
    Click Element    ${wood_creat_var_cancle}
    Page Should Not Contain    添加变量
    Click Element    ${wood_blocks_creat_var}
    Input Text    ${wood_input_var_name}    aaa
    Click Element    ${wood_creat_var_sure}
    Page Should Contain Element    ${wood_blocks_num}    limit=5
    # 列表积木盒
    Element Should Contain    ${wood_toolbox_lists}/div/span[2]    列表
    Click Element    ${wood_toolbox_lists}
    Page Should Contain Element    ${wood_blocks_num}    limit=19
    Element Should Be Visible    ${wood_blocks_creat_var}    创建变量
    Click Element    ${wood_blocks_creat_var}
    Page Should Contain Element    ${wood_creat_var}    添加变量
    Click Element    ${wood_creat_var_close}
    Page Should Not Contain    添加变量
    Click Element    ${wood_blocks_creat_var}
    Input Text    ${wood_input_var_name}    aaa
    Click Element    ${wood_creat_var_cancle}
    Page Should Not Contain    添加变量
    Click Element    ${wood_blocks_creat_var}
    Input Text    ${wood_input_var_name}    list_bbb
    Click Element    ${wood_creat_var_sure}
    # 字典积木盒
    Element Should Contain    ${wood_toolbox_dictionary}/div/span[2]    字典
    Click Element    ${wood_toolbox_dictionary}
    Page Should Contain Element    ${wood_blocks_num}    limit=11
    Element Should Be Visible    ${wood_blocks_creat_var}    创建变量
    Click Element    ${wood_blocks_creat_var}
    Page Should Contain Element    ${wood_creat_var}    添加变量
    Click Element    ${wood_creat_var_close}
    Page Should Not Contain    添加变量
    Click Element    ${wood_blocks_creat_var}
    Input Text    ${wood_input_var_name}    aaa
    Click Element    ${wood_creat_var_cancle}
    Page Should Not Contain    添加变量
    Click Element    ${wood_blocks_creat_var}
    Input Text    ${wood_input_var_name}    dict_ccc
    Click Element    ${wood_creat_var_sure}
    # 函数积木盒  这里的脚本不完美
    Element Should Contain    ${wood_toolbox_functions}/div/span[2]    函数
    Click Element    ${wood_toolbox_functions}
    Page Should Contain Element    ${wood_blocks_num}    limit=5
    # 海龟库积木盒
    Element Should Contain    ${wood_toolbox_turtle}/div/span[2]    海龟库
    Click Element    ${wood_toolbox_turtle}
    Page Should Contain Element    ${wood_blocks_num}    limit=46
    ${operation_lib_num}    Get Matching Xpath Count    ${wood_blocks_XX库}
    ${operation_line_num}    Get Matching Xpath Count    ${wood_lines}
    ${num}    Evaluate    ${operation_line_num} + 1
    Should Be Equal As Integers    ${num}    ${operation_lib_num}
    #--------回头检查变量积木盒积木个数
    Click Element    ${wood_toolbox_variables}
    Page Should Contain Element    ${wood_blocks_num}    limit=7
    # 高级库积木盒暂时不写