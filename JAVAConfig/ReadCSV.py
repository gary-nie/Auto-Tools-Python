#!/usr/bin/env python
#_*_coding:utf-8_*_
import csv
import requests
import json

ospfile = "e://OSPFILE//vmtoolsCheck//name_os_location.csv"
ospActionfile = "e://OSPFILE//vmtoolsCheck//name_os_location.csv"
vmFile="e://OSPFILE//vmtoolsCheck//"
savepath="e://OSPFILE//vmtoolsCheck//missOS2.csv"
#fileNameList=['vmtools_sjdcvc01.csv','vmtools_adcvc01.csv','vmtools_adcvc02.csv','vmtools_sjdcvc02.csv']
fileNameList=[]
check1="e://OSPFILE//Pad//adcInputOSP.csv"
check="e://OSPFILE//Pad//actionToNotes.csv"
test="e://OSPFILE//vmtoolsCheck//"
dict={}

locationOS="E://OSPFILE//117checkOSMissing//check.csv"
remoteOS="E://OSPFILE//117checkOSMissing//osMissing.csv"
save="E://OSPFILE//117checkOSMissing//osMissinglog.csv"

def getosp(rfile):
    with open(rfile) as file:
        csv_reader = csv.reader(file)
        while True:
            try:
                csv_next_row = next(csv_reader)
            except:
                break
            else:
                Name=csv_next_row[0]
                os=csv_next_row[1]
                dict[Name]=os
    return  dict
def gettools(rfile):
    with open(rfile) as file:
        csv_reader = csv.reader(file)
        while True:
            try:
                csv_next_row = next(csv_reader)
            except:
                break
            else:
                serverName = csv_next_row[0]

                if  serverName  in dict.keys()  :
                    data=serverName,dict[serverName]
                    print(serverName)
                    with open(save, 'a+', newline='') as f:
                        csv_write = csv.writer(f)
                        csv_write.writerow(data)
                else:
                    with open(save, 'a+', newline='') as f:
                        data=serverName,''
                        csv_write = csv.writer(f)
                        csv_write.writerow(data)



if __name__ == "__main__":
    getosp(locationOS)
    gettools(remoteOS)
