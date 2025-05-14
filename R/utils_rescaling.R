# ==============================================================================
# Utility Functions for Rescaling and Normalization
# ==============================================================================

#' Rescale Numeric Values for a Vertex Attribute to a New Range for Plotting
#'
#' @param x A numeric vector.
#' @param low Minimum of target range.
#' @param high Maximum of target range.
#' @return Rescaled numeric vector.
#' @export
vertex_rescale <- function( x, low, high ) {
  min_x <- min( x )
  max_x <- max( x )
  ( ( high - low ) * ( x - min_x ) ) / ( max_x - min_x ) + low
}


# ==============================================================================

#' Rescale Numeric Matrix for Plotting Edge Width
#'
#' @param uni_mat A matrix of weights to use for edge widths.
#' @param low Minimum of target range.
#' @param high Maximum of target range.
#' @return Rescaled numeric matrix.
#' @export
edge_rescale <- function( uni_mat, low, high ){
  diag( uni_mat ) <- 0
  min_w <- min( uni_mat[uni_mat != 0] )
  max_w <- max( uni_mat[uni_mat != 0] )
  rscl <- ( ( high-low )  * ( uni_mat[uni_mat != 0] - min_w ) ) / ( max_w - min_w ) + low
  rscl
}


# ==============================================================================

#' Rescale Numeric Matrix for an Edge Attribute to a New Range for Plotting
#'
#' @param uni_mat A matrix of weights to use for edge shading, where higher
#' values represent darker edges.
#' @return Rescaled numeric matrix.
#' @export
edge_shade <- function( uni_mat ){
  net_edges <- edge.rescale( uni_mat, 0.01, 1 )
  vec_to_color <- as.vector( abs( net_edges ) )
  vec_to_color <- 1 - vec_to_color # subtract 1 to flip the grey function scale
  edge_cols <- grey( vec_to_color )
  return( edge_cols )
}




















