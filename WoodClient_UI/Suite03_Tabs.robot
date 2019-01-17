*** Settings ***
Library           SeleniumLibrary
Library           RFTestLibrary
Library           AutoItLibrary
Resource          wood_resource.robot
Test Setup        Open Client With Login
Test Teardown     Teardown

*** Test Cases ***
ver file name displaytest
    # 新建文件并验证标签页显示 新的作品
    New Built
    Element Should Contain    ${wood_tab_current}    新的作品
    # 从本地打开作品并验证标签页显示 所打开本地作品的名称
    Open Local Test py    AutoTestFile01.py
    Element Should Contain    ${wood_tab_cur_name}    AutoTestFile01
    # 从云端打开作品并验证标签页显示 所打开云端作品的名称
    ${test_selected_file_name}    Open Cloud Test py Random
    Element Text Should Be    ${wood_tab_cur_name}    ${test_selected_file_name}

ver unsave state display
    Click Element    ${wood_trans_button}
    Click Element    ${wood_workspace_textarea}
    # 验证未修改时显示已保存状态
    ${test_gtst0}    Get Tab Save State    1
    Should Be True    ${test_gtst0}
    # 验证修改后显示未保存状态
    Send    test{ENTER}
    ${test_gtst1}    Get Tab Save State    1
    Should Not Be True    ${test_gtst1}
    # 验证保存到云端后显示已保存状态
    Save To Cloud
    ${test_gtst2}    Get Tab Save State    1
    Should Be True    ${test_gtst2}
    # 验证本地打开的文件显示已保存状态
    Open Local Test py    AutoTestFile03.py
    ${test_gtst3}    Get Tab Save State    3
    Should Be True    ${test_gtst3}
    # 验证修改后显示未保存状态
    Click Element    ${wood_workspace_textarea}
    Send    {ENTER}test{ENTER}
    ${test_gtst4}    Get Tab Save State    3
    Should Not Be True    ${test_gtst4}
    # 验证保存到本地后显示已保存状态
    Save To Local
    ${test_gtst5}    Get Tab Save State    3
    Should Be True    ${test_gtst5}


# 下面两个已经在Header  Open file 用例中以实现
# ver tabs on-off
#     # 验证新建和打开本地作品会正确新建标签页
#     ${test_times}    Evaluate    random.randint(1, 5)    random
#     :FOR    ${index}    IN RANGE    ${test_times}
#     \    New Built
#     \    Open Cloud Test py Random
#     ${test_tabs_num}    Get Matching Xpath Count    ${wood_tabs_num}
#     ${test_tabs_num}    Evaluate    int(${test_tabs_num})
#     Should Be Equal    ${test_tabs_num}    ${test_times*2+1}
#     # 验证标签页可以正常关闭
#     :FOR    ${index}    IN RANGE    ${test_tabs_num-1}
#     \    Click Element    ${wood_tab_cur_close}
#     ${test_tabs_num}    Get Matching Xpath Count    ${wood_tabs_num}
#     Should Match    ${test_tabs_num}    1

# ver rename
#     ${test_ranname}    Generator File Name
#     ${test_first_cloud_file}    Set Variable    //div[contains(@class, "style__client-container")]/div[1]
#     Double Click Element    ${wood_tab_cur_name}
#     Input Text    ${wood_tab_cur_textarea}    ${test_ranname}
#     Click Element    id:workspace
#     ${test_gtst}    Get Tab Save State    1
#     Should Not Be True    ${test_gtst}
#     Save To Cloud
#     Element Text Should Be    ${wood_tab_cur_name}    ${test_ranname}
#     Click Element    ${wood_file_icon}
#     Click Element    ${wood_file_open_cloud}
#     Element Should Contain    ${test_first_cloud_file}    ${test_ranname}