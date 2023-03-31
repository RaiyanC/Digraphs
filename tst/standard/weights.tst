#############################################################################
##
#W  standard/oper.tst
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

# not connnected digraph
gap> d := EdgeWeightedDigraph([[1], [2]], [[5], [10]]);
<immutable digraph with 2 vertices, 2 edges>
gap> DigraphEdgeWeightedMinimumSpanningTree(d);
Error, digraph must be connected,

# digraph with one node
gap> d := EdgeWeightedDigraph([[]], [[]]);
<immutable empty digraph with 1 vertex>
gap> DigraphEdgeWeightedMinimumSpanningTree(d);
rec( mst := <immutable empty digraph with 1 vertex>, total := 0 )

# digraph with loop
gap> d := EdgeWeightedDigraph([[1]], [[5]]);
<immutable digraph with 1 vertex, 1 edge>
gap> DigraphEdgeWeightedMinimumSpanningTree(d);
rec( mst := <immutable empty digraph with 1 vertex>, total := 0 )

# digraph with cycle
gap> d := EdgeWeightedDigraph([[2],[3],[1]],[[5],[10],[15]]);
<immutable digraph with 3 vertices, 3 edges>
gap> DigraphEdgeWeightedMinimumSpanningTree(d);              
rec( mst := <immutable digraph with 3 vertices, 2 edges>, total := 15 )

# digraph with negative edge
gap> d := EdgeWeightedDigraph([[2],[]],[[-5],[]]);  
<immutable digraph with 2 vertices, 1 edge>
gap> DigraphEdgeWeightedMinimumSpanningTree(d);
rec( mst := <immutable digraph with 2 vertices, 1 edge>, total := -5 )

# digraph with negative cycle
gap> d := EdgeWeightedDigraph([[2],[3],[1]],[[-5],[-10],[-15]]);
<immutable digraph with 3 vertices, 3 edges>
gap> DigraphEdgeWeightedMinimumSpanningTree(d);
rec( mst := <immutable digraph with 3 vertices, 2 edges>, total := -25 )

# digraph with parallel edges
gap> d := EdgeWeightedDigraph([[2,2,2],[1]],[[10,5,15],[7]]);  
<immutable multidigraph with 2 vertices, 4 edges>
gap> DigraphEdgeWeightedMinimumSpanningTree(d);
rec( mst := <immutable digraph with 2 vertices, 1 edge>, total := 5 )

# not strongly connected
gap> d := EdgeWeightedDigraph([[2],[]],[[5],[]]);
<immutable digraph with 2 vertices, 1 edge>
gap> DigraphEdgeWeightedShortestPaths(d, 1);   
Error, digraph must be strongly connected,

# graph one node
gap> d := EdgeWeightedDigraph([[]],[[]]);           
<immutable empty digraph with 1 vertex>
gap> DigraphEdgeWeightedShortestPaths(d, 1);
rec( distances := [ 0 ], edges := [ fail ], parents := [ fail ] )

# graph with one node and self loop
gap> d := EdgeWeightedDigraph([[1]],[[5]]);
<immutable digraph with 1 vertex, 1 edge>
gap> DigraphEdgeWeightedShortestPaths(d, 1);                       
rec( distances := [ 0 ], edges := [ fail ], parents := [ fail ] )

# graph with two nodes and self loop on second node
gap> d := EdgeWeightedDigraph([[2],[1,2]],[[5],[5,5]]);
<immutable digraph with 2 vertices, 3 edges>
gap> DigraphEdgeWeightedShortestPaths(d, 1);           
rec( distances := [ 0, 5 ], edges := [ fail, 1 ], parents := [ fail, 1 ] )

# graph with cycle
gap> d := EdgeWeightedDigraph([[2],[3],[1]],[[2],[3],[4]]);
<immutable digraph with 3 vertices, 3 edges>
gap> DigraphEdgeWeightedShortestPaths(d, 1);                       
rec( distances := [ 0, 2, 5 ], edges := [ fail, 1, 1 ], 
  parents := [ fail, 1, 2 ] )

# parallel edges
gap> d := EdgeWeightedDigraph([[2,2,2],[1]],[[10,5,15],[7]]);   
<immutable multidigraph with 2 vertices, 4 edges>
gap> DigraphEdgeWeightedShortestPaths(d, 1);
rec( distances := [ 0, 5 ], edges := [ fail, 2 ], parents := [ fail, 1 ] )

# negative edges
gap> d := EdgeWeightedDigraph([[2],[1]],[[-2],[7]]);          
<immutable digraph with 2 vertices, 2 edges>
gap> DigraphEdgeWeightedShortestPaths(d, 1);
rec( distances := [ 0, -2 ], edges := [ fail, 1 ], parents := [ fail, 1 ] )

# parallel negative edges
gap> d := EdgeWeightedDigraph([[2,2,2],[1]],[[-2,-3,-4],[7]]);
<immutable multidigraph with 2 vertices, 4 edges>
gap> DigraphEdgeWeightedShortestPaths(d, 1);
rec( distances := [ 0, -4 ], edges := [ fail, 3 ], parents := [ fail, 1 ] )

# negative cycle
gap> d := EdgeWeightedDigraph([[2,2,2],[1]],[[-10,5,-15],[7]]);
<immutable multidigraph with 2 vertices, 4 edges>
gap> DigraphEdgeWeightedShortestPaths(d, 1);
Error, negative cycle exists,

# source not in graph pos int
gap> d := EdgeWeightedDigraph([[2],[1]],[[2],[7]]);
<immutable digraph with 2 vertices, 2 edges>
gap> DigraphEdgeWeightedShortestPaths(d, 3);
Error, source vertex does not exist within digraph

# source not in graph neg int
gap> DigraphEdgeWeightedShortestPaths(d, -1);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `DigraphEdgeWeightedShortestPaths' on 2 \
arguments

#
gap> DIGRAPHS_StopTest();
gap> STOP_TEST("Digraphs package: standard/weights.tst", 0);