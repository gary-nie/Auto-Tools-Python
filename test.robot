*** Settings   ***
Library  Collections
Library  config/decrypt.py
Library  config/addlib.py
Suite Setup    suitstart
Suite Teardown    suitend
Test Setup        testsetup
Test Teardown     teststop
Library     DateTime
*** Variables  ***
${str}            serVal
@{list}           a    b    c   ${str}
&{dict}           key1=K1    key2=@{list}
@{list1}          a    b    c    d


*** test cases ***
Context Text1
     [Documentation]     test context
     Log to console     ${null}
     Log to console     ${str}
     Log to console     ${list[3]}
     Log to console     ${dict['key2'][0]}

Context Text2
     ${res}   Evaluate   1+2+3
     Should be equal   ${res}  ${6}


Context Text3
     ${res}    Evaluate    'i'*3
     Log to console     ${res}
     Length Should Be    ${res}  3

Context Text4
      Calculate and Check Equals   1+2+3   ${6}

Context Text5
      Calculate and Check Equals More   1+2+3   ${6}
      Calculate and Check Equals More   expression=1+6   expected=${7}

Context Text6
      Kwargs keyword    &{dict}
      Varargs keyword   @{list}    ${str}

Context Text7
      [Template]    Calculate and Check Equals
      1+3     ${4}
      2+9     ${11}
      1+5     ${6}


Context Text8
      [Documentation]  custome keyword
      ${sign}  gen sign  @{list1}
      Log to console   ${sign}
      ${members}    add member    ${str}
      Log to console    ${members}
      ${members}    add member    LLisisi
      Log to console    ${members}

Context Text9
    ${a}    Set variable    59
    run keyword if    ${a}>=90    log to console    a
    ...    ELSE IF    ${a}>=70    log to console    b
    ...    ELSE IF    ${a}>=60    log to console    c
    ...    ELSE    log to console   d

Context Text11
    ${a}   set variable   59
    Log to console   ${a}
    run keyword if    ${a}<60    Log to console    dddddddd
    ...    ELSE    log to console    aaaaaaa

Context Text10
    : FOR  ${i}   IN RANGE  ${10}
    \   ${i}  Evaluate   ${i}+1
    \   log to console   ${i}

Context Text12
     run keyword if   'a'=='a'    log to console   1
     ...    ELSE IF   'c'=='c'    log to console   2
     ...    ELSE      'd'=='d'    log to console   3


*** keywords ***
testsetup
   log to console    testsetup
teststop
   log to console    teststop
suitstart
   log to console   suitstart
suitend
   log to console    suitend

Varargs keyword
     [Arguments]    @{args}
     Log to console     --------
     : For    ${item}     IN   @{args}
     \     Log to console    ${item}
Kwargs keyword
     [Arguments]    &{kwargs}
     Log to console    --------
    : FOR    ${item}    IN    @{kwargs.items()}
    \    Log to console    ${item}



Calculate and Check Equals More
     [Arguments]    ${expression}=3+3    ${expected}=${6}
     Log to console      -------
     ${res}  Evaluate    ${expression}
     Log to console     expression ${expression}
     Log to console     res ${res}
     Log to console     expected ${expected}
     Should be equal   ${res}   ${expected}
     [return]    ${res}


Calculate and Check Equals
     [Arguments]    ${expression}    ${expected}
     Log to console      -------------
     ${res}  Evaluate    ${expression}
     Log to console   ${expression}
     Log to console   ${res}
     Should be equal   ${res}   ${expected}
     [return]    ${res}
