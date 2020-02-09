# coding: utf-8
import os
import sys

def splitFile(argv, sub_folder):
    srcFile = argv[1]
    
    
    with open(srcFile, "rt") as file:
        (path, name) = os.path.split(srcFile)
        path = os.path.join(path, sub_folder)
        if not os.path.exists(path):
            os.makedirs(path)

        tex_include_array = []
        output_lines_array = []
        regular_chapter_cnt = 0
        non_regular_chapter_cnt = 0
        for line_string in file:
            if line_string.find('\chapter*{', 0) >= 0:
                if (len(output_lines_array) > 0):
                    full_path = os.path.join(path, target_file_name + '.tex')
                    with open(full_path, 'w+t') as dst_file:
                        dst_file.writelines(output_lines_array)
                        
                    output_lines_array = []
                    
                is_regular_chapter = False
                # if (line_string.find('第', 0) >= 0) and (line_string.find('囬', 0) >= 0):
                if (line_string.find('第', 0) >= 0):
                    is_regular_chapter = True
                    regular_chapter_cnt += 1
                else:
                     non_regular_chapter_cnt += 1
                if (is_regular_chapter):
                    target_file_name = 'chapter_%03d' % regular_chapter_cnt 
                else:
                    target_file_name = 'split_%03d' % non_regular_chapter_cnt
                
                tex_include_array.append('\input{%s\\%s}' % (sub_folder, target_file_name))
                if (is_regular_chapter):
                    start_page = 2 * regular_chapter_cnt - 1
                    insert_pdf = '\includepdf[pages={%d,%d},fitpaper=false]{tst.pdf}\r\n' % (start_page, start_page + 1)
                    output_lines_array.append(insert_pdf)
                    
            output_lines_array.append(line_string)
    
        if (len(output_lines_array) > 0):
            full_path = os.path.join(path, target_file_name + '.tex')
            with open(full_path, 'w+t') as dst_file:
                dst_file.writelines(output_lines_array)

    for item in tex_include_array:
        print(item)
    
if __name__ == '__main__':
    # batRename(sys.argv)
    splitFile(sys.argv, 'sub')
