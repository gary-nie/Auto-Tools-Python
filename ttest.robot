*** settings ***
Library           Selenium2Library

*** variables ***
${html}      https://login.taobao.com/member/login.jhtml
${ospLogin}  https://www.baidu.com
${browser}   Chrome
${name}      trend\\\beyondsoft_danielw
${password}  HelloWorld!23
${name1}      name
${password1}  password


*** keywords ***
Begin web test
    Log   this is a test log!



*** test cases ***
test01
    [Documentation]    test osp for physical server maintenance plan
    Begin web test
    Open Browser    ${html}    ${browser}
    Sleep    1
    Input Text    xpath=//*[@name='username']    ${name1}
    Input Text    xpath=//*[@name='password']    ${password1}
    Sleep   1
    Click Element  xpath=//*[@type='submit']
    Sleep   1
    Click_Element  xpath=//span[text()='Inventory']
    Sleep   1
    Click_Element  xpath=//span[text()='All Physical Device']
    Sleep   1
    Click_Element  xpath=//a[text()='ADC-BIFHR01D']