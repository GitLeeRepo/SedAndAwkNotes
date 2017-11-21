#!/bin/bash
#
# Gets raw data from /usr/share/vim/vim80/filetype.vim and then used sed to remove
# everything but the file type name (knowing it immediately follows the word 'setf')
#
# It then pipes it to sort which sorts and removes duplicates, outputing the final
# text to 'filetypes.txt'


# Get all lines of raw data that contain the word 'setf'
grep 'setf' /usr/share/vim/vim80/filetype.vim > filetypes.raw

# use sed to strip off all text in front of the file type and after the file type name
# this includes removing the word 'setf'.  Pipe to sort to sort and remove duplicates
sed -E -e 's/setf.([a-z]\w+).*/setf \1/' -e 's/^.*setf//' filetypes.raw | sort -u > filetypes.txt

# an alternative to the above inline substitutes is to use this sed script:
#sed -E -f vifiletypes.sed filetypes.raw | sort -u

# display the results
less filetypes.txt
