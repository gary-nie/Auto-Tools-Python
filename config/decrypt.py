import hashlib
import base64
from Crypto.Cipher import AES

def gen_sign(*args):
    m = hashlib.md5()
    m.update(''.join(args).encode('utf8'))
    return m.hexdigest()


def add_to_16(value):
    while len(value) % 16 != 0:
        value += '\0'
    return str.encode(value)

def encrypt_oracle(password):
    key = 'ZXCVBN.?'
    aes = AES.new(add_to_16(key), AES.MODE_ECB)
    encrypt_aes = aes.encrypt(add_to_16(password))
    encrypted_text = str(base64.encodebytes(encrypt_aes), encoding='utf-8')
    return  encrypted_text

def decrypt_oralce(password):
    key = 'ZXCVBN.?'
    aes = AES.new(add_to_16(key), AES.MODE_ECB)
    base64_decrypted = base64.decodebytes(password.encode(encoding='utf-8'))
    decrypted_text = str(aes.decrypt(base64_decrypted),encoding='utf-8').replace('\0','')
    return  decrypted_text

if __name__=='__main__':
    choose=1
    while choose  in [1,2] :
        choose = eval(input('1.encrypt 2.decrypt 3.exit please choose:'))
        if choose==1:
            encrypt=input('Please enter your password :')
            encryptPWD=encrypt_oracle(encrypt)
            print('Encrypt as :',encryptPWD)
        elif choose==2:
            encrypt = input('Please enter your decrypt:')
            decryptPWD = decrypt_oralce(encrypt)
            print('Decrypt as :',decryptPWD)
        else:
            if choose != 3:
              print('Please enter 1 or 2 or 3')
