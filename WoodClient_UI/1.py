# encoding=utf-8

import time
import os



def del_library(library_name):
    """
    to del the Library of the path(.wood\libs\) you give
    """
    user = os.path.expanduser('~')
    path = user + '\\' + '.wood\\libs'
    # 改变工作目录到.wood\libs路径下
    os.chdir(path)
    # print(os.getcwd())
    files_list = []
    for root, dirs, files in os.walk(os.getcwd()):
        if dirs and "_" not in dirs[0][0]:
            files_list.append(dirs)
    # print(files_list)
    for i in files_list:
        if library_name in i:   
            try:
                os.popen("rm -rf %s*" % library_name)
                return library_name
            except:
                return library_name
            return True
        else:
            return False


if __name__ == '__main__':
    del_library('ty')
