import turtle
t = turtle.Pen()

sides = int(input("请输入绘制图案边数："))
t.speed(1000)

for m in range(5,50):
    t.left(92)
    t.penup()
    t.forward(m*4)
    t.pendown()
    if(m%2 == 0):
        for n in range(sides):
            t.circle(m/3)
            t.right(360/sides)
    else:
        for n in range(sides):
            t.forward(m)
            t.right(360/sides)