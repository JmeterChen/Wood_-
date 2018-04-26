# -*-coding:utf-8-*-
import os

class Mykeywords:
    def find_py(self, path):
        """Find the .py files from Local.

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

    def close_process(self, process_name):
        """Close a process by process name.
        """
        if process_name[-4:].lower() != ".exe":
            process_name += ".exe"
        os.system("taskkill /f /im " + process_name)


    # def cal_filename(self, filename):
    #     filenamelen = 0
    #     for i in filename:
    #         a = ord(i)
    #         if a >255:
    #             filenamelen += 2
    #         else:
    #             filenamelen +=1                 
    #     return filenamelen
