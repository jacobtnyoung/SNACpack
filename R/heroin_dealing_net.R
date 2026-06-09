#' Heroin Dealing Network
#'
#' A one-mode directed network of 38 individuals represented as a `network` object.
#'
#' The network comes from an investigation into to a large heroin trafficking organization in New York City.
#' The ties are communications through police wiretaps and represented as directed binary relations.
#'
#' @references
#' Natarajan, M. (2006). Understanding the structure of a large heroin distribution network:
#' A quantitative analysis of qualitative data. *Journal of Quantitative Criminology*, 22(2), 171–192.
#' \url{https://doi.org/10.1007/s10940-006-9007-x}
#'
#' @format An `network` object with 38 nodes and 1168 edges.
#'
#' @details
#' Vertex attributes:
#' - `vertex.names`: Name of individual
#'
#' @source Data retrieved from \url{https://sites.google.com/site/ucinetsoftware/datasets/covert-networks/cocaine-dealing-natarajan}
#'
#' @examples
#' sna::gplot( heroin_dealing_net )
"heroin_dealing_net"
