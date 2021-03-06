#
# Copyright (C) 2012   Robert Nowotniak
#


import time
import qopt
import numpy as np
cimport numpy as cnp

cimport libc.stdlib
cimport libc.string

libc.stdlib.srand(time.time())

cnp.import_array()

from qopt.framework cimport ProblemDouble, ProblemCpp

cdef extern from "rqiea.h":
    cdef cppclass RQIEAcpp "RQIEA":
        RQIEAcpp(int chromlen, int popsize)
        int popsize
        int chromlen
        #int tmax
        float bestval
        float *Q
        char **P
        float *fvals
        char *best
        ProblemCpp[double,double] *problem
        void bqigao()
        void initialize()
        void observe()
        void evaluate()
        void update()
        void storebest()


cdef class __RQIEAcpp:
    cdef RQIEAcpp *thisptr

    def __cinit__(self, int chromlen, int popsize = 10):
        print "__RQIEAcpp constructor"
        self.thisptr = new RQIEAcpp(chromlen, popsize)
    def __dealloc__(self):
        del self.thisptr

    def _initialize(self):
        self.thisptr.initialize()
    def _observe(self):
        self.thisptr.observe()
    def _update(self):
        self.thisptr.update()
    def _storebest(self):
        self.thisptr.storebest()
    def _evaluate(self):
        self.thisptr.evaluate()

    # property mi:
    #     def __get__(self): return self.thisptr.mi
    #     def __set__(self, float mi): self.thisptr.mi = mi

    property popsize:
        def __get__(self): return self.thisptr.popsize
    # property tmax:
    #     def __get__(self): return self.thisptr.tmax
    #     def __set__(self, int tmax): self.thisptr.tmax = tmax
    property best:
        def __get__(self): return self.thisptr.best[:self.thisptr.chromlen]
        def __set__(self, char *val): libc.string.memcpy(self.thisptr.best, val, len(val))
    property bestval:
        def __get__(self): return self.thisptr.bestval
        def __set__(self, val): self.thisptr.bestval = val
    property fvals:
        def __get__(self):
            cdef cnp.npy_intp shape[1]
            shape[0] = <cnp.npy_intp> self.thisptr.popsize
            ndarray = cnp.PyArray_SimpleNewFromData(1, shape, cnp.NPY_FLOAT, self.thisptr.fvals)
            return ndarray
    property problem:
        def __set__(self, ProblemDouble p):
            print p
            self.thisptr.problem = p.thisptr
    property Q:
        def __get__(self):
            cdef cnp.npy_intp shape[2]
            shape[0] = <cnp.npy_intp> self.thisptr.popsize
            shape[1] = <cnp.npy_intp> self.thisptr.chromlen
            ndarray = cnp.PyArray_SimpleNewFromData(2, shape, cnp.NPY_FLOAT, self.thisptr.Q)
            # ndarray.base = ... ???
            # Py_INCREF(self) ... ???
            return ndarray
    property P:
        def __get__(self):
            res = []
            #for i in xrange(self.thisptr.popsize):
            #    res.append(self.thisptr.P[i][:self.thisptr.chromlen])
            return res


class RQIEA(__RQIEAcpp, qopt.EA):

    def __init__(self, int chromlen, int popsize = 10):
        qopt.EA.__init__(self)

    def initialize(self):
        self.bestval = -1
        self._initialize()
        self._observe()
        self._evaluate()
        self._storebest()

    def generation(self):
        self._observe()
        self._evaluate()
        self._update()
        self._storebest()


