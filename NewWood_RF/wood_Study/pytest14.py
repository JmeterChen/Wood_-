#多彩螺旋线

import turtle

t=turtle.Pen()
t.speed(100)
colors = ["red","yellow","blue","green"]

for i in range (0,200,1):
    t.pencolor(colors[i%4])
    t.forward(i)
    t.left(89)
    
print("程序执行完毕啦~(/≧▽≦)/")