#' Phoenix 2024 Arrest Network
#'
#' A mode network of individuals arrested and events represented as a `network` object.
#'
#' @references
#' Phoenix Open Data Portal
#' \url{https://www.phoenixopendata.com/dataset/arrests}
#'
#' @format A `network` object with 3,052 nodes (2,029 individuals and 1,023 events) and 3,314 edges.
#'
#' @details
#' Vertex attributes:
#' - `subject_sex`: Sex (Male or Female) of person arrested.
#' - `officer_sex`: Sex (Male or Female) of arresting officer.
#' - `subject_race_ethnicity`: Race/Ethnicity of person arrested.
#' - `officer_race_ethnicity`: Race/Ethnicity of arresting officer.
#'
#' @examples
#' data( phx_arrest_2024_net )
"phx_arrest_2024_net"
