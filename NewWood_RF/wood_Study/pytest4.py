#用第二种方法调用随机库
from random import randint,uniform,choice   #从random模块引入randint,uniform,choice函数

a=randint(0,1)
b=uniform(0,1)
c=choice(['剪刀','石头','布'])

print(a)    
print(b)    
print(c)     
