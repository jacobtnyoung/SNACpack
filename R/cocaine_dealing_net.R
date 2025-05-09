#' Cocaine Dealing Network
#'
#' A one-mode network of 28 individuals represented as a `network` object.
#'
#' The network comes from an investigation into to a large cocaine trafficking organization in New York City.
#' The ties are communications through police wiretaps and represented as directed binary relations.
#'
#' @references
#' Natarajan, M. (2006). Understanding the structure of a large heroin distribution network:
#' A quantitative analysis of qualitative data. *Journal of Quantitative Criminology*, 22(2), 171–192.
#' \url{https://doi.org/10.1007/s10940-006-9000-6}
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
#' data( cocaine_dealing_net )
#' library( gplot )
#' gplot( cocaine_dealing_net )
"cocaine_dealing_net"
