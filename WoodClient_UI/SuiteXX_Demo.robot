*** Settings ***
Library           SeleniumLibrary
Library           RFTestLibrary
Library           AutoItLibrary
Library           OperatingSystem
Resource          wood_resource.robot
Test Setup        Open Client With Login
Test Teardown     Teardown

*** Test Cases ***
# open_file
#     @{test_py_name}    Find Py    ${py_file_normal}
#     ${length1}    Evaluate    len(@{test_py_name})
#     : FOR    ${i}    IN RANGE    ${length1}
#     \    Open_file
#     \    Sleep    1
#     \    Win Wait    打开    \    2
#     \    Win Activate    打开
#     \    Control Set Text    \    \    Edit1    ${py_file_normal}\\${test_py_name[${i}]}
#     \    Control Click    \    \    Button1
#     \    Sleep    1
#     \    Element Text Should Be    ${wood_trans_button}    代码模式
#     \    Element Should Contain    ${wood_tab_cur_name}    ${test_py_name[${i}][:-4]}
#     \    Click Element    ${wood_tab_cur_close}
#     # 这里还需要补充积木模式下作品名称hover
#     @{test_py_name}    Find Py    ${py_file_unnormal}
#     ${length2}    Evaluate    len(@{test_py_name})
#     : FOR    ${i}    IN RANGE    ${length2}
#     \    Open_file
#     \    Sleep    1
#     \    Win Wait    打开    \    2
#     \    Win Activate    打开
#     \    log    ${py_file_unnormal}
#     \    Control Set Text    \    \    Edit1    ${py_file_unnormal}\\${test_py_name[${i}]}
#     \    Control Click    \    \    Button1
#     \    Sleep    0.5
#     \    Element Text Should Be    ${wood_trans_button}    积木模式
#     \    Element Should Contain    ${wood_tab_cur_name}    ${test_py_name[${i}][:-4]}
#     \    ${tab_name}    Get Text    ${wood_tab_cur_name}
#     \    ${n}    Evaluate    ${i}+1
#     \    ${x}    Evaluate    ${n}*2+1
#     \    ${y}    Evaluate    ${n}*2+2
#     \    Mouse Over    //*[@id="root"]/div/div[2]/div[2]/span[${x}]
#     \    Element Text Should Be    //*[@id="root"]/div/div[2]/div[2]/span[${y}]/span    ${tab_name}

# save_file
#     # when save to local rename the file_name
#     Save To Local
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     ${name_code}    Creat Code    5
#     ${file_name}    Add    ${name_code}    .py
#     Control Set Text    \    \    Edit1    ${download_file}\\${file_name}
#     # 因为win7和win10的控件按钮不一致，所以这里使用下面的通用写法
#     # Control Click    \    \    Button2
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${file_name}
#     New Built_hex
#     Save To Local
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     ${name_code}    Creat Code    5
#     # ${file_name}    Add    ${name_code}    .hex
#     Control Set Text    \    \    Edit1    ${download_file}\\${name_code}.hex
#     # Control Click    \    \    Button2
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${file_name}
#     # 删除该文件夹下的测试数据
#     @{test_py_name}    Find Py    ${download_file}
#     ${length3}    Evaluate    len(@{test_py_name})
#     ${compare}    Evaluate    ${length3}>0
#     : FOR    ${i}    IN RANGE    ${length3}
#     \    Remove File    ${download_file}\\${test_py_name[${i}]}


