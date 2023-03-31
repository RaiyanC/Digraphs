
#############################################################################
##
#W  standard/weights.tst
#Y  Copyright (C) 2023                                Raiyan Chowdhury
##                                                         
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

gap> START_TEST("Digraphs package: standard/weights.tst");
gap> LoadPackage("digraphs", false);;

#
gap> DIGRAPHS_StartTest();
gap> d := EdgeWeightedDigraph([[2], []], [[5], []]);
<immutable digraph with 2 vertices, 1 edge>

# create with Digraph
gap> d := EdgeWeightedDigraph(Digraph([[2], []]), [[5], []]);
<immutable digraph with 2 vertices, 1 edge>

# weight not valid
gap> d := EdgeWeightedDigraph([[2], []], [["a"], []]);
Error, out neighbour weight must be either integer, float or rational,

# check all elements of out neighbours are list
gap> d := EdgeWeightedDigraph(["a", []], [[5], []]);
Error, the argument <list> must be a list of lists of positive integers not ex\
ceeding the length of the argument,

# check all elements of weights are list
gap> d := EdgeWeightedDigraph([[1], []], [5, []]);
Error, 2nd argument (list) must be a list of lists,

# string for digraphs
gap> d := EdgeWeightedDigraph([["a"], []], [[2], []]);
Error, the argument <list> must be a list of lists of positive integers not ex\
ceeding the length of the argument,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2]], [[5], []]);
Error, the argument <list> must be a list of lists of positive integers not ex\
ceeding the length of the argument,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2], []], [[5]]);
Error, number of out neighbours and weights must be equal,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2, 2], []], [[5], []]);
Error, size of out neighbours and weights for vertex 1 must be equal,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2], []], [[5, 10], []]);
Error, size of out neighbours and weights for vertex 1 must be equal,

# changing edge weights mutable copy
gap> d := EdgeWeightedDigraph([[2], [1]], [[5], [10]]);
<immutable digraph with 2 vertices, 2 edges>
gap> m := EdgeWeightsMutableCopy(d);
[ [ 5 ], [ 10 ] ]
gap> m[1] := [25];
[ 25 ]

# negative edge weights
gap> d := EdgeWeightedDigraph([[2], [1]], [[5], [10]]);
<immutable digraph with 2 vertices, 2 edges>
gap> IsNegativeEdgeWeightedDigraph(d);
false
gap> d := EdgeWeightedDigraph([[2], [1]], [[-5], [10]]);
<immutable digraph with 2 vertices, 2 edges>
gap> IsNegativeEdgeWeightedDigraph(d);
true

#
gap> DIGRAPHS_StopTest();
gap> STOP_TEST("Digraphs package: standard/weights.tst", 0);