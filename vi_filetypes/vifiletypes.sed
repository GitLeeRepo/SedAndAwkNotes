# Use a capture group (\1 which is the filetype name) to remove text following the file
# type and in the next substitute all text before the filetype, including 'setf'

s/setf.([a-z]\w+).*/setf \1/
s/^.*setf//
