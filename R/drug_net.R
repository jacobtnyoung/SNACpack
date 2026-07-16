#' Drug Use Network
#'
#' A one-mode undirected network of 293 individuals represented as a `network` object.
#'
#' The network is a result of two years of ethnographic observations of people's drug habits.
#' The ties represent acquaintances.
#'
#' @references
#' Weeks, M. R., Clair, S., Borgatti, S. P., Radda, K., & Schensul, J. J. (2002).
#' Social networks of drug users in high-risk sites: Finding the connections.
#' *AIDS and Behavior*, 6(2), 193–206.
#' \url{https://doi.org/10.1023/A:1015457400897}.
#'
#' @format An `network` object with 293 nodes and 284 edges.
#'
#' @details
#' Vertex attributes:
#' - `vertex.names`: Name of individual
#' - `ethnicity`: Ethnicity of the individual where "1" is White, "2" is African American, and "3" is Hispanic
#' - `male`: Sex of the individual where "1" is Male and "0" is Female
#'
#' @source Data retrieved from \url{https://sites.google.com/site/ucinetsoftware/datasets/covert-networks/drugnet}
#'
#' @examples
#' sna::gplot( drug_net )
"drug_net"
