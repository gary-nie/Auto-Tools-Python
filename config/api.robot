*** variables ***
&{header}    X-OSP-TOKEN=PM64KaOxWx4zTwlWdj0363hhbCOqhRSLOyZ3Gw7SIv6Q+k7LewTJxarkRVQYOC2wUwWAqMN20Gs=
&{maintenance-post-data}      serverName=ADC-ADFS1   startTime=2018-11-11 10:10   endTime=2018-11-21 14:25
${maintenance-post}    http://127.0.0.1:8080/OSP/rest/system/addmaintenanceplanbyserver
${maintenance-get}     http://localhost:8080/OSP/rest/system/getmaintenanceplan
&{maintenance-get-data}    updateStartTime=2018-11-13 9:48    updateEndTime=2018-11-13 16:55
