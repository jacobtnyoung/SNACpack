# ------------------------------------------- #
# Build PIRA NET data for SNACpack

# ----
# Setup

# clear the workspace
rm( list=ls() )


# set the libraries to use
library( network ) # for working with the network object
library( here )    # set the directory
library( dplyr )   # for wrangling


# ----
# load the data

# pull the file
mat_file <- here( "data-raw/PIRA_NET_data.csv" )


# create the network object
pira_net <- as.network(
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



# ----
# attach the attributes

# get the file
attr_file <- here( "data-raw/PIRA_NET_ATTR_data.csv" )


# read it in
attr_dat <- read.csv(
  attr_file,
    as.is = TRUE,
    header = TRUE,
    row.names = 1
  )


# recode values
attr_dat <- attr_dat |>

  rename(
    attend_uni = University,
    bomb_maker = Period1IED_C,
    bomb_planter = Period1IED_P,
    gunman = Period1Gun
  ) |>

  mutate(
    male = if_else( Gender == 0, 1, 0, missing = NA_real_ ),

    married = case_when(
      Marital.Status == 99999 ~ 0,
      TRUE ~ Marital.Status
    ),

    brigade = case_when(
        Antrim.Brigade == 1 ~ "Antrim",
        Derry.Brigade == 1 ~ "Derry",
        Armagh.Brigade == 1 ~ "Armagh",
        Down.Brigade == 1 ~ "Down",
        Tyrone.Brigade == 1 ~ "Tyrone",
        TRUE ~ "None"
        )
  )


# keep the recoded columns
attr_dat <- attr_dat |>
  select( attend_uni, bomb_maker, bomb_planter, gunman, male, married, brigade )

# create the names for the loop
names_loop <- names( attr_dat )

# loop through and add the attributes
for( i in 1: length( names_loop ) ){
  pira_net %v% names_loop[i] <- attr_dat[, i ]
}


# ----
# save the object as an .rda object to the data folder for use in the package

save( pira_net, file = "data/pira_net.rda" )
