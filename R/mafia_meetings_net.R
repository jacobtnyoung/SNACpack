#' Mafia Meetings Network
#'
#' A one-mode, undirected, binary network of meetings among individuals represented as a `network` object.
#'
#' The network represents meetings among members of the Sicilian Mafia in the first decade of
#' the 2000s.
#'
#' @references
#' Cavallaro, L., Ficara, A., De Meo, P., Fiumara, G., Catanese, S., et al. (2020). Disrupting resilient criminal networks through data analysis: The case of Sicilian Mafia. *PLOS ONE*, 15(8), e0236476.
#' \url{https://doi.org/10.1371/journal.pone.0236476}
#'
#' @format An `network` object with 101 nodes and 255 edges.
#'
#' @details
#' Vertex attributes:
#' - `vertex.names`: Names
#'
#' @source Data retrieved from \url{https://github.com/lcucav/criminal-nets/blob/master/dataset/Montagna_meetings_edgelist.csv}
#'
#' @examples
#' data( mafia_meetings_net )
#' sna::gplot( mafia_meetings_net, gmode = "graph" )
"mafia_meetings_net"
