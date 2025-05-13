#' Paul Revere Conspiracy Network
#'
#' A two-mode network of individuals and locations represented as a `network` object.
#'
#' The Paul Revere conspiracy dataset concerns relationships between people and their
#' affiliations with different organizations in Boston. The dataset refers to Paul Revere,
#' who was responsible for organizing a local militia of Boston's revolutionary
#' movement (see http://en.wikipedia.org/wiki/Sons_of_Liberty). The dataset was analysed
#' by Kieran Healy of Duke University. This dataset has been reconstructed by looking
#' at the information presented in the appendix of the book "Paul Revere's Ride"
#' published by David Fischer (1994).
#'
#' @references
#' Fischer, D. (1994). "Paul Revere's Ride", Oxford University Press.
#' \url{http://www.casos.cs.cmu.edu/tools/datasets/external/paulrevere/}
#'
#' @format A `network` object with 261 nodes (254 individuals and 7 events) and 334 edges.
#'
#' @details
#' Vertex attributes:
#' - `names`: Name of individuals and locations
#'
#' @examples
#' data( paul_revere_net )
"paul_revere_net"
