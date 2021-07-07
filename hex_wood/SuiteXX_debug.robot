*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          hex_resource.robot
Test Setup        open_bs
Test Teardown       Teardown

*** Test Cases ***
demo1
    # log    5
    # log    ${5}
    :FOR    ${i}    IN RANGE    ${5}
    \    Log    ${i}

demo
    ${a}    Set Variable    KobeBryant
    log     ${a[:-3]}



open_files
    ${num6}    Set Variable    [6]
    #用特写的方法查找指定文件夹中的.py或者.hex文件，将文件名字放进一个列表
    @{test_py_name}    Find Py    ${py_file_dir_demo}
    ${length}    Evaluate    len(@{test_py_name})
    :FOR    ${i}    IN RANGE    ${length}
    \    Click Element    ${wood_模式切换按钮}
    \    Element Text Should Be    ${wood_模式切换按钮}    积木模式
    \    Mouse over    ${wood_文件}
    \    Click Element    ${wood_文件_choices}${num6}
    \    Sleep    1
    \    Win Wait    打开    \    2
    \    Win Activate    打开
    \    Control Set Text    \    \    Edit1    ${py_file_dir_demo}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    \    Sleep    0.5
    \    Control Set Text    打开    \    1148    ${test_py_name[${i}]}
    \    Control Click    打开    \    1
    \    Sleep    0.5
    \    Element Attribute Value Should Be    ${wood_input_file_name}    value    ${test_py_name[${i}][:-4]}
    \    Click Element    ${wood_模式切换按钮}
    \    Wait Until Page Contains    代码模式
