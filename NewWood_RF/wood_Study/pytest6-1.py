#进击的五角星写法：
#第一步：加载turtle库
import turtle
#第二步：召唤画笔海龟，并赋值给一个变量
t = turtle.Pen()
#加快海龟绘画速度
t.speed(10) 

#制作第二个循环
c=0
e=100
while c<15:
    #第三步：控制画笔海龟画出五角星
    b=0
    while b<5:
        t.forward(e)
        t.right(144)
        b=b+1
    t.backward(10)
    e=e*0.8
    c=c+1
print("作画完毕")