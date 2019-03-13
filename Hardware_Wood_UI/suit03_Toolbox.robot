*** Settings ***
Test Setup        Open Bs
Test Teardown     Teardown
Library           SeleniumLibrary
Resource          wh_resource.robot

*** Test Cases ***
Toolbox
    #验证积木盒数量
    Sleep    2
    ${number_积木盒数量}    Get Element Count    ${wood_积木盒列表}
    Should Be Equal    ${wood_积木盒数量}    ${number_积木盒数量}
    #验证存在Microbit积木盒
    Element Text Should Be    ${wood_Microbit积木盒}    Microbit
    #验证Microbit积木盒列表
    : FOR    ${i}    IN RANGE    7
    \    run keyword if    ${i} == 0    Element Should Contain    //*[@id="tb_11"]    基本
    \    run keyword if    ${i} == 1    Element Should Contain    //*[@id="tb_12"]    LED
    \    run keyword if    ${i} == 2    Element Should Contain    //*[@id="tb_13"]    按键
    \    run keyword if    ${i} == 3    Element Should Contain    //*[@id="tb_14"]    加速度计
    \    run keyword if    ${i} == 4    Element Should Contain    //*[@id="tb_15"]    指南针
    \    run keyword if    ${i} == 5    Element Should Contain    //*[@id="tb_16"]    引脚
    \    run keyword if    ${i} == 6    Element Should Contain    //*[@id="tb_17"]    无线电
    #验证积木盒显示-繁体
    Switch Language    zh-hant
    Element Text Should Be    ${wood_Microbit积木盒}    Microbit
    : FOR    ${i}    IN RANGE    7
    \    run keyword if    ${i} == 0    Element Should Contain    //*[@id="tb_52"]    基本
    \    run keyword if    ${i} == 1    Element Should Contain    //*[@id="tb_53"]    LED
    \    run keyword if    ${i} == 2    Element Should Contain    //*[@id="tb_54"]    按鍵
    \    run keyword if    ${i} == 3    Element Should Contain    //*[@id="tb_55"]    加速度計
    \    run keyword if    ${i} == 4    Element Should Contain    //*[@id="tb_56"]    指南針
    \    run keyword if    ${i} == 5    Element Should Contain    //*[@id="tb_57"]    引腳
    \    run keyword if    ${i} == 6    Element Should Contain    //*[@id="tb_58"]    無線電
    #验证积木盒显示-英文
    Switch Language    en
    Element Text Should Be    ${wood_Microbit积木盒}    Microbit
    : FOR    ${i}    IN RANGE    7
    \    run keyword if    ${i} == 0    Element Should Contain    //*[@id="tb_93"]    Basic
    \    run keyword if    ${i} == 1    Element Should Contain    //*[@id="tb_94"]    LED
    \    run keyword if    ${i} == 2    Element Should Contain    //*[@id="tb_95"]    Button
    \    run keyword if    ${i} == 3    Element Should Contain    //*[@id="tb_96"]    Accelerometer
    \    run keyword if    ${i} == 4    Element Should Contain    //*[@id="tb_97"]    Compass
    \    run keyword if    ${i} == 5    Element Should Contain    //*[@id="tb_98"]    Pins
    \    run keyword if    ${i} == 6    Element Should Contain    //*[@id="tb_99"]    Radio
