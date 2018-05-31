# 啊短的函数魔法
import turtle

t = turtle.Pen()
t.pencolor("red")
t.speed(100)

#定义正方形
def square():
    for i in range(4):
        t.forward(100)
        t.left(90)
        
#定义新.正方形
def new_zhengfangxing():
    for i in range(4):
        t.forward(100)
        t.left(90)
        triangle()

#定义三角形triangle()
def triangle():
    for i in range(3):
        t.forward(100)
        t.left(120)

#新.星星
def new_star():
    for i in range(5):
        t.forward(100)
        t.right(144)
        circle()

#星星        
def star():
    for i in range(5):
        t.forward(100)
        t.right(144)

#圆        
def circle():
    t.circle(5)

#八边形
def babianxing():
    for i in range(8):
        t.forward(50)
        t.left(45) 


square()
triangle()
t.left(180)
square()
triangle()
        
# 调用新.正方形
# new_zhengfangxing()

# star()
# new_star()
# circle()
# babianxing()