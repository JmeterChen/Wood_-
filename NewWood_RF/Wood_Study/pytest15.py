#有选择的多彩螺旋线

import turtle

t=turtle.Pen()
t.speed(1000)
colors = ["red","yellow","blue","green"]

answer=input("输入y表示绘制多彩螺旋线,输入n表示非多彩，请输入：")
if answer=="y":
    for i in range (0,200,1):
        t.pencolor(colors[i%4])
        t.forward(i)
        t.left(89)
if answer=="n":
    for i in range(0,200,1):
        t.forward(i)
        t.left(89)
    
print("程序执行完毕啦~(/≧▽≦)/")
