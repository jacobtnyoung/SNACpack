# ------------------------------------------- #
# Build LONDON data files for SNACA R textbook.

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
mat_file <- here( "data-raw/LONDON_GANG_data.csv" )


# create the network object
london_gang_net <- as.network(
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


# create the matrix object
mat <- as.matrix(
  read.csv(
    mat_file,
    as.is = TRUE,
    header = TRUE,
    row.names = 1
  )
)


# ----
# attach the attributes

# get the file
attr_file <- here( "data-raw/LONDON_GANG_ATTR_data.csv" )


# read it in
attr_dat <- read.csv(
  attr_file,
    as.is = TRUE,
    header = TRUE,
    row.names = 1
  )


# create the names for the loop
names_loop <- names( attr_dat )


# loop through and add the attributes
for( i in 1: length( names_loop ) ){
  london_gang_net %v% names_loop[i] <- as.numeric( attr_dat[, i ] )
}


# ----
# save the object as an .rda object to the data folder for use in the package

save( london_gang_net, file = "data/london_gang_net.rda" )
