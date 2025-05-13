# ------------------------------------------- #
# Build PHILIPPINE KIDNAPPINGS data files for SNACpack

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
mat_file <- here( "data-raw/PHILIPPINE_KIDNAPPINGS_data.csv" )


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
philippine_kidnappings_net <- as.network(
  mat,
  bipartite = dim( mat )[1]
)



# ----
# save the object as an .rda object to the data folder for use in the package

save( philippine_kidnappings_net, file = "data/philippine_kidnappings_net.rda" )
