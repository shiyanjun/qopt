#!/usr/bin/python


import sys
import qopt
import qopt.problems._knapsack
import qopt.problems._sat

k15=qopt.problems._knapsack.KnapsackProblem('../../problems/knapsack/knapsack-15.txt')
k20=qopt.problems._knapsack.KnapsackProblem('../../problems/knapsack/knapsack-20.txt')
k25=qopt.problems._knapsack.KnapsackProblem('../../problems/knapsack/knapsack-25.txt')
sat = qopt.problems._sat.SatProblem('../../problems/sat/random-25.cnf')
fun = qopt.problems.func1d.f3

f=open(qopt.path('data/sat25-best'))

if True:
    lines = f.readlines()
    numbers=[int(line) for line in lines]
    cs=[qopt.int2bin(n, 25) for n in numbers]
    #bla=[(c,fun.evaluate(fun.getx(c))) for c in cs]
    bla=[(c,sat.evaluate(c)) for c in cs]
    bla2=sorted(bla, lambda x,y:cmp(x[1],y[1]))
    for lin in bla2:
        print lin
    sys.exit(0)


# knapsack
lines=f.readlines()
numbers=[int(line) for line in lines]
cs=[qopt.int2bin(n, 15) for n in numbers]

bla = []
for c in cs:
    s = '%s' % c
    k25.repair(s)
    bla.append((c, s, k25.evaluate2(s)))

bla2=sorted(bla, lambda x,y:cmp(x[2][1],y[2][1]))

for lin in bla2:
    print lin