# save_file_name
#     # update_tab_name_save_to_local
#     Double Click Element    ${wood_tab_current}
#     ${name_code}    Creat Code    5
#     ${file_name}    Add    ${name_code}    .py
#     Input Text    ${wood_tab_file_name}    ${name_code}
#     Sleep    1
#     Save To Local
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     # Control Set Text    \    \    Edit1    ${download_file}\\${file_name}
#     # Control Click    \    \    Button2
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${file_name}
#     New Built_hex
#     Double Click Element    ${wood_tab_current}
#     ${name_code}    Creat Code    5
#     ${file_name}    Add    ${name_code}    .hex
#     Input Text    ${wood_tab_file_name}    ${name_code}
#     Sleep    1
#     Save To Local
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     # Control Click    \    \    Button2
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${file_name}
#     # 删除该文件夹下的测试数据
#     @{test_py_name}    Find Py    ${download_file}
#     ${length3}    Evaluate    len(@{test_py_name})
#     ${compare}    Evaluate    ${length3}>0
#     : FOR    ${i}    IN RANGE    ${length3}
#     \    Remove File    ${download_file}\\${test_py_name[${i}]}


# save_as
#     # after save as other file to checkout the name_suffix
#     ${cur_tab_name}    Get Text    ${wood_tab_cur_name}
#     Save As
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     Control Set Text    \    \    Edit1    ${download_file}\\${cur_tab_name}.py
#     # Control Click        \    Button2
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${cur_tab_name}.py
#     Sleep    0.5
#     Save As
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${cur_tab_name}-副本.py
#     New Built_hex
#     ${cur_tab_name}    Get Text    ${wood_tab_cur_name}
#     Save As
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${cur_tab_name}.hex
#     Sleep    0.5
#     Save As
#     Win Wait    另存为    \    2
#     Win Activate    另存为
#     Control Click    另存为    \    1
#     Wait Until Page Contains Element    ${wood_toast_file}
#     Element Text Should Be    ${wood_toast_file}    保存成功
#     File Should Exist    ${download_file}\\${cur_tab_name}-副本.hex
#     # delete the test rubbish
#     @{test_py_name}    Find Py    ${download_file}
#     ${length3}    Evaluate    len(@{test_py_name})
#     ${compare}    Evaluate    ${length3}>0
#     : FOR    ${i}    IN RANGE    ${length3}
#     \    Remove File    ${download_file}\\${test_py_name[${i}]}


# ver_file_name_displaytest
#     # 这里会产生一个新文件
#     # 新建文件并验证标签页显示 新的作品
#     New Built
#     Element Should Contain    ${wood_tab_current}    新的作品
#     # 从本地打开作品并验证标签页显示 所打开本地作品的名称
#     Open Local Test py    ${py_file_normal}    AutoTestFile01.py
#     Element Should Contain    ${wood_tab_cur_name}    AutoTestFile01
#     # 从云端打开作品并验证标签页显示 所打开云端作品的名称
#     ${test_selected_file_name}    Open Cloud Test py Random
#     Element Text Should Be    ${wood_tab_cur_name}    ${test_selected_file_name}


# ver_unsave_state_display
#     # 这里会产生一个新文件
#     Click Element    ${wood_trans_button}
#     Click Element    ${wood_workspace_textarea}
#     # 验证未修改时显示已保存状态
#     ${test_gtst0}    Get Tab Save State    1
#     Should Be True    ${test_gtst0}
#     # 验证修改后显示未保存状态
#     Send    test{ENTER}
#     ${test_gtst1}    Get Tab Save State    1
#     log    ${test_gtst1}
#     Should Not Be True    ${test_gtst1}
#     # 验证保存到云端后显示已保存状态
#     Save To Cloud
#     ${test_gtst2}    Get Tab Save State    1
#     Should Be True    ${test_gtst2}
#     # 验证本地打开的文件显示已保存状态
#     Open Local Test py    ${file_to_update}    AutoTestFile04.py
#     ${test_gtst3}    Get Tab Save State    3
#     Should Be True    ${test_gtst3}
#     # 验证修改后显示未保存状态
#     Click Element    ${wood_workspace_textarea}
#     Send    {ENTER}test{ENTER}
#     ${test_gtst4}    Get Tab Save State    3
#     Should Not Be True    ${test_gtst4}
#     # 验证保存到本地后显示已保存状态
#     Save To Local
#     ${test_gtst5}    Get Tab Save State    3
#     Should Be True    ${test_gtst5}

