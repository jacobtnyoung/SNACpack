#' PINS Information Network
#'
#' A one-mode directed network of 205 individuals represented as a `network` object.
#'
#' The network...
#'
#' @references
#' Kreager, D. A., Young, J. T. N., Haynie, D. L., Bouchard, M., Schaefer, D. R., & Zajac, G. (2017).
#' Where “old heads” prevail: Inmate hierarchy in a men’s prison unit. *American Sociological Review*, 82(4), 685–718.
#' \url{https://doi.org/10.1177/0003122417710462}
#'
#' @format An `network` object with 205 nodes and 174 edges.
#'
#' @details
#' Vertex attributes:
#' - `age`: Age of individual in years
#' - `race`: Race/Ethnicity of individual (1 = white, 2 = African American, 3 = Hispanic)
#' - `time_in_prison`: Number of years individual has been incarcerated
#'
#' @examples
#' data( pins_if_net )
#' sna::gplot( pins_if_net )
"pins_if_net"
