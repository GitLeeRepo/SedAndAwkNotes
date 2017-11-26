# Overview

Notes on the grep utility

# References

## My Other Notes

* [RegExNotes](https://github.com/GitLeeRepo/RegExNotes/blob/master/RegExNotes.md#overview)
* [sedNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/sedNotes.md#overview)
* [awkNotes](https://github.com/GitLeeRepo/SedAwkAndNotes/blob/master/awkNotes.md#overview)

# Command Line Options

* **-r** - recurse all **sub-directories** in addition to the current/path directory
* **-l** - list **matching filenames only**, without the text itself
* **-n** - include the **line number** in the file where the match was found
* **-E** - use **extended-Regular expressions**
* **-P** - use **Perl** compatible **regular expressions**
* **-F** - do **NOT** interpret as a **regular expression**, but as a fixed string
* **-f** - use the search patterns found in **-f \<filename\>**
* **-i** - **case insensitive** search
* **-v** - invert match, i.e., show **non-matched lines/files**
* **-e** - allows **multiple search critia**, with each search string proceeded by an **-e**
* **-c** - display the **count** of matching **lines** in place of normal text output

# Examples

## Basic

List the lines that match the search in the current directory

```bash
grep "regex"
```

## Matching Filenames with Directory Recursion

Don't display the matched text, but just display the filename, also search all subdirectories of the path/current directory
```bash
grep -rl "regex" \</path\>
```

## List Text Found, Including the Line Number, with Directory Recursion

Display the matching text, include the line number where the match was found

```bash
grep -rn "regex" \</path\>
```

## Match the Text and Pipe to Filter for Specific Filename Pattern

Search for header files containing 'boot_params' in the current directory and all subdirectories, displaying the file names only, and not the matched text.

```bash
grep -rl 'boot_params' | grep '.h$'
```

# Lookaround

A lookaround makes an assertion (that which is in the parenthesis), if that assertion is true then the remainder of the expression is evaluated.  Positive assertions use **?=** and negative assertions use **?!** to indicate the condition.

Four Types of Lookaround

Type                | Expression | Example (muli-line scenarios)
--------------------|------------|------------------------------------------------------------------------------------------
Positive Lookahead  | (?=...)    | ^(?=.\*begin\b).\*$ - matches any line having word begin, but won't match begginning
Negative Lookahead  | (?!...)    | ^(?!.\*begin\b).\*$ - matches any line NOT having word begin, it will match begginning
Positive Lookbehind | (?\<=...)  | tbd
Negative Lookbehind | (?\<!...)  | tbd

## Lookahead

Useful for testing when a word is NOT included in a line

### Example using grep and find

```bash
# find the name of all \*.c files in the current directory and its subdirectories, 
# but exclude those in the /book subfolder
find . -name *.c | grep -P '^(?!.*\/book).*$'
```
Note that the **-P** (Perl Style) was needed to evaluate this correctly with grep

Note: another way to accomplish this that doesn't use a lookahead that is perhaps easier to understand, is to use **sed** instead of **grep** to delete those lines that contain '\book':

```bash
find . -name *.c | sed '/\/book/d'
```

## Lookbehind

tbd
