*** Settings ***
Library           SeleniumLibrary
Library           RFTestLibrary
Library           String
Resource          wood_resource.robot
# Test Setup        Open Client
# Test Teardown     Teardown

*** Test Cases ***
fixedbug1
    ${a}    Set variable    5
    ${b}    Evaluate    ${a}*2+2
    Should Be Equal As Integers    ${b}    12

fixedbug2
    @{useList}    Create List    qwertyuiop    asdfghjkl    zxcvbnm
    log    ${useList}
    log    @{useList}[1]
    # 从一个列表中取的字符串再取
    log    ${useList[1][1]}
    log    ${useList[1][:-3]}

fixedbug3
    ${a}    Creat Code    5
    ${b}    Add    ${a}     .py
    log    ${b}

fixedbug4
    ${a}    Set Variable    asdfgh
    log    ${a[:-3]}

fixedbug5
    ${a}    Set Variable    kobe
    log    ${a}.py

fixedbug6
    ${a}    Set Variable    5
    ${b}    Set Variable    6
    Run Keyword If    ${a}>${b}


fixedbug7
    # 打印的内容之间不能用空格！
    Log    'The function of Icons is Normal!'

fixedbug8
    ${a}    Set Variable    5
    Should Be True    ${a}    5

fixedbug9
    ${a}    Set Variable    5
    ${b}    Evaluate    random.randint(0, ${a})    random
    log    ${b}

fixedbug10
    @{a}    Create List    aa    bb
    ...    cc
    :FOR    ${i}    in    @{a}
    \    log    'i' = ${i}

fixedbug11
    @{a}    Create List    aa    bb    cc
    ${b}    Get Length    ${a}
    log    ${b+1}
    log    @{a}[1]

fixedbug12
    @{a}    Create List    aa    bb    cc
    :FOR    ${i}    IN    @{a}
    \    Log    ${i}
    # @{b}    Create List    11    22    33
    # @{c}    Create List    ${a}    ${b}
    # ${a_len}    Get Length    ${a}
    # ${c_len}    Get Length    ${c}
    # :FOR    ${i}    IN RANGE    ${c_len}
    # \    LOG    @{c}[${i}]
    # \    Log    ${c[${i}]}

fixedbug13
    @{a}    Create List    aa    bb    cc
    @{b}    Create List    11    22    33
    @{table}    Create List    ${a}    ${b}
    # log    ${table}
    : FOR    ${row}    IN    @{table}
    \    log    @{row}


fixedbug14
    ${a}    Set Variable    1
    ${b}    Set Variable    2
    Should Be Equal    ${a}    ${b} & 1

fixedbug15
    @{a}    Create List    11    22    33
    # Log Many    @{a}
    ${b}    Set Variable    44
    @{a}    Create List    @{a}    ${b}
    Log    ${a}
    Log Many    @{a}

fixedbug16
    @{a}    Create List    11    22    33
    @{b}    Create List    55    66
    # 类似Python中的extend
    @{a}    Create List    @{a}    @{b}
    Log    ${a}
    Log Many    @{a}

fixedbug17
    @{a}    Create List    11    22    33
    @{b}    Create List    55    66
    # 类似Python中的append
    @{a}    Create List    ${a}    ${b}
    Log    ${a}
    Log Many    @{a}

fixedbug18
    @{a}    Create List    11    22    33
    @{b}    Create List    55    66
    @{a}    Create List    ${a}    @{b}
    log    ${a}

fixedbug19
    @{a}    Create List    11    22    33
    @{b}    Create List    55    66
    @{a}    Create List    @{a}    ${b}
    log    ${a}
