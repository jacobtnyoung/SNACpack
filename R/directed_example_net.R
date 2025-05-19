#' Directed Example Network
#'
#' A one-mode directed network of 5 individuals represented as a `network` object.
#'
#' This is a fictitious network used as an example.
#'
#' @format An `network` object with 5 nodes and 8 edges.
#'
#' @details
#' Vertex attributes:
#' - `vertex.names`: Name of individual
#'
#' @examples
#' data( directed_example_net )
#' sna::gplot( directed_example_net )
#' # coerce to a matrix
#' as.matrix( directed_example_net )
"directed_example_net"
