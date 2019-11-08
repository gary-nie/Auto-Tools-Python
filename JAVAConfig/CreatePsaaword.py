import hashlib
import Selenium2Library
import win32com.client
import random
import string
import  DateTime



# d=DateTime.DateTime._day
# print(d)
# list=['a','1','c','2']
# s="-".join(list)
# print(s)

def createPassword_1(isReaead,createPasswordNum,passwordNum):
    randomString='1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*'
    print('rand secret num:')
    if isReaead:
        for i in range(0,createPasswordNum):
            password=''
            for n in range(0,passwordNum):
                 #print("".join(random.sample(randomString,8)))
                 p="".join(random.sample(randomString, 1))
                 password+=p

            print(i,'.',password)
    else:
        for i in range(0, createPasswordNum):
            print(i,'.',"".join(random.sample(randomString,passwordNum)))

if __name__=='__main__':
    createPassword_1(False,10,12)













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
