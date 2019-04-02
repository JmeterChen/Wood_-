# 装饰器
import time 
def deco(func):
    def timmer(*args,**kwargs):
        start_time = time.time()
        func(*args,**kwargs)
        end_time = time.time()
        print('the func run time is %s'%(end_time - start_time))
    return timmer

@deco # foo = deco(foo)
# 无参函数
def foo():
    time.sleep(2)
    print('in the foo')

@deco  # bar = deco(bar)
# 有参数函数
def bar(name):
    time.sleep(2)
    print('in the bar,my name is:%s !'%name)


foo()
bar('bar')




