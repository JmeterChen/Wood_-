# 猜数字游戏
import random

number = random.randint(1,100)
guess = 0

while guess != number:
    guess = int(input("猜猜我正在想的数字是什么（1-100之间）:"))
    
    if guess > number:
        print(guess, "太大了，再试一次吧！")
    if guess < number:
        print(guess, "太小了，再试一次吧！")    
        
print("猜对了，你还挺厉害的嘛！")