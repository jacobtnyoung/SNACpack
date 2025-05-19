#' WOPINS Trust Network (Site 1, Good Behavior Unit)
#'
#' A one-mode directed network of 131 individuals represented as a `network` object.
#'
#' The network...
#'
#' @references
#' Young, J. T. N., & Haynie, D. L. (2020). Trusting the untrustworthy: The social organization of trust among incarcerated women. *Justice Quarterly*, 39(3), 553–584.
#' \url{https://doi.org/10.1080/07418825.2020.1807588}
#'
#' @format An `network` object with 131 nodes and 515 edges.
#'
#' @details
#' Vertex attributes:
#' - `age`: Age of individual in years
#' - `race`: Race/Ethnicity of individual (1 = white, 2 = African American, 3 = Hispanic)
#' - `time_in_prison`: Number of years individual has been incarcerated
#' - `white`: Binary variable indicating whether the woman is white (1 = white, = 0 non-white)
#'
#' @examples
#' data( wopins_s1gb_trust_net )
#' sna::gplot( wopins_s1gb_trust_net )
"wopins_s1gb_trust_net"
