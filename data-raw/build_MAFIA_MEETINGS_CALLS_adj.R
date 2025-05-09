# ------------------------------------------- #
# Build MAFIA data files for SNACpack

# This file builds the MEETINGS and CALLS networks


# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory


# ----
# Build the function to create the networks

build.net <- function( file_loc ){

  # load the file
  edges <- as.matrix(
    read.csv(
      file_loc,
      as.is = TRUE
    )
  )

  # sort the edges
  edges <- edges[ order( edges[,1] ), ]

  # coerce to characters
  edges[,1] <- as.character( edges[,1] )

  # create the network object from the edgelist
  net_created <- as.network(
    edges[,c( 1,2 )],
    matrix.type = "edgelist",
    directed = FALSE
  )

  # return the object
  return( net_created )

}

# ----
# load the data and build each network

# create the meetings network
mafia_meetings_net <- build.net( "data-raw/MAFIA_MEETINGS_data.csv" )

# create the phone calls network
mafia_calls_net <- build.net( "data-raw/MAFIA_CALLS_data.csv" )


# ----
# save the objects as an .rda object to the data folder for use in the package

save( mafia_meetings_net, file = "data/mafia_meetings_net.rda" )
save( mafia_calls_net, file = "data/mafia_calls_net.rda" )
