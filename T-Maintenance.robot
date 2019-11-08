*** settings ***
Library           Selenium2Library
Library           Collections
Resource          config/resource.robot
Resource          config/api.robot

*** variables ***
${startTime}   2018-11-28 13:55:00
${endTime}     2018-11-29 13:55:00
${notes}     this is a test
${serverName}   ADC-BIFHR01D
${selectMain}   Inventory
${selectNode}   All Physical Device
${maintenanceList}   Maintenance list
${maintenanceCreate}   Create Maintenance
&{CheckMaintenance}   selectMain=${selectMain}   selectNode=${selectNode}   serverName =${serverName}    selectDetail=${maintenanceList}
&{CreateMaintenance}   selectMain=${selectMain}   selectNode=${selectNode}   serverName =${serverName}    selectDetail=${maintenanceCreate}


*** test cases ***
check maintenance list
    [Documentation]    check maintenance plan for ${serverName}
    Open Browser To Login Page
    Default UserName And Password
    Submit Credentials
    Click Feature Step   &{CheckMaintenance}

delete maintenance
    [Documentation]    check maintenance plan for ${serverName}
    Open Browser To Login Page
    Default UserName And Password
    Submit Credentials
    Click Feature Step   &{CheckMaintenance}
    Delete Maintenance Plan    0


create maintenance
    [Documentation]    create maintenance plan for ${serverName}
    Open Browser To Login Page
    Default UserName And Password
    Submit Credentials
    Click Feature Step   &{CreateMaintenance}
    Create Maintenance Plan   ${startTime}   ${endTime}   ${notes}
#    Sleep   2
    Close browser
Close page
    [Documentation]     close all page
    Close All Browser
API for get
   Reset API for GET    ${maintenance-get}    ${maintenance-get-data}   ${header}
API for post
    [Template]   Reset API for POST
    ${maintenance-post}    ${maintenance-post-data}   ${header}
    ${maintenance-post}    ${maintenance-post-data}   ${header}
    ${maintenance-post}    ${maintenance-post-data}   ${header}
