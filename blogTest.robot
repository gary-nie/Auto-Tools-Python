*** settings ***
Library           Selenium2Library
Library           Collections
Resource          config/resource.robot

*** variables ***
${var}   Value
@{list}   a   b   c   ${var}
&{dict}   key1=q   key2=w    key3=@{list}


*** keywords ***
keywords test
     Log to console   write logs to the console

*** test cases ***
test should
    ${a}  set variable  3+1
    ${b}  Evaluate  ${a}
    ${c}  set variable   this is a str
    ${f}  set variable   2
    ${d}  set variable   ${empty}
    Should Be Empty  ${d}
    should be equal  ${b}  ${4}
    Should Be Equal As Integers   ${b}   ${4.6}
    Should Be Equal As Numbers    ${b}   ${4.0}
    Should Be Equal As Strings   ${a}    3+1
    Should Be True   ${b}<9
    Should Contain   ${a}   3
    Should Contain X Times   ${a}   3  1
    Should End With    ${a}   1
    Should Match   ${a}   3?*
    Should Not Be Empty    ${c}
    ${s}   Convert To Boolean    ${c}
    Log to console  ${s}
    ${int}   Convert To Number   ${f}
    Log to console  ${int}



test1
    keywords test
    Open Browser  https://www.baidu.com    Chrome
    Maximize Browser Window
    Sleep   2
    ${ret1}   Get Text   xpath=//*[@id='setf']
    Log to console  ${ret1}
    ${ret2}  Get Element Attribute  xpath=//*[@id='setf']  target
    Log to console  ${ret2}
    Input Text   xpath=//*[@id='kw']    robot framework
    Sleep   2
    Click Button  xpath=//*[@id='su']
    ${title}   get title
    Should Be Empty    ${title}
    log to console    ${title}
    Sleep   2
    Click Element  xpath=//h3//a[@target='_blank']
    Sleep   2
    Close browser