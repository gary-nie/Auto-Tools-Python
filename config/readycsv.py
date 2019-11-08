import csv
import requests
import json

ospfile = "e://OSPFILE//Pad//adcInputOSP.csv"
errorfile = "e://OSPFILE//Pad//log1.csv"
dict={}
def ready_csv(rfile):
    with open(rfile) as file:
        csv_reader = csv.reader(file)
        while True:
            try:
                csv_next_row = next(csv_reader)
            except:
                break
            else:
                serverName=csv_next_row[0]

                pad=csv_next_row[1]
                print(serverName)
                if serverName != 'ServerName':
                    dict[serverName]=pad
    return  dict

def write_csv(server,backup):
    data=list(server)
    data.append(backup)
    with open(errorfile, 'a+', newline='') as f:
        csv_write = csv.writer(f)
        csv_write.writerow(data)


if __name__=="__main__":
    ready_csv(ospfile)
    #print(dict)
    write_csv(dict)