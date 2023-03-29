
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
gap> d := EdgeWeightedDigraph([[2],[]],[["a"],[]]); 
Error, out neighbour weight must be either integer, float or rational,

# string for digraphs
gap> d := EdgeWeightedDigraph([["a"],[]],[[2],[]]); 
Error, the argument <list> must be a list of lists of positive integers not ex\
ceeding the length of the argument,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2]],[[5],[]]);  
Error, the argument <list> must be a list of lists of positive integers not ex\
ceeding the length of the argument,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2],[]],[[5]]);   
Error, number of out neighbours and weights must be equal,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2,2],[]],[[5],[]]);
Error, size of out neighbours and weights for vertex 1 must be equal,

# incorrect digraph and weights
gap> d := EdgeWeightedDigraph([[2],[]],[[5,10],[]]);
Error, size of out neighbours and weights for vertex 1 must be equal,

#
gap> DIGRAPHS_StopTest();
gap> STOP_TEST("Digraphs package: standard/weights.tst", 0);