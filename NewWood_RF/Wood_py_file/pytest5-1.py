# 高效制作8边形
import turtle
t = turtle.Pen()
t.speed(10)
c=0
while c<8:
    t.forward(50)
    t.left(45)
    c=c+1
print("作画完毕")