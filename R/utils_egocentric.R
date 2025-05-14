# ==============================================================================
# Egocentric Network Utility Functions
# ==============================================================================

#' Egocentric Mean (Send Network)
#'
#' Calculates the mean value of a variable among the alters each ego nominates.
#'
#' @param adj A square adjacency matrix.
#' @param var A numeric vector of attribute values for each node.
#'
#' @return A numeric vector of egocentric means for each ego.
#' @export
egomean_s <- function(adj, var) {
  weight <- t(var * t(adj))
  mean_var_s <- rep(0, length.out = length(var))
  for (i in seq_along(mean_var_s)) {
    mean_var_s[i] <- mean(weight[i, adj[i, ] != 0], na.rm = TRUE)
  }
  return(mean_var_s)
}

#' Egocentric Mean (Receive Network)
#'
#' Calculates the mean value of a variable among the alters who nominate each ego.
#'
#' @inheritParams egomean_s
#'
#' @return A numeric vector of egocentric means for each ego.
#' @export
egomean_r <- function(adj, var) {
  weight <- t(var * t(adj))
  mean_var_r <- rep(0, length.out = length(var))
  for (i in seq_along(mean_var_r)) {
    mean_var_r[i] <- mean(weight[i, adj[, i] != 0], na.rm = TRUE)
  }
  return(mean_var_r)
}

#' Egocentric Mean (Send and Receive Intersection)
#'
#' Calculates the mean value of a variable among alters who both send to and receive from each ego.
#'
#' @inheritParams egomean_s
#'
#' @return A numeric vector of egocentric means for each ego (NaN if no intersection).
#' @export
egomean_sr <- function(adj, var) {
  weight <- t(var * t(adj))
  mean_var_sr <- rep(0, length.out = length(var))
  for (i in seq_along(mean_var_sr)) {
    mean_var_sr[i] <- mean(intersect(weight[i, adj[, i] != 0], weight[i, adj[i, ] != 0]))
  }
  return(mean_var_sr)
}

#' Egocentric SD (Send Network)
#'
#' Calculates the standard deviation of a variable among alters each ego nominates.
#'
#' @inheritParams egomean_s
#'
#' @return A numeric vector of egocentric standard deviations for each ego.
#' @export
egosd_s <- function(adj, var) {
  weight <- t(var * t(adj))
  sd_var_s <- rep(0, length.out = length(var))
  for (i in seq_along(sd_var_s)) {
    sd_var_s[i] <- sd(weight[i, adj[i, ] != 0], na.rm = TRUE)
  }
  return(sd_var_s)
}

#' Egocentric SD (Receive Network)
#'
#' Calculates the standard deviation of a variable among alters who nominate each ego.
#'
#' @inheritParams egomean_s
#'
#' @return A numeric vector of egocentric standard deviations for each ego.
#' @export
egosd_r <- function(adj, var) {
  weight <- t(var * t(adj))
  sd_var_r <- rep(0, length.out = length(var))
  for (i in seq_along(sd_var_r)) {
    sd_var_r[i] <- sd(weight[i, adj[, i] != 0], na.rm = TRUE)
  }
  return(sd_var_r)
}

#' Egocentric SD (Send and Receive Intersection)
#'
#' Calculates the standard deviation of a variable among alters who both send to and receive from each ego.
#'
#' @inheritParams egomean_s
#'
#' @return A numeric vector of egocentric standard deviations for each ego (NaN if no intersection).
#' @export
egosd_sr <- function(adj, var) {
  weight <- t(var * t(adj))
  sd_var_sr <- rep(0, length.out = length(var))
  for (i in seq_along(sd_var_sr)) {
    sd_var_sr[i] <- sd(intersect(weight[i, adj[, i] != 0], weight[i, adj[i, ] != 0]))
  }
  return(sd_var_sr)
}
