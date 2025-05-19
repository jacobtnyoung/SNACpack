#' Undirected Example Network
#'
#' A one-mode undirected network of 5 individuals represented as a `network` object.
#'
#' This is a fictitious network used as an example.
#'
#' @format An `network` object with 5 nodes and 5 edges.
#'
#' @details
#' Vertex attributes:
#' - `vertex.names`: Name of individual
#'
#' @examples
#' data( undirected_example_net )
#' sna::gplot( undirected_example_net, gmode = "graph" )
#' # coerce to a matrix
#' as.matrix( undirected_example_net )
"undirected_example_net"
