
v = lambda x:x+1>1
print(v(2))

s = '<span class="">没有看过电影，想先下载小说来看看。<br/><br/>以为是讲述类似成功学之类的小说。<br/>看到一半，突然发现主人公死掉了……<br/>然后，我一看章节，还有一大半呢，后面怎么继续呢？<br/>谁知道……<br/>它就完了！<br/>他就完了！<br/>后面一大半全是英文版……真是坑啊……<br/><br/>但是故事挺好看的，<br/>这是一个彻头彻尾的爱情小说……爱得没那么热烈罢了~~~</span> '
print(s.split('">')[1].replace('<br/>',' ').replace("</span>",''))
# print(s[64:len(s)])



#
from snownlp import SnowNLP
import jieba
text='是美国作家弗·司各特·菲茨杰拉德1925年所写的一部以20世纪20年代的纽约市及长岛为背景的中篇小说，小说的背景被设定在现代化的美国社会中上阶层的白人圈内，通过卡拉韦的叙述展开。'
text1='这个人脾气真坏，动不动就骂人'
s = SnowNLP(text1)
print(s.sentiments)
# for sentence in s.sentences:
#    s1 = SnowNLP(sentence)
#    print(s1.sentiments)

#
# seg_list = jieba.lcut(text)
# print("Full Mode: " + "/ ".join(seg_list))
# for i in seg_list:
#     print(i)
#     s1 = SnowNLP(i)
#     print(s1.sentiments)

# stop_words = [w.strips() for w in open('e:\scrapy\dangdang_spider\BosonNLP_sentiment_score.txt','rb',encoding='utf-8').readlines()]
# print(stop_words)