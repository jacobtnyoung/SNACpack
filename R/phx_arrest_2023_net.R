#' Phoenix 2023 Arrest Network
#'
#' A mode network of individuals arrested and events represented as a `network` object.
#'
#' @references
#' Phoenix Open Data Portal
#' \url{https://www.phoenixopendata.com/dataset/arrests}
#'
#' @format A `network` object with 3,166 nodes (2,156 individuals and 1,010 events) and 3,490 edges.
#'
#' @details
#' Vertex attributes:
#' - `subject_sex`: Sex (Male or Female) of person arrested.
#' - `officer_sex`: Sex (Male or Female) of arresting officer.
#' - `subject_race_ethnicity`: Race/Ethnicity of person arrested.
#' - `officer_race_ethnicity`: Race/Ethnicity of arresting officer.
#'
#' @examples
#' data( phx_arrest_2023_net )
"phx_arrest_2023_net"
