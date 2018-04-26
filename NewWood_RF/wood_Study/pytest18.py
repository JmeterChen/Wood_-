print('糟糕，百科仪不见了！你会去哪里寻找？')
print('1.图书馆。')
print('2.高科技走廊。')
place=int(input('请输入数字选项： '))
if place==1:
    print('小加正在看书！')
    print('3.请小加帮忙！')
    print('4.不要打扰小加，自己寻找吧！')
    place_1=int(input('请输入数字选项： '))
    if place_1==3:
        print ('太好了，小加捡到了你的百科仪!')
    elif place_1==4:
        print('图书馆太大，找不到啊！')
    else:
        print('随便走动是找不到百科仪的！')
elif place==2:
    print('飞电鼠正在破坏高科技走廊！')
    print('5.抓住飞电鼠！')
    print('6.不管它，找到百科仪更重要！')
    place_2=int(input('请输入数字选项： '))
    if place_2==5:
        print ('原来是飞电鼠藏起了百科仪，终于找到了!')
    elif place_2==6:
        print('百科仪完全没有踪影，怎么办？')
    else:
        print('随便走动是找不到百科仪的！')
else:
    print('随便走动是找不到百科仪的！')
 