# Overview

Notes on where sed, awk, and grep differ, particularly in their use of regular expressions.

# References

* [grepNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/grepNotes.md#overview)
* [sedNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/sedNotes.md#overview)
* [awkNotes](https://github.com/GitLeeRepo/SedAwkAndNotes/blob/master/awkNotes.md#overview)

# sed and awk Differences

## Where sed and awk regular expression differ from each other

* **^** (caret) - **sed** will match the beginning of the line, **awk** will match the beginning of the string that may contain one or more newlines.
* **$** (dollar) - **sed** will match the end of the line, **awk** will match the end of the string that may contain one or more newlines.
* **.** (period) - **sed** will match any character except the new line, **awk** will also match the new line
