
#用四种不同的颜色画成一个正方形
import turtle

t=turtle.Pen()
colors=['red','blue','black','green']
for i in  colors:
    t.pencolor(i)
    t.forward(100)
    t.left(90)
print("作画完毕") 