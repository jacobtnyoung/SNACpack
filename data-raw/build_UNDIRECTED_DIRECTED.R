# ------------------------------------------- #
# Build UNDIRECTED and DIRECTED data file for SNACpack

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
mat_file <- here( "data-raw/UNDIRECTED_EXAMPLE_data.csv" )


# create the network object
undirected_example_net <- as.network(
  as.matrix(
    read.csv(
      mat_file,
      as.is = TRUE,
      header = TRUE,
      row.names = 1
      )
    ),
  directed = FALSE
  )


# pull the file
mat_file <- here( "data-raw/DIRECTED_EXAMPLE_data.csv" )


# create the network object
directed_example_net <- as.network(
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
# save the objects as an .rda object to the data folder for use in the package

save( undirected_example_net, file = "data/undirected_example_net.rda" )
save( directed_example_net, file = "data/directed_example_net.rda" )
