# ------------------------------------------- #
# Build PINS data files for SNACpack

# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory
library( sna )     # for the subgraph induction for W2


# ----
# load the data

# pull the file
load( here( "data-raw/PINS_W1_NETWORKS.RData" ) )
load( here( "data-raw/PINS_W2_NETWORKS.RData" ) )


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

pins_ga_net <- rebuild_network(
  get.along.norank.net,
  old_attrs = c( "Age", "Race", "Time.In" ),
  new_attrs = c("age", "race", "time_in_prison")
)

pins_pi_net <- rebuild_network(
  powerinfluence.net,
  old_attrs = c( "Age", "Race", "Time.In" ),
  new_attrs = c("age", "race", "time_in_prison")
)

pins_if_net <- rebuild_network(
  information.net,
  old_attrs = c( "Age", "Race", "Time.In" ),
  new_attrs = c("age", "race", "time_in_prison")
)


# ----
# build the networks for the panel data

# take those in both waves (it makes it easier for analysis)
ga_temp_w1 <- get.inducedSubgraph(
  get.along.norank.net.w1,
  v = which( get.along.norank.net.w1 %v% "in.survey.w1" == TRUE
             & get.along.norank.net.w1 %v% "in.survey.w2" == TRUE
             )
  )
ga_temp_w2 <- get.inducedSubgraph(
  get.along.norank.net.w2,
  v = which( get.along.norank.net.w2 %v% "in.survey.w1" == TRUE
             & get.along.norank.net.w2 %v% "in.survey.w2" == TRUE
  )
)

# now build the files
pins_ga_w1_net <- rebuild_network(
  ga_temp_w1,
  old_attrs = c( "race", "social.distance.w1", "social.distance.w2", "depression.w1", "depression.w2", "smoker.w1", "smoker.w2" ),
  new_attrs = c( "race", "social.distance_w1", "social.distance_w2", "depression_w1", "depression_w2", "smoker_w1", "smoker_w2" )
)

pins_ga_w2_net <- rebuild_network(
  ga_temp_w2,
  old_attrs = c( "race", "social.distance.w1", "social.distance.w2", "depression.w1", "depression.w2", "smoker.w1", "smoker.w2" ),
  new_attrs = c( "race", "social_distance_w1", "social_distance_w2", "depression_w1", "depression_w2", "smoker_w1", "smoker_w2" )
)


# ----
# save the object as an .rda object to the data folder for use in the package

save( pins_ga_net, file = "data/pins_ga_net.rda" )
save( pins_pi_net, file = "data/pins_pi_net.rda" )
save( pins_if_net, file = "data/pins_if_net.rda" )

save( pins_ga_w1_net, file = "data/pins_ga_w1_net.rda" )
save( pins_ga_w2_net, file = "data/pins_ga_w2_net.rda" )
