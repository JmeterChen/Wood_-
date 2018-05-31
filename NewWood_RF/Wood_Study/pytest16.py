#变量魔法
import turtle
t = turtle.Pen()

colors = ["red","yellow","blue","green"]
t.speed(100)

your_text=input("输入你想绘制的数字或者字符串：")

for i in range(1,100):
    t.pencolor(colors[i%4])
    t.penup()  #抬笔函数
    t.forward(i*3)
    t.pendown()  #落笔函数
    t.write(your_text)  #绘制文本
    t.left(92)