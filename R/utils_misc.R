# ==============================================================================
# Misc Utility Functions
# ==============================================================================


# ==============================================================================

#' Roster Data to Adjacency Matrix
#'
#' Takes data in roster format and creates an adjacency matrix.
#'
#' @param input_dat an object where the first column is a set of ids
#' and the subsequent columns are roster nominations.
#' @return An adjacency matrix of class \code{matrix}.
#' @export
roster_to_adjacency <- function( input_dat ) {
  y <- input_dat[, names( input_dat )]
  ids <- y[, 1]  # the first column is the IDs
  sid <- sort( unique( ids ) )  # sort unique IDs
  x <- matrix( 0, ncol = length( sid ), nrow = length( sid ) )  # initialize adjacency matrix
  id <- match( ids, sid )

  # Dynamically select the nomination columns (everything after the first column)
  nominations <- y[, -1]
  # Match all nominations to their indices in sid
  matched_nominations <- apply( nominations, 2, function( col ) match( col, sid ) )

  # Loop over rows to populate the adjacency matrix
  for ( i in seq_len( nrow( y ) ) ) {
    for ( j in seq_len( ncol( matched_nominations ) ) ) {
      friend_idx <- matched_nominations[i, j]
      if ( !is.na(friend_idx ) ) {
        x[id[i], friend_idx] <- 1
      }
    }
  }

  dimnames( x ) <- list( sid, sid )
  return( as.matrix( x ) )
}


# ==============================================================================

#' Add Pie Charts to Network Plot
#'
#' Adds pie charts over nodes in a network plot to visualize node attributes.
#'
#' @param x A network object or adjacency matrix.
#' @param p A matrix of proportions for each slice (rows = slices, columns = nodes).
#' @param sf Vertex scaling factor.
#' @param coord A matrix of x and y coordinates for the nodes.
#' @param cols A vector or matrix of colors for the pie slices.
#' @param r Optional radius for each pie chart (default is \code{sf/10}).
#' @param pielabel Optional list of arguments for \code{pie.labels()}.
#' @param ... Additional arguments passed to \code{gplot()}.
#' @return A network plot with pie charts added to nodes.
#' @export
#' @import sna network plotrix
add_pie <- function( x, p, sf, coord, cols, r = NULL, pielabel = NULL, ... ) {
  x <- sna::as.sociomatrix( x )
  dp <- dim( p )

  if ( any( is.na( p ) ) ) p[is.na( p )] <- 0
  if ( any( p == 0 ) ) {
    p.na <- which( p == 0, arr.ind = TRUE )
    p[p == 0] <- 1e-5
  }

  p <- prop.table(p, 2)
  if (is.null(r)) r <- sf / 10

  sna::gplot(x, vertex.cex = sf, coord = coord, interactive = FALSE, ...)

  bisect.angles <- vector("list", dp[2])

  for (i in 1:dp[2]) {
    pie_data <- p[, i]
    pie_radius <- ifelse(length(r) > 1, r[i], r)
    pie_col <- if (is.matrix(cols)) cols[, i] else cols
    bisect.angles[[i]] <- plotrix::floating.pie(coord[i, 1], coord[i, 2], pie_data,
                                                edges = 500, radius = pie_radius, col = pie_col)
  }

  if (!is.null(pielabel)) {
    thelabs <- pielabel$labels
    for (i in 1:dp[2]) {
      if (exists("p.na") && i %in% p.na[, 2]) {
        tmp.lab <- thelabs
        tmp.lab[p.na[p.na[, 2] == i, 1]] <- ""
        pielabel$labels <- tmp.lab
      }

      pielabel$x <- coord[i, 1]
      pielabel$y <- coord[i, 2]
      pielabel$angles <- bisect.angles[[i]]
      do.call(plotrix::pie.labels, pielabel)
      pielabel$labels <- thelabs
    }
  }
}













