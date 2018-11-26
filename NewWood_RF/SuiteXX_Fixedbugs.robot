*** Settings ***
Library           Selenium2Library
Library           AutoItLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot
Test Setup       open_bs
Test Teardown       Teardown


*** Test Cases ***
file_open_py01
    #未登录状态下打开本地文件
    Click Element    ${tgzy_跳过指引}
    #保证在代码模式下打开作品，不会弹出保存弹窗提示
    Click Element    ${wood_代码模式}
    Sleep    0.5
    #验证打开文件hover正常显示
    Mouse over    ${wood_文件}
    Element Should Be Visible    ${wood_文件_从本地打开}    从本地打开
    #用特写的方法查找指定文件夹中的.Py文件，将文件名字放进一个列表
    @{test_py_name}    Find Py    ${py_file_dir}
    #计算列表长度
    ${length}    Evaluate    len(@{test_py_name})
    :FOR    ${i}    IN RANGE    ${length}
    \    Mouse over    ${wood_文件}
    \    Click Element    ${wood_文件_从本地打开}
    \    Sleep    1
    \    Win Wait    打开    \    2
    \    Win Exists    打开
    \    Win Active    打开
    \    log    ${py_file_dir}
    \    Sleep    0.5
    \    Control Set Text    打开    \    1148    ${py_file_dir}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    \    Sleep    0.5
    \    Control Set Text    打开    \    1148    ${test_py_name[${i}]}
    \    Sleep    0.5
    \    Control Click    打开    \    1
    \    Wait Until Element Is Visible    ${wood_运行}
    \    Click Element    ${wood_运行}
    \    Element Should Be Visible    ${wood_停止}
    \    Sleep    0.2
    \    ${test_zpm}    Get Value     ${wood_作品名称}
    \    Should Contain    ${test_zpm}    pytest
    \    Click Element    ${wood_停止}
    \    Sleep    1