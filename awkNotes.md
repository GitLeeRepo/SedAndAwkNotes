# Overview

Notes on awk utility and scripting

# References

## Books

* [sed & awk 2nd Edition](https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/ref=cm_cr_arp_d_product_top?ie=UTF8) - O'Reilly

## My Other Notes

* [RegExNotes](https://github.com/GitLeeRepo/RegExNotes/blob/master/RegExNotes.md#overview)
* [sedNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/sedNotes.md#overview)
* [grepNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/grepNotes.md#overview)


# Examples

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
