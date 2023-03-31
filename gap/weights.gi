#############################################################################
##
##  weights.gi
##  Copyright (C) 2023                                Raiyan Chowdhury
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

#############################################################################
# 1. Edge Weights
#############################################################################

InstallGlobalFunction(EdgeWeightedDigraph,
function(digraph, weights)
    local digraphVertices, nrVertices, u, outNeighbours,
    outNeighbourWeights, idx, w;

    if IsDigraph(digraph) then
        digraph := DigraphCopy(digraph);
    else
        digraph := Digraph(digraph);
    fi;

    # check all elements of weights is a list
    if not ForAll(weights, IsListOrCollection) then
        ErrorNoReturn("2nd argument (list) must be a list of lists,");
    fi;

    digraphVertices := DigraphVertices(digraph);

    nrVertices := Size(digraphVertices);

    # check number there is an edge weight list for vertex u
    if nrVertices <> Size(weights) then
        ErrorNoReturn("number of out neighbours and weights must be equal,");
    fi;

    # check all elements of weights is a list and size/shape is correct
    for u in digraphVertices do
        outNeighbours := OutNeighbors(digraph)[u];

        outNeighbourWeights := weights[u];

        # check number of out neigbours for u
        # and number of weights given is the same
        if Size(outNeighbours) <> Size(outNeighbourWeights) then
            ErrorNoReturn(
                "size of out neighbours and weights for vertex ", u,
                " must be equal,");
        fi;

        # check all elements of out neighbours are int
        for idx in [1 .. Size(outNeighbours)] do
            v := outNeighbours[idx];
            w := Float(outNeighbourWeights[idx]);

            if not (IsInt(w) or IsFloat(w) or IsRat(w)) then
                ErrorNoReturn("out neighbour weight must be either integer, float or rational,");
            fi;
        od;
    od;

    SetEdgeWeights(digraph, weights);
    return digraph;
end);

InstallMethod(IsNegativeEdgeWeightedDigraph, "for IsNegativeEdgeWeightedDigraph",
[IsDigraph and HasEdgeWeights],
function(digraph)
    local weights, u, w;

    weights := EdgeWeights(digraph);

    for u in weights do
        for w in u do
            if Float(w) < Float(0) then
                return true;
            fi;
        od;
    od;
    return false;
end);

#############################################################################
# 2. Copies of edge weights
#############################################################################

InstallMethod(EdgeWeightsMutableCopy, "for a digraph by edge weights",
[IsDigraph and HasEdgeWeights],
D -> List(EdgeWeights(D), ShallowCopy));