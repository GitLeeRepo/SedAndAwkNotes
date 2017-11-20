# Overview

Notes on sed utility and scripting

# References

## Books

* [sed & awk 2nd Edition](https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/ref=cm_cr_arp_d_product_top?ie=UTF8) - O'Reilly

## My Other Notes

* [awkNotes](https://github.com/GitLeeRepo/SedAndAwkNotes/blob/master/awkNotes.md#overview)
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

# Remove all text before and including a word

Remove the word 'setf' and all text preceeding it on the same line.  In addition sort the output and remove duplicates

```bash
sed 's/^.*setf //' filetypes.txt | sort -u > out.txt
```
