# ------------------------------------------- #
# Build BAAD data files for SNACpack

# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory
library( dplyr )   # for wrangling data

# ----
# load the data

# pull the file
mat_file <- here( "data-raw/BAAD_NET_data.csv" )


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
baad_net <- as.network(
  mat,
  bipartite = dim( mat )[1]
)


# ----
# attach the attributes

# get the file
attr_file <- here( "data-raw/BAAD_NET_ATTR_data.csv" )

# read it in
attr_dat <- read.csv(
  attr_file,
  as.is = TRUE,
  header = TRUE,
  row.names = 1
)

# clean attribute data
attr_dat <- attr_dat |>

  rename(
    state_sponsored = statespond,
    org_age = OrgAge,
    deaths = fatalities19982005
  )

# take variables you want
attr_dat <- attr_dat |>
  select( state_sponsored, org_age, deaths )

# append attributes
baad_net %v% "state_sponsored" <- c( attr_dat$state_sponsored, rep( NA, dim( mat )[2] ) )
baad_net %v% "org_age" <- c( attr_dat$org_age, rep( NA, dim( mat )[2] ) )
baad_net %v% "deaths" <- c( attr_dat$deaths, rep( NA, dim( mat )[2] ) )

# ----
# save the object as an .rda object to the data folder for use in the package

save( baad_net, file = "data/baad_net.rda" )
