#/usr/bin/env python3
my_file = '/opt/MkCheck/files/tiks.txt'
sorting = True
hold_lines = []
with open(my_file,'r') as text_file:
    for row in text_file:
        hold_lines.append(row)
outer_count = 1
line_count = 0
while sorting:
    count = 0
    increment = (outer_count-1) * 51
    left = len(hold_lines) - increment
    file_name = "/opt/MkCheck/files/small_file_" + str(outer_count * 51) + ".txt"
    hold_new_lines = []
    if left < 51:
        while count < left:
            hold_new_lines.append(hold_lines[line_count])
            count += 1
            line_count += 1
        sorting = False
    else:
        while count < 51:
            hold_new_lines.append(hold_lines[line_count])
            count += 1
            line_count += 1
    outer_count += 1
    with open(file_name,'w') as next_file:
        for row in hold_new_lines:
            next_file.write(row)
