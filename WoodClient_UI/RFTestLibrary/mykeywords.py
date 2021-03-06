# -*-coding:utf-8-*-
import os
import sys
import random
import time,datetime

class Mykeywords:
    def find_bcm(self, path):
        """Find the .bcm files from Local.

        Example:
        | @{bcm_list} = | Find bcm | dir |
        """
        b = []
        names = '.bcm'
        for root, dirs, files in os.walk(path):
            for name in files:
                if names in name:
                    b.append(name)
        return b

    def find_py(self, path):
        """Find the .py files from Local.

        Example:
        | @{py_list} = | Find py | dir |
        """
        b = []
        names1 = '.py'
        names2 = '.hex'
        for root, dirs, files in os.walk(path):
            for name in files:
                if names1 in name or names2 in name:
                    b.append(name)
        return b

    def add(self, a, b):
        return (a + b)

    def random_num(self):
        return random.randint(0,99)

    def creat_code(self, num):
        """ 
        Generates a random captcha of the specified number of digits, 
        including uppercase letters and Numbers, based on a parameter
        Example:
        | @{random_num} = | Creat Code | num |
        """
        checkcode = ''
        if type(num) == unicode:
            num = eval(num.encode())
        for i in range(num):
            current = random.randrange(0, num)
            # 根据ASCII码随机生成字母
            if i == current:
                tmp = chr(random.randint(65, 90))
            # 生成随机数字
            else:
                tmp = random.randint(0, 9)
            checkcode += str(tmp)
        return checkcode

    # def time_compare(self,*args):
    #     for i in args:
    #         i = args.split('.')
    #         i = int(i[0])*365 + int(i[1])*30 + int(i[2])

    def close_process(self, process_name):
        """Close a process by process name.
        """
        if process_name[-4:].lower() != ".exe":
            process_name += ".exe"
        os.system("taskkill /f /im " + process_name)

    def wood_time(self, string):
        """
        Get the time as wood_cloud_file modify time
        """
        time_today = str(datetime.date.today())[2:]
        date = time_today.replace('-', string)
        return date

    def get_library_ver(self, library):
        """
        before delete lib to get info 
        """
        with os.popen('C:\\Pyblock\\resources\\app\\Python-win32\\python.exe -m pip show %s' % library) as f:
            message = f.readlines()
            if not len(message):
                return None
            else:
                ver = message[1].strip()
                ver_list = ver.split(':')
                ver_num = ver_list[-1]
                return ver_num.strip()

    def get_path_wood_lib(self):
        """
        to get the path of the current Users in the Computer
        """
        user = os.path.expanduser('~')
        path = user + '\\' + '.wood\libs'
        return path