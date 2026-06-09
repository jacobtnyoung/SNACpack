#' Cocaine Dealing Network
#'
#' A one-mode network of 28 individuals represented as a `network` object.
#'
#' The network comes from an investigation into to a large cocaine trafficking organization in New York City.
#' The ties are communications through police wiretaps and represented as directed binary relations.
#'
#' @references
#' Natarajan, M. (2000). *Understanding the Structure of a Drug Trafficking
#' Organization: A Conversational Analysis*. In M. Natarajan & M. Hough (Eds.),
#' *Illegal Drug Markets: From Research to Prevention Policy* (Crime Prevention
#' Studies, Vol. 11, pp. 273--298). Criminal Justice Press.
#'
#' @format An `network` object with 28 nodes and 40 edges.
#'
#' @details
#' Vertex attributes:
#' - `vertex.names`: Name of individual
#'
#' @source Data retrieved from \url{http://www.casos.cs.cmu.edu/tools/datasets/external/index.php}
#'
#' @examples
#' sna::gplot( cocaine_dealing_net )
"cocaine_dealing_net"
