# Overview

Notes on awk utility and scripting

# References

## Books

* [sed & awk 2nd Edition](https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/ref=cm_cr_arp_d_product_top?ie=UTF8) - O'Reilly

## My Other Notes

* [RegExNotes](https://github.com/GitLeeRepo/RegExNotes/blob/master/RegExNotes.md#overview)
* [sedNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/sedNotes.md#overview)
* [grepNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/grepNotes.md#overview)

# Differences Betweeen sed, awk, and grep Regular Expressions

Refer to the separate document [DifferencesSedAwkGrep](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/DifferencesSedAwkGrep.md#overview)

# Examples

## Simple reording of output

```bash
ls -l w*

# This ls -l command might return:
-rwxr-xr-x 1 root root 2509 Jul  4  2016 avahi-autoipd.action
-rw-r--r-- 1 root root 1747 Jul  4  2016 avahi-daemon.conf
-rw-r--r-- 1 root root 1121 Jul  4  2016 hosts
drwxr-xr-x 2 root root 4096 Jul  4  2016 services

ls -l w* | awk '{ print $9 $10 " " $5 }'

# awk will return just the filename/extension and the size:
avahi-autoipd.action 2509
avahi-daemon.conf 1747
hosts 1121
services 4096
```
The **\$9** prints the filename, the **\$10** prints the file extension if there is one (note: even though there is a a space between them, that space is not printed so they are joined together).  The **\$5** prints the file size.  Notice the double quotes are used here to include a space between the filename/extension and the filename.

The following is the same as the above, but it includes a regular expression to filter out the directory entery.
```bash
ls -l  | awk '/^[^d]/ { print $9 $10 " " $5 }'

-rwxr-xr-x 1 root root 2509 Jul  4  2016 avahi-autoipd.action
-rw-r--r-- 1 root root 1747 Jul  4  2016 avahi-daemon.conf
-rw-r--r-- 1 root root 1121 Jul  4  2016 hosts
```
In this case the directory entry (idenified by a 'd' in the first position is filtered out.  The **/^\[^d\]/** regular expression says don't match the 'd' (the **\[^d\]** part) that is at the beginning of the line (the first **^ caret**).  The **^ caret** symbol has two meanings when used here.  By itself it mean start of string/line, but when in the character selectors (the square brackets) it means "**not**", as in **not d** here.
