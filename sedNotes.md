# Overview

Notes on sed utility and scripting

# References

## Books

* [sed & awk 2nd Edition](https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/ref=cm_cr_arp_d_product_top?ie=UTF8) - O'Reilly

## My Other Notes

* [awkNotes](https://github.com/GitLeeRepo/SedAndAwkNotes/blob/master/awkNotes.md#overview)
* [RegExNotes](https://github.com/GitLeeRepo/RegExNotes/blob/master/RegExNotes.md#overview)

# sed Syntax

```bash
sed \[-e\] 'instruction' file
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

**Alternative 1, using semi-colons after each instruction
```bash
sed 's/this/that/'; -e 's/here/there/'; test.txt
```

