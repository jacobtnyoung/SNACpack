# ------------------------------------------- #
# Build OFFICER EVENTs data files for SNACpack

# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory


# ----
# load the data

# pull the edgelist
edge_file <- here( "data-raw/OFFICER_EVENTS_data.csv" )


# create the edgelist
edgelist <- as.matrix(
  read.csv(
    edge_file,
    as.is=TRUE,
    header=TRUE
  )
)


# create the empty adjacency matrix
mat <- matrix(
  0,
  length( unique( edgelist[,1] ) ),
  length( unique( edgelist[,2] ) )
)


# name the rows and columns
rownames( mat ) <- unique( edgelist[,1] )
colnames( mat ) <- unique( edgelist[,2] )


# fill edgelist indexed edges with a 1
mat[edgelist] <- 1


# create the network object
officer_event_net <- as.network(
  mat,
  bipartite = length( unique( edgelist[,1] ) )
)


# ----
# save the object as an .rda object to the data folder for use in the package

save( officer_event_net, file = "data/officer_event_net.rda" )
