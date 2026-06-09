# ------------------------------------------- #
# Build HEROIN DEALING data files for SNACpack

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
mat_file <- here( "data-raw/HEROIN_DEALING_data.csv" )


# create the network object
heroin_dealing_net <- as.network(
  as.matrix(
    read.csv(
      mat_file,
      as.is = TRUE,
      header = TRUE,
      row.names = 1
      )
    ),
  directed = TRUE
  )


# ----
# save the object as an .rda object to the data folder for use in the package

save( heroin_dealing_net, file = "data/heroin_dealing_net.rda" )
