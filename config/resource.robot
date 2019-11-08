*** settings ***
Library           Collections
Library           Selenium2Library
Library           resetAPI.py
Library           decrypt.py
Library           readycsv.py

*** variables ***
${SERVER}   127.0.0.1:8443
${STGSERVER}
${PROSERVER}
${URL}      https://login.taobao.com/member/login.jhtml
${OSPURL}  https://${STGSERVER}/login/login.html
${BROWSER}   Chrome
${USERNAME}      trend\\beyondsoft_danielw
${PASSWORD}      CcUrsFyxyehmsThnk3sd2w==
${DELAY}          0
${CheckPhysical}   ADC-BIFHR01D

*** keywords ***

Open Browser To Login Page
     Open Browser   ${OSPURL}   ${BROWSER}
     Maximize Browser Window
     Set Selenium Speed  ${DELAY}
     Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    OSP | Login

Input Username
    [Arguments]    ${username}    ${password}
    Input Text    xpath=//*[@name='username']    ${username}
    Input Text    xpath=//*[@name='password']    ${password}

Default UserName And Password
    Log to console     .........
    Input Text    xpath=//*[@name='username']    ${USERNAME}
    ${DECRYPT}   decrypt oralce   ${PASSWORD}
    Input Text    xpath=//*[@name='password']    ${DECRYPT}


Submit Credentials
    Click Button    xpath=//*[@type='submit']

Click Feature
    [Arguments]    ${content}
    Sleep   2
    Click Element  xpath=//*[text()='${content}']

Create Maintenance Plan
    [Arguments]    ${startTime}   ${endTime}   ${notes}
    Sleep   2
    Input Text    xpath=//*[@name='vmstartTime']   ${startTime}
    Input Text    xpath=//*[@name='vmendTime']     ${endTime}
    Input Text    xpath=//*[@name='vmnotes']     ${notes}
    Click Button    xpath=//*[@id='saveButton']
    Sleep   2
    ${number}=   Get Element Attribute   xpath=//*[@class='bootstrap-dialog-message']   Value
    Log to console   ${number}
    ${number1}=   Get Text   xpath=//*[@class='bootstrap-dialog-message']
    Log to console   ${number1}
#    Click Button    xpath=//*[text()='×']
#    Close Alert

Close Alert
    Click Button    xpath=//*[text()='×']

Submit Operation
    Click Element    xpath=//div[@class='bootstrap-dialog-body']//button[2]

Delete Maintenance Plan
    [Arguments]    ${num}
    Sleep   2
    Click Element   xpath=//tr[@data-index='${num}']//span[@class='fa fa-bell-slash fa-lg']
    Sleep   2
    Submit Operation
    Sleep   2
    Close Alert

Click Feature Step
     [Arguments]    &{kwargs}
     Log to console    --------
    : FOR    ${item}    IN    @{kwargs.values()}
    \    Sleep   5
    \    Click Element  xpath=//*[text()='${item}']
    \    Log to console    ${item}

Reset API for GET
     [Arguments]    ${url}   ${data}   ${header}
     Log to console   ${data}
      ${sign}   api get   ${url}   ${data}   ${header}
       @{li}   set variable   ${sign['data']}
      Log to console   ${sign['data']}
      :FOR   ${item}   IN   @{li}
      \     Log to console    ${item['status']}
Reset API for POST
      [Arguments]    ${url}    ${data}   ${header}
      Log to console     -------------
      ${sign}  api post   ${url}   ${data}   ${header}

      @{li}   set variable   ${sign['data']}
      Log to console   ${sign['data']}
      :FOR   ${item}   IN   @{li}
      \     Log to console    ${item['status']}
ClickForOSName
      [Arguments]    ${num}   ${osName}
      Sleep  2
      Click Element   xpath=//tr[@data-index='${num}']//a[@title='edit']
      Sleep  2
      Input Text      xpath=//span[@aria-labelledby='select2-osName-container']    ${osName}
OpenOSPToVMlist
   [Arguments]     &{path}
   Open Browser To Login Page
   Default UserName And Password
   Submit Credentials
   Click Feature Step   &{path}

ReadCSVFile
      [Arguments]     &{path}
      &{dict}   ready csv   e://OSPFILE//Pad//adcInputOSP1.csv
      OpenOSPToVMlist    &{path}
      log to console   ---get csv----
      : FOR  ${s}   IN     @{dict.items()}
      \   log to console    ${s[0]}----${s[1]}
      \   Sleep   4
      \   Input Text    xpath=//input[@placeholder='Search']    ${s[0]}
      \   Sleep   4
      \   Click Element   xpath=//tr[@data-index='0']//a[@title='edit']
      \   Sleep   4
      \   ${ospld}  Get Text   xpath=//*[@name='osPlanned']
      \   log to console  ${ospld}
      \   Input Text    xpath=//*[@name='osPlanned']   ${s[1]}
      \   Click Button    xpath=//*[@id='saveButton']
      \   Sleep   4
      \   ${msg}=   Get Text   xpath=//*[@class='bootstrap-dialog-message']
      \   Log to console   ${msg}
      \   Log to console   ${s}
      \   run keyword if    '${msg}'=='VM Saved'    write csv  ${s}  ${ospld}
      \   Click Button    xpath=//*[text()='×']


#notes/osPlanned


#textarea