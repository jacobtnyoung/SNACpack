# ------------------------------------------- #
# Build PAUL REVERE data files for SNACpack

# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory


# ----
# load the data

# pull the file
mat_file <- here( "data-raw/PAUL_REVERE_data.csv" )


# create the matrix object
mat <- as.matrix(
  read.csv(
    mat_file,
    as.is = TRUE,
    header = TRUE,
    row.names = 1
  )
)


# create the network object
paul_revere_net <- as.network(
  mat,
  bipartite = dim( mat )[1]
)


# ----
# Clean up the names

# reverse the order of the names
first_names <- sub( ".*\\.", "", network.vertex.names( paul_revere_net )[1: dim( mat )[1]] )
last_names  <- sub( "\\..*", "", network.vertex.names( paul_revere_net )[1: dim( mat )[1]] )
actor_names <- paste0( first_names, sep = " ", last_names )

# create a set of names that is just the individuals
paul_revere_net %v% "people_names" <- c( actor_names, rep( NA, dim( mat )[2] ) )

# create a set of places names
paul_revere_net %v% "place_names" <- c( rep( NA, dim( mat )[1] ), network.vertex.names( paul_revere_net )[ -c( 1: dim( mat )[1] ) ] )

# assign as an attribute
paul_revere_net %v% "names" <- c( actor_names, network.vertex.names( paul_revere_net )[ -c( 1:dim( mat )[1] ) ] )


# ----
# save the object as an .rda object to the data folder for use in the package

save( paul_revere_net, file = "data/paul_revere_net.rda" )
