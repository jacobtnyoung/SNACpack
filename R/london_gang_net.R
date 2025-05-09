#' London Gang Network
#'
#' A one-mode network of 54 individuals represented as a `network` object.
#'
#' The network comes from an investigation into to a large cocaine trafficking organization in New York City.
#' The ties are communications through police wiretaps and represented as directed binary relations.

#' The network represents co-offending among a London-based inner-city street gang, 2005-2009.
#' Data comes from anonymised police arrest and conviction data for all "confirmed" members of the gang.

#'
#' @references
#' Grund, T. and Densley, J. (2015). Ethnic homophily and triad closure: Mapping internal gang structure using exponential random graph models. *Journal of Contemporary Criminal Justice*, 31(3), 354–370.
#' \url{https://doi.org/10.1177/1043986215594291}
#'
#' @format An `network` object with 54 nodes and 315 edges.
#'
#' @details
#' Vertex attributes:
#' - `Age`: Age
#' - `Birthplace`: Birthplace (1 = West Africa, 2= Caribbean, 3= UK, 4= East Africa)
#' - `Residence`: Residence
#' - `Arrests`: Number of arrests
#' - `Convictions`: Number of convictions
#' - `Prison`: Been to prison
#' - `Music`: Type of music
#'
#' @source Data retrieved from \url{http://www.casos.cs.cmu.edu/tools/datasets/external/index.php}
#'
#' @examples
#' data( london_gang_net )
#' sna::gplot( london_gang_net )
"london_gang_net"
