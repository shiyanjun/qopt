#!/bin/bash

# function rep() {
# 	for s in `seq 1 3`; do
# 		eval $* $s &
# 	done
# 	wait
# }
# 
# rep python bblocks.py f1 15
# rep python bblocks.py f2 20
# rep python bblocks.py f3 25
# 
# rep python bblocks.py k 15
# rep python bblocks.py k 20
# rep python bblocks.py k 25
# 
# rep python bblocks.py sat 15
# rep python bblocks.py sat 20
# rep python bblocks.py sat 25
# 
# exit 0

# python bblocks.py f1 1
# python bblocks.py f1 2
# python bblocks.py f1 3
# 
# python bblocks.py f2 1
# python bblocks.py f2 2
# python bblocks.py f2 3
# 
# python bblocks.py f3 1
# python bblocks.py f3 2
# python bblocks.py f3 3

# python bblocks.py sat15 1
# python bblocks.py sat15 2
# python bblocks.py sat15 3
# python bblocks.py sat15 4
# python bblocks.py sat15 5
# python bblocks.py sat15 6
# python bblocks.py sat15 7
# python bblocks.py sat15 8
# python bblocks.py sat15 9
# python bblocks.py sat15 10
# python bblocks.py sat15 11
# python bblocks.py sat15 12
# python bblocks.py sat15 13
# python bblocks.py sat15 14
# python bblocks.py sat15 15
# python bblocks.py sat15 16
# python bblocks.py sat15 17
# python bblocks.py sat15 18
# python bblocks.py sat15 19
# python bblocks.py sat15 20

# python bblocks.py sat20 1
# python bblocks.py sat20 2
# python bblocks.py sat20 3
# 
# python bblocks.py sat25 1
# python bblocks.py sat25 2
# python bblocks.py sat25 3

# python bblocks.py knapsack15 1
# python bblocks.py knapsack15 2
#python bblocks.py knapsack15 3

# python bblocks.py knapsack20 1
# python bblocks.py knapsack20 2
# python bblocks.py knapsack20 3
# 
# python bblocks.py knapsack25 1
# python bblocks.py knapsack25 2
# python bblocks.py knapsack25 3




python "efficiency-comparison.py" f1 &
python "efficiency-comparison.py" f2 &
python "efficiency-comparison.py" f3 &

python "efficiency-comparison.py" sat90 &
python "efficiency-comparison.py" sat512 &
python "efficiency-comparison.py" sat718 &

python "efficiency-comparison.py" knapsack100 &
python "efficiency-comparison.py" knapsack250 &
python "efficiency-comparison.py" knapsack500 &

wait

