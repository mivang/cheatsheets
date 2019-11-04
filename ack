---
tags: [ tools ]
---

# search for pattern starting from path and its subpaths
ack '<pattern>' <path>

# search for pattern using word boundaries
ack '<pattern>' -w 

# search only in current directory without going into subdirs
ack '<pattern>'-n

# search for pattern ignoring case
ack '<pattern>'-i 

# search for the negation of 'pattern' like grep -v
ack '<pattern>'-v 

# search for pattern but ignoring regexes, like fgrep
ack -Q '<pattern>'

# search for pattern but ignore some directories
ack '<pattern>' --ignore-dir env/ --ignore-dir dataset/

# search for pattern but ignore specific filetypes
ack '<pattern>' --ignore-file=ext:pod,t,py,csv,tsc

# print files containing the pattern
ack '<pattern>' -l 

# print files not containing the pattern
ack '<pattern>' -L 

# search for file names having the specified pattern
ack '<pattern>' -g 

# show file types
ack --help=types

# prints all files of type 'python'
ack -f --python

# show filenames containing 'log' of type ruby
ack -g 'log' --ruby

# show filenames containing 'log' of any type except ruby
ack -g 'log' --noruby

