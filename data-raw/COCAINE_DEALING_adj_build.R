# ------------------------------------------- #
# Build COCAIN DEALING data files for SNACpack

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
mat_file <- here( "data-raw/COCAINE_DEALING_data.csv" )


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
cocaine_dealing_net <- as.network(
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

save( cocaine_dealing_net, file = "data/cocaine_dealing_net.rda" )
