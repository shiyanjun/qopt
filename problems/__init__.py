import sys
import qopt

# COMBINATORIAL #
import _knapsack
import _func1d
import _sat

knapsack10 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-10.txt'))
knapsack15 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-15.txt'))
knapsack20 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-20.txt'))
knapsack25 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-25.txt'))
knapsack100 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-100.txt'))
knapsack250 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-250.txt'))
knapsack400 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-400.txt'))
knapsack500 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-500.txt'))
knapsack1000 = _knapsack.KnapsackProblem(qopt.path('problems/knapsack/knapsack-1000.txt'))

# func1d
class Funcs: pass
func1d = Funcs()
func1d.f1 = _func1d.Func1D(1)
func1d.f2 = _func1d.Func1D(2)
func1d.f3 = _func1d.Func1D(3)

# sat
#class SATs: pass
#sat = SATs()
from _sat import SatProblem
sat15 = SatProblem(qopt.path('problems/sat/random-15.cnf'))
sat20 = SatProblem(qopt.path('problems/sat/random-20.cnf'))
sat25 = SatProblem(qopt.path('problems/sat/random-25.cnf'))
sat90 = SatProblem(qopt.path('problems/sat/flat30-100.cnf'))
sat512 = SatProblem(qopt.path('problems/sat/qg4-08.cnf'))
sat718 = SatProblem(qopt.path('problems/sat/hanoi4.cnf'))

# REAL #

# cec2005
from _cec2005 import CEC2005

# cec2011
try:
    from _cec2011 import CEC2011
except ImportError, e:
    sys.stderr.write('Warning: Could not import CEC2011 benchmark due to:\n')
    sys.stderr.write(str(e) + '\n')

# cec2013
from _cec2013 import CEC2013

