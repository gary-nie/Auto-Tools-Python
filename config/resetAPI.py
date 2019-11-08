#!/usr/bin/env python
#_*_coding:utf-8_*_
import requests
import json

def add_to_header(header):
    if 'Content-Type' not in  header.keys() :
        header['Content-Type'] = "application/json"
    return  header

def api_get(url,data,header):
    r = requests.get(url)

    json_r = r.json()
    print(json_r)
    return  json_r

def api_post(url,data,header):
    add_to_header(header)
    r =requests.post(url, data=json.dumps(data), headers=header)
    json_r = r.json()
    return  json_r

def api_delete(url,data,header):
    add_to_header(header)
    r=requests.delete(url,data=json.dumps(data),headers=header)
    json_r = r.json()
    return json_r

def api_put(url,data,header):
    add_to_header(header)
    r=requests.put(url,data=json.dumps(data),headers=header)
    json_r = r.json()
    print(json_r)
    return json_r
# url='https://api.github.com/users/NieHao8/repos'
# data={}
# header=''
# rtn=api_get(url,data,header)
# print(rtn)

# url = "http://product.dangdang.com/index.php?r=comment%2Flist&productId=23737065&categoryPath=01.03.56.01.00.00&mainProductId=23737065&mediumId=0&pageIndex=6&sortType=1&filterType=1&isSystem=1&tagId=0&tagFilterCount=0&template=publish&long_or_short=short"
# data = {
# "id":1402001,
# "location":"SJDC",
# "ip":["10.1.1.1","10.1.1.2"]
# }
# header = {"X-OSP-TOKEN":"PM64KaOxWx4zTwlWdj0363hhbCOqhRSLOyZ3Gw7SIv6Q+k7LewTJxarkRVQYOC2wUwWAqMN20Gs="
#           }
# header={}
# api_get(url,{},{})
# print(b)
