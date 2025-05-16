# ==============================================================================
# Utility Functions for Rescaling and Normalization
# ==============================================================================

#' Rescale Numeric Values for a Vertex Attribute to a New Range for Plotting
#'
#' This function takes a vector of values that need to be rescaled for a plot.
#' If the vector is a constant, it will return an error indicating that there
#' is not a need to rescale the vector.
#'
#' @param x A numeric vector.
#' @param low Minimum of target range.
#' @param high Maximum of target range.
#' @return Rescaled numeric vector.
#' @export
vertex_rescale <- function( x, low, high ) {

  # check to see if there is the object to be rescaled is a constant
  if( var( x ) == 0 ){
    stop( "Error: You have tried to rescale an object that is a constant.
          But don't worry! Just select a value for the vertex size (i.e. no need to rescale)."
    )
  }

  # rescale the values based in the min and max that are passed
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




















