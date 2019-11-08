*** settings ***
Library           Selenium2Library
Library           Collections
Resource          config/resource.robot

*** variables ***
${serverName}   ADC-DDCICCH2
${osName}    Microsoft Windows Server 2008 R2 (64-bit)
${selectMain}   Inventory
${selectNode}   All VM List
&{path}      selectMain=${selectMain}   selectNode=${selectNode}

*** keywords ***
OpenOSPToVMlist
   Open Browser To Login Page
   Default UserName And Password
   Submit Credentials
   Click Feature Step   &{path}

*** test cases ***
AppendOStoOSP
   OpenOSPToVMlist
   ClickForOSName   37   ${osName}


