#!/usr/bin/python

import random

LINES = 1000000
MAX   = LINES * 5

print LINES

for i in range(0, LINES) :
    print "%s %s" % (random.randint(0, MAX), random.randint(0, MAX))
