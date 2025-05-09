#' Mafia Calls Network
#'
#' A one-mode, undirected, binary network of individuals and phone calls represented as a `network` object.
#'
#' The network represents phone calls among members of the Sicilian Mafia in the first decade of
#' the 2000s.
#'
#' @references
#' Cavallaro, L., Ficara, A., De Meo, P., Fiumara, G., Catanese, S., et al. (2020). Disrupting resilient criminal networks through data analysis: The case of Sicilian Mafia. *PLOS ONE*, 15(8), e0236476.
#' \url{https://doi.org/10.1371/journal.pone.0236476}
#'
#' @format An `network` object with 98 nodes and 123 edges.
#'
#' @details
#' Vertex attributes:
#' - `vertex.names`: Names
#'
#' @source Data retrieved from \url{https://github.com/lcucav/criminal-nets/blob/master/dataset/Montagna_phonecalls_edgelist.csv}
#'
#' @examples
#' data( mafia_calls_net )
#' sna::gplot( mafia_calls_net, gmode = "graph" )
"mafia_calls_net"
