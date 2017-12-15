# Overview

Notes on sed utility and scripting

# References

## Books

* [sed & awk 2nd Edition](https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/ref=cm_cr_arp_d_product_top?ie=UTF8) - O'Reilly

## My Other Notes

* [RegExNotes](https://github.com/GitLeeRepo/RegExNotes/blob/master/RegExNotes.md#overview)
* [grepNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/grepNotes.md#overview)
* [awkNotes](https://github.com/GitLeeRepo/SedAwkAndNotes/blob/master/awkNotes.md#overview)

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
```

## Using a Script file

```bash
sed -f  scriptname file
```

# sed Commands

These commands are detailed in the coming sections:

* **s** (**substitution**)
* **d** (**delete**)
* **a** (**append**)
* **i** (**insert**)
* **c** (**change**)
* **l** (**list**)
* **y** (**transform**)
* **p** (**print**)
* **=** (**print line number**)
* **n** (**next**)
* **d** (**delete**)
* **r** (**read file**)
* **w** (**write file**)
* **q** (**quit**)

## Substitution

Replaces the text that matches the search pattern

```bash
sed 's/search/replace/'
```

## Deletion

Deletes the lines that match the search pattern.

```bash
sed '/search/d'
```

## Extracting a portion of a file

### Extract from start of file until match found

```bash
sed '/<pattern>/q' <file>
```
Extracts from the beginning of the file until pattern.  If pattern is never found the whole file is displayed

This is accomplished by using the **q** (**quit**) command.  Sed display output from the beginning of the file until the pattern is reached, and then it quits, in effect giving the desired result.

### Extract from pattern match until the end of the file

```bash
sed -n '/<pattern>/,$ p' <file>
```
Extracts from the pattern line until end of the file.  If the pattern is not found nothing is returned.

This command uses the **p** (**print pattern space**) command to print the contents of the **pattern space** which contains the matching lines between the pattern and the end of the file.  In order for this to work correctly sed's normal output must be suppressed with the **-n** flag.  Also, note the (**$**) to indicate the end of the file (in sed it is end of file, while most other regex utilities such as awk and grep it means end of line)

Note: if you don't want to include the matching line that pattern is on, but everything else until the end of the file, use a capital **P** instead of the lowercase **p**.

### Extract from first pattern until the second pattern

```bash
sed -n '/<pattern1>/,/<pattern2>/ p' <file>
```
Extracts every line in the file between the first pattern and the second pattern, including each patterns line

This command uses the **p** (**print pattern space**) command to print the contents of the **pattern space** which contains the matching lines between the first and second pattern.  In order for this to work correctly sed's normal output must be suppressed with the **-n** flag.

Note: if you don't want to include the matching line that pattern1 and pattern2 on, but everything else in between, use a capital **P** instead of the lowercase **p**.

# Differences Between sed, awk, and grep Regular Expressions

Refer to the separate document [DifferencesSedAwkGrep](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/DifferencesSedAwkGrep.md#overview)

# Simple Examples

## Single Instruction

**To Replace every occurrence of 'this' with 'that' in test.txt**
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
As long as the closing single quote was provided, the command will execute after pressing enter at the end of 'test.txt' (even though the terminating quote is just before it, but because it is on the same line.

# Other Examples

## Remove all text before and including a word

This example takes the file types.raw text file which has the file type definitions recognized by vi, removing all extraneous data before and after the file type name.  The file type name is identified as the word that immediately follows the word 'setf'.  The text following the file text name is removed in the first substitute, with the second substitute removing the text in front of the file type name, including the word 'setf' that was used to identify its location.  In addition it uses sort to sort the output and remove duplicates, and then finally stores it in the file types.txt file.

```bash
sed -E -e 's/setf.([a-z]\w+).\*/setf \1/' -e 's/^.\*setf//' filetypes.raw | sort -u > filetypes.txt
```
Note that the order of the substitutes matter in this example

## Deleting Lines that Contain a Word

The following uses **find** to list all *.c files in the current directory and its subdirectories, along with **sed** that removes those lines that contain **/book**, i.e., those *.c files that are in a subdirectory named **book**.

```bash
find . -name *.c | sed '/\/book/d'
```

