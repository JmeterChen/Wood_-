
# -*-ecoding:utf-8-*-
# _author_ =ChenBolin
#
# for i in [11,22,[111,222,333],['kobe'],[]]:
#     # print(i,type(i))
#     if type(i) ==list:
#         for m in i:
#             print('-'*20,m)
#     else:
#         print(i)

# if ''+"":
#     print(1)

# def test1():
#     print('ok1')
#
# test1()
#
# def test1():
#     print('ok2')
#
# test1()

def test(a, *args):
    print(a,*args)


test(11,22,[11,22,33])