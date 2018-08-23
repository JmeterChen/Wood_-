# -*-coding:utf-8-*-
import os
import sys
import random

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
        """Find the .py files from Local.`1

        Example:
        | @{py_list} = | Find py | dir |
        """
        b = []
        names = '.py'
        for root, dirs, files in os.walk(path):
            for name in files:
                if names in name:
                    b.append(name)
        return b

    def add(self, a, b):
        return (a + b)


    def random_num(self):
        return random.randint(0,99)

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
