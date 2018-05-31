# 简易计算器

# 加法
def add(a, b):
    return a + b

# 减法
def subtract(a, b):
    return a - b

# 乘法
def multiply(a, b):
    return a * b
    
# 除法
def divide(a, b):
    return a / b
    
num1 = float(input("输入第一个数字: "))
num2 = float(input("输入第二个数字: "))

print("选择要进行的运算：")
print("1.相加 2.相减 3.相乘 4.相除")

choice = input("输入你的选择:(1/2/3/4) ")

result = 0

if choice == "1":
    result = add(num1, num2)
    print(num1, "+", num2, "=", result)
if choice == "2":
    result = subtract(num1, num2)
    print(num1, "-", num2, "=", result)
if choice == "3":
    result = multiply(num1, num2)
    print(num1, "*", num2, "=", result)
if choice == "4":
    result = divide(num1, num2)
    print(num1, "/", num2, "=", result)

if result > 100:
    print("计算结果大于 100！")