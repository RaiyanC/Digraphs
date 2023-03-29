#############################################################################
##
##  weights.gd
##  Copyright (C) 2023                                Raiyan Chowdhury
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##


# 1. Edge Weights
DeclareAttribute("EdgeWeights", IsDigraph); 
DeclareGlobalFunction("EdgeWeightedDigraph");
DeclareProperty("IsNegativeEdgeWeightedDigraph", IsDigraph and HasEdgeWeights);