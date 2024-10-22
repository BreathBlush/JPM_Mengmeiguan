# coding: utf-8
import os
import sys

def list_folders_files(path, suffixes_filters = []):
    list_folders = []
    list_files = []
    for file in os.listdir(path):
        if (not file.startswith("chapter")):
            continue
            
        file_path = os.path.join(path, file)
        if os.path.isdir(file_path):
            list_folders.append(file)
        else:
            file_ext = os.path.splitext(file)[-1]
            ignore_this_file = 0
            if (suffixes_filters is not None):
                ignore_this_file = 1
                for suffix in suffixes_filters:
                    if (file_ext.upper() == suffix.upper()):
                        ignore_this_file = 0
                        break
            if (ignore_this_file == 0):
                list_files.append(file)
    return (list_folders, list_files)
    
def processFile(path_i, fileName):
    full_path = os.path.join(path_i, fileName)
    print(full_path)
    
    found_flg = False
    output_lines_array = []
    with open(full_path, 'rt') as file:        
        for line_string in file:
            index_2 = -1
            index_1 = line_string.find("markboth{")
            if (index_1 > 0):
                index_2 = line_string.find('}', index_1)
            if (index_2 > 0):
                tmp_string = line_string[0: (index_1 + len("markboth{"))] + "\\titlename" + "}" + line_string[(index_2 + 1):]
                found_flg = True
            else:
                tmp_string = line_string
            
            output_lines_array.append(tmp_string)
    
    if ((not found_flg) or (len(output_lines_array) <= 0)):
        return
        
    print("process file: " + full_path)    
    with open(full_path, 'wt') as file:    
        file.writelines(output_lines_array)

def processFile2(path_i, fileName):
    full_path = os.path.join(path_i, fileName)
    # print(full_path)
    
    tmp_str = ''
    count = 0
    with open(full_path, 'rt') as file: 
        tmp_str = fileName + ": "
        
        for line_string in file:
            index = 0
            index = line_string.find('〈', index)
            while (index >= 0):
                index2 = line_string.find('〉', index + 1)
                if (index2 > 0):
                    if (count > 0): 
                        tmp_str += ','
                    tmp_str += line_string[index : (index2 + 1)]
                    # print("file: %s; string: %s" %(fileName, str_tmp))
                    index = index2 + 1
                    count += 1
                        
                index = line_string.find('〈', index)
        
    if (count > 0):
        print(tmp_str)
                
if __name__ == '__main__':
    # batRename(sys.argv)
    suffixes_filters = []
    
    suffixes_filters.append(".tex")
    (list_folders, list_files) = list_folders_files('./sub', suffixes_filters)
    print("files: %d" % len(list_files))
    
    for item in sorted(list_files):
        processFile2('./sub', item)
