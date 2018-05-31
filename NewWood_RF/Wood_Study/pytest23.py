# 啊短的函数魔法2
import turtle

t = turtle.Pen()
t.pencolor("red")
t.speed(100)

#定义函数的区域：
def square(bc):
    for i in range(4):
        t.forward(bc)
        t.left(90)
        


#调用函数的区域

square(40)
square(70)
square(100)