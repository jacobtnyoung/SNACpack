# ------------------------------------------- #
# Build PHX ARREST data files for SNACpack

# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory
library( here )    # for accessing local directory
library( dplyr )   # for working with the data
library( network ) # for building the networks
library( sna )     # for working with the network data


# ----
# Download the data from the portal

url <- paste(
  "https://www.phoenixopendata.com/dataset/6f58a024-6fc2-4405-9306-15f2021c3c06/resource/",
  "1eaee7f1-ccd0-4057-af55-e5749a934258/download/arrests_adult-arrests-details_arrestdetail.csv",
  sep = ""
)

dat <- read.csv(
  url,
  as.is = TRUE,
  header = TRUE
)


# ----
# clean data and restructure for creating networks

dat_edgelist <- dat %>%
  select(
    SUBJ_AGE, YEAR,
    UNIQUE_NAME_ID, ARST_OFFICER, HUNDREDBLOCKADDR ) %>%  # keep the variables you need
  group_by( HUNDREDBLOCKADDR, ARST_OFFICER ) %>%                      # group by address then officer id
  filter( n() > 1 ) %>%                                               # only keep cases that involve more than 1 person arrested
  arrange( ARST_OFFICER ) %>%                                         # arrange by arresting officer
  mutate( incident_id = cur_group_id() ) %>%                          # create unique id for event
  ungroup() %>%                                                       # un-group the data
  group_by( UNIQUE_NAME_ID ) %>%                                      # group by unique person id
  mutate( person_id = cur_group_id() ) %>%                            # create a unique person id that is numeric
  ungroup()

dat_edgelist <- dat_edgelist %>%
  mutate( actor = paste0( "a.", dat_edgelist$person_id ) ) %>%                 # change to character
  mutate( event = paste0( "p.", dat_edgelist$incident_id ) )                   # change to character


# create the networks for each year ----

# check the years
table( dat_edgelist$YEAR )

# write the function
year.network <- function( edgelist, year ) {

  # take the year you want
  dat_edgelist_year <- edgelist %>%
    select( YEAR, actor, event ) %>%                                            # keep the year, person, and incident id for the edgelist
    arrange( YEAR ) %>%                                                         # arrange by year
    filter( YEAR == year ) %>%                                                  # keep based on year
    select( actor, event ) %>%                                                  # keep the incident and person id for the edgelist
    arrange( actor, event )                                                     # arrange by incident then person id

  # clean up duplicates from the edges
  table( duplicated( dat_edgelist_year ) )                                      # check duplicate entries
  dat_edgelist_year <- dat_edgelist_year[ !duplicated( dat_edgelist_year ), ]   # remove the duplicate entries

  # build the edgelist
  mat_edgelist_year <- cbind(
    as.character( dat_edgelist_year$actor ),
    as.character( dat_edgelist_year$event )
  )

  # create the network
  net_year <- as.network(
    mat_edgelist_year,
    bipartite=length( unique( mat_edgelist_year[,1] ) ),
    matrix.type="edgelist"
  )

  # identify the first component and create an index
  one_mode_mat <- as.matrix( net_year ) %*% t( as.matrix( net_year ) )                 # create the projection
  cd <- component.dist( as.matrix( one_mode_mat ) )                                  # find the component membership
  max( cd$csize )                                                               # find largest size
  sort( table( cd$membership ), decreasing = TRUE )[1]                          # find which component is the largest

  # create the data object
  in_first_component <- data.frame(
    ids = rownames( one_mode_mat ),
    main_component = cd$membership
  )

  # create the ids to match on
  ids <-in_first_component$ids[ in_first_component$main_component == as.numeric( names( sort( table( cd$membership ), decreasing = TRUE )[1] ) ) ]

  # take those edges in the main component
  mat_edgelist_year_reduced <- mat_edgelist_year[mat_edgelist_year[,1] %in% ids,]

  # create the new network based on the reduced edgelist
  net_year_reduced <- as.network(
    mat_edgelist_year_reduced,
    bipartite=length( unique( mat_edgelist_year_reduced[,1] ) ),
    matrix.type="edgelist"
  )

  # plot it to see it
  gplot( net_year_reduced, gmode = "twomode", usearrows = FALSE )

  # function returns an object of class network
  return( net_year_reduced )

}


# ----
# execute the function for each year

phx_arrest_2023_net <- year.network( edgelist = dat_edgelist, year = 2023 )
phx_arrest_2024_net <- year.network( edgelist = dat_edgelist, year = 2024 )


# ----
# save the object as an .rda object to the data folder for use in the package

save( phx_arrest_2023_net, file = "data/phx_arrest_2023_net.rda" )
save( phx_arrest_2024_net, file = "data/phx_arrest_2024_net.rda" )
