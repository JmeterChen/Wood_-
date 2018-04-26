# 阿短的函数魔法2
import turtle

t = turtle.Pen()
t.pencolor("red")
t.speed(100)


# 定义函数的区域：
def square(bc):
    for i in range(4):
        t.forward(bc)
        t.left(90)


# 旋转正方形
def rotated_squares(times):
    for i in range(times):
        square(90)
        square(120)
        square(150)
        t.left(360/times)


rotated_squares(5)