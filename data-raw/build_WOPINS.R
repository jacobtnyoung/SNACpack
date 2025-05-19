# ------------------------------------------- #
# Build WOPINS data files for SNACpack

# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory


# ----
# load the data

# pull the files
load( here( "data-raw/WOPINS_S1_NETWORKS.RData" ) )
load( here( "data-raw/WOPINS_S2_NETWORKS.RData" ) )


# ----
# simplify the attributes that are available using a function
# to pull the attributes, then rebuild the network

rebuild_network <- function( net, old_attrs, new_attrs ) {
  if ( length( old_attrs ) != length( new_attrs ) ) {
    stop( "old_attrs and new_attrs must be the same length." )
  }

  # Extract attributes
  attr_values <- lapply( old_attrs, function( attr ) net %v% attr )

  # Rebuild the network structure
  new_net <- as.network( as.matrix( net ), directed = TRUE )

  # Assign attributes with new names
  for ( i in seq_along( new_attrs ) ) {
    new_net %v% new_attrs[i] <- attr_values[[i]]
  }

  return( new_net )
}


# ----
# build the new networks

wopins_s1gb_trust_net <- rebuild_network(
  SDD.net,
  old_attrs = c( "Age", "Race", "White", "YearsOnUnit" ),
  new_attrs = c("age", "race", "white", "time_in_prison")
)

wopins_s2gb_trust_net <- rebuild_network(
  SDD.gb.net,
  old_attrs = c( "Age", "Race", "White", "YearsOnUnit" ),
  new_attrs = c("age", "race", "white", "time_in_prison")
)

wopins_s2gp_trust_net <- rebuild_network(
  SDD.gp.net,
  old_attrs = c( "Age", "Race", "White", "YearsOnUnit" ),
  new_attrs = c("age", "race", "white", "time_in_prison")
)


# ----
# save the object as an .rda object to the data folder for use in the package

save( wopins_s1gb_trust_net, file = "data/wopins_s1gb_trust_net.rda" )
save( wopins_s2gb_trust_net, file = "data/wopins_s2gb_trust_net.rda" )
save( wopins_s2gp_trust_net, file = "data/wopins_s2gp_trust_net.rda" )
