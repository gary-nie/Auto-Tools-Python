# import hashlib
# import Selenium2Library
# import win32com.client
# import random
# import string
# import  DateTime
import requests

data={}
header={
}
# url='https://api.github.com/users/NieHao8/repos'

url='your github adress'
r = requests.get(url)

addstr='git clone '
command=''

print(r.json().__len__())
for i in r.json():
    print((i['ssh_url']))
    command+=addstr+i['ssh_url']+' ; '
print("command line : ",command)


#
# d=DateTime.DateTime._day
# print(d)
# list=['a','1','c','2']
# s="-".join(list)
# print(s)
#
# randomString='1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*|'
# randomString1='1234567qa'
# print('rand secret num:')
# for i in range(0,12):
#     password=''
#     for i in range(0,12):
#          #print("".join(random.sample(randomString,8)))
#          p="".join(random.sample(randomString, 1))
#          password+=p
#
#     print(password)


















def gen_sign(*args):
    m = hashlib.md5()
    m.update(''.join(args))
    return m.hexdigest()


def encrypt(key, content):  # key:密钥,content:明文
    EncryptedData = win32com.client.Dispatch('CAPICOM.EncryptedData')
    EncryptedData.Algorithm.KeyLength = 5
    EncryptedData.Algorithm.Name = 2
    EncryptedData.SetSecret(key)
    EncryptedData.Content = content
    return EncryptedData.Encrypt()


def decrypt(key, content):  # key:密钥,content:密文
    EncryptedData = win32com.client.Dispatch('CAPICOM.EncryptedData')
    EncryptedData.Algorithm.KeyLength = 5
    EncryptedData.Algorithm.Name = 2
    EncryptedData.SetSecret(key)
    EncryptedData.Decrypt(content)
    str = EncryptedData.Content
    return str








# a = hashlib.md5("64".encode("utf-8"))
# print(a)
# print(a.hexdigest())
# print(a.digest())
# print(a.digest()[-1])
# b = hashlib.md5("64".encode("utf-8"))
# print(a.digest() == b.digest())
