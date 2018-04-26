from  turtle import Pen 

t=Pen()
colors=['red','blue','black','green']
for i in  colors:
    t.pencolor(i)
    t.forward(100)
    t.left(90)