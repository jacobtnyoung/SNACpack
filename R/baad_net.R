#' Big Allied And Dangerous (BAAD) Network
#'
#' A two-mode network of terrorist organizations and locations of terrorist events as a `network` object.
#'
#' The Big Allied And Dangerous (BAAD) network contains active terrorist organizations (meaning they perpetrated at least one attack) between 1998-2005.
#'
#' @references
#' Asal, V. H., & Rethemeyer, R. K. (2008). *The nature of the beast:
#' Terrorist organizational characteristics and organizational lethality*.
#' The Journal of Politics, 70(2), 437--449.
#' {https://doi.org/10.1017/S0022381608080419}.
#'
#' @format A `network` object with 459 nodes (394 organizations and events in 65 countries) and 394 edges.
#'
#' @details
#' Vertex attributes:
#' - `deaths`: Number of fatalities attributable to organization from 1998-2005
#' - `org_age`: Number of years organization has been active
#' - `state_sponsored`: Whether the organization is state sponsored
#' - `vertex.names`: Name of organizations and locations of events
#'
#' @examples
#' sna::gplot(baad_net, gmode = "twomode" )
"baad_net"
