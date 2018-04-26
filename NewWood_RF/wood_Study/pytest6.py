#普通写法：
    #第一步：加载turtle库
import turtle
    #第二步：召唤画笔海龟，并赋值给一个变量
t = turtle.Pen()
    #第三步：控制画笔海龟画出五角星
t.forward(100)
t.right(144)
t.forward(100)
t.right(144)
t.forward(100)
t.right(144)
t.forward(100)
t.right(144)
t.forward(100)
t.right(144)


#使用循环后的火箭写法：
#第一步：加载turtle库
import turtle
#第二步：召唤画笔海龟，并赋值给一个变量
t = turtle.Pen()
#加快海龟绘画速度
t.speed(10) 

#第三步：控制画笔海龟画出五角星
b=0
while b<5:
    t.forward(100)
    t.right(144)
    b=b+1
print("作画完毕")