#' PINS Get Along With Network (Wave 2)
#'
#' A one-mode directed network of 73 individuals represented as a `network` object.
#'
#' The network...
#'
#' @references
#' Kreager, D. A., Young, J. T. N., Haynie, D. L., Bouchard, M., Schaefer, D. R., & Zajac, G. (2017).
#' Where “old heads” prevail: Inmate hierarchy in a men’s prison unit. *American Sociological Review*, 82(4), 685–718.
#' \url{https://doi.org/10.1177/0003122417710462}
#'
#' @format An `network` object with 73 nodes and 186 edges.
#'
#' @details
#' Vertex attributes:
#' - `depression_w1`: Depression score in wave 1.
#' - `depression_w2`: Depression score in wave 2.
#' - `race`: Race/Ethnicity of individual (1 = white, 2 = African American, 3 = Hispanic)
#' - `smoker_w1`: Binary measure of whether the individual was a smoker in wave 1.
#' - `smoker_w2`: Binary measure of whether the individual was a smoker in wave 2.
#' - `social_distance_w1`: Measure of self-perceived social distance in wave 1.
#' - `social_distance_w2`: Measure of self-perceived social distance in wave 2.
#'
#' @examples
#' data( pins_ga_w2_net )
#' sna::gplot( pins_ga_w2_net )
"pins_ga_w2_net"
