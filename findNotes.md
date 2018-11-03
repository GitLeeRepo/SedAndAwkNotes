# Overview

Notes on the **find** command

# References

tbd

## YouTube Refences

tbd

## My Other Notes

### Notes in this repository

* [awkNotes](https://github.com/GitLeeRepo/SedAwkAndNotes/blob/master/awkNotes.md#overview)
* [sedNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/sedNotes.md#overview)
* [grepNotes](https://github.com/GitLeeRepo/SedAwkAndGrepNotes/blob/master/grepNotes.md#overview)

### Notes in Other Repositories

* [RegExNotes](https://github.com/GitLeeRepo/RegExNotes/blob/master/RegExNotes.md#overview)
* [NotesGuidlines](https://github.com/GitLeeRepo/NotesGuidlines/blob/master/NotesGuidlines.md#overview)

# Contents

tbd

# Concepts and Terminology

tbd

# find Command

Note: In order to get consistent and accurate results, the filename pattern should be placed in quotes.

Note: older version of find required you to add **-print**, otherwise nothing was displayed.  This is generally not the case anymore, therefore the examples here do not include it.

## Basic syntax

```bash
find path -name 'filename'
```
Note: environment variables such as $HOME can be used, in addition to literal paths such as '/home/username' or '~'.

## Case insensitive (-iname) find with wildcards

```bash
find path -iname '*.c'
```

## Follow Symbolic Links

```bash
find -L path -name 'filename'
```

## Using file size filters

To find gzip files >= 20MB:

```bash
find path -iname '*.gz' -size +20M
```

## Using file access time

To find files that have NOT been access for 90 **days** or more:

```bash
find path -atime +90
```

## Multiple conditions with logical operators

The following all files that start with 'filename', but do not only contain 'filename' by itself:

```bash
find path -name 'filename*' -and -not -name 'filename'
```

The following finds all files that are either \*.asm or \*.c:

```bash
find . -name '*.asm' -o -name '*.c'
```

## Getting recursive file count

```bash
find . -type f | wc -l
```
