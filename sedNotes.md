# Overview

Notes on sed utility and scripting

# References

## Books

* [sed & awk 2nd Edition](https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/ref=cm_cr_arp_d_product_top?ie=UTF8) - O'Reilly

## My Other Notes

* [awkNotes](https://github.com/GitLeeRepo/SedAwkAndNotes/blob/master/awkNotes.md#overview)
* [RegExNotes](https://github.com/GitLeeRepo/RegExNotes/blob/master/RegExNotes.md#overview)

# sed Syntax

## Using Command Line Instructions

```bash
sed \[-e\] 'instruction' file
```

The **-e** is not needed for a single instruction command, but if multiple instructions are involved you can designate them with **-d**:

```bash
sed -e 'instruction1' -e 'instruction2' file
```

By default the output is sent to standard out, and the original file is not changed.  To output to another file, simply:

```bash
sed 'instruction' inFile > outFile
```

To update the original file in place:

```bash
sed -i 'instruction' fileToUpdate

## Using a Script file

```bash
sed -f  scriptname file
```

# Simple Examples

## Single Instruction

**To Replace every occurance of 'this' with 'that' in test.txt**
```bash
sed 's/this/that/' test.txt
```

## Multiple Instructions

**Alternative 1, using -e for each instruction
```bash
sed -e 's/this/that/' -e 's/here/there/' test.txt
```

**Alternative 2, using semi-colons after each instruction
```bash
sed 's/this/that/'; -e 's/here/there/'; test.txt
```

**Alternative 3, multi-line input

For this enter **sed '** (with a single quote) to begin entering multiple lines in the shell
```bash
sed '
s/this/that/
s/here/there/' test.txt
```
As long as the closing single quote was provided, the command will execute after pressing enter at the end of 'test.txt' (even though the terminiting quote is just before it, but because it is on the same line.

# Examples

## Remove all text before and including a word

This example takes the filetypes.raw text file wich has the filetype definitions recognized by vi, removing all extraneous data before and after the filetype name.  The file type name is identified as the word that immediately follows the word 'setf'.  The text following the file text name is removed in the first substitute, with the second substitute removing the text in front of the filetype name, including the word 'setf' that was used to identify its location.  In addition sit uses sort to ort the output and remove duplicates, and then finally stores it in the filetypes.txt file.

```bash
sed -E -e 's/setf.([a-z]\w+).*/setf \1/' -e 's/^.*setf//' filetypes.raw | sort -u > filetypes.txt
```
Note that the order of the substitutes matter in this example

