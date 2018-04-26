#多彩螺旋线

import turtle

t=turtle.Pen()
t.speed(100)
colors = ["red","yellow","blue","green"]

while 1==1:
    answer=input('输入y表示绘制多彩螺旋线,输入n表示非多彩，输入s表示结束，请输入：')   #想想看用什么能够拿到用户输入的答案呢？
    if answer=="y":     #如果答案是字符串'y'的话 
        for i in range (0,200,1):
            t.pencolor(colors[i%4])
            t.forward(i)
            t.left(89)
            
    if answer=="n":       #想想看，应该怎么写这个判断语句呢？     
        for i in range(0,200,1):
            t.forward(i)
            t.left(89)
            #该怎么绘制单色的螺旋线呢？
            
    if answer=="s":     #如果使用者输入s的话
        break   #那么就打断(break)循环
            

print("程序执行完毕啦~(/≧▽≦)/")