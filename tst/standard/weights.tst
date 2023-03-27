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

# EdgeWeightedDigraph (by OutNeighbours)
gap> EdgeWeightedDigraph([[2],[]],[[]]);     
Error, number of out neighbours and weights must be equal, 
gap> EdgeWeightedDigraph([[2],[]],[["a"],[]]);
Error, out neighbour weight must be either integer, float or rational,
gap> EdgeWeightedDigraph([[2,1],[]],[[1],[]]);  
Error, size of out neighbours and weights for vertex 1 must be equal,
gap> EdgeWeightedDigraph([[2,1],[]],[[3,4],[]]);
<immutable digraph with 2 vertices, 2 edges>

#
gap> DIGRAPHS_StopTest();
gap> STOP_TEST("Digraphs package: standard/weights.tst", 0);