#!/usr/bin/python 

import sys, time

def isect(a, b) :
    o = []
    h = {}
    for i in a :
        h[i] = True
    for i in b :
        if h.get(i, False) :
            o.append(i)
    return o

fd = open(sys.argv[1])
cnt = int(fd.readline())
x = []
y = []

for line in fd.readlines() :
    (a, b) = line.split()
    x.append(a)
    y.append(b)

t0 = time.clock()
xy = isect(x, y)
t1 = time.clock()

print("Set   | n = %d : %d intersects found in %f seconds" % (len(x), len(xy), t1 - t0))
