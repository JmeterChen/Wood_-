A=True
B=False
if (   A and B   ):
    print ("1. 变量 A  和 B 都为 true")
else:
    print ("2.变量 A 和  B 有一个不为 true")

if (  A or B     ):
    print ("3. 变量 A 和  B 都为 true，或其中一个变量为 true")
else:
    print ("4. 变量 A 和  B 都不为 true")

if (not( A and B ))      :
    print ("5. 变量 A 和  B 都为 false，或其中一个变量为 false")
else:
    print ("6. 变量 A 和  B 都为 true")