#!/usr/bin/sed -nf
H
s/^.\{2\}\(.*\)$/\1/p
g
p
