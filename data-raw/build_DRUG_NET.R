# ------------------------------------------- #
# Build DRUG NET data files for SNACA R textbook.

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
mat_file <- here( "data-raw/DRUG_NET_data.csv" )


# create the network object
drug_net <- as.network(
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
# attach the attributes

# get the file
attr_file <- here( "data-raw/DRUG_NET_ATTR_data.csv" )


# read it in
attr_dat <- read.csv(
  attr_file,
    as.is = TRUE,
    header = TRUE,
    row.names = 1
  )


# recode values
attr_dat <- attr_dat |>
  mutate(
    ethnicity = case_when(
      Ethnicity == 2 ~ 2,
      Ethnicity == 3 ~ 3,
      Ethnicity %in% c(1, 5, 6, 7) ~ 1,
      TRUE ~ NA_real_
    ),
    male = case_when(
      Gender %in% c(0, 1) ~ 1,
      Gender == 2 ~ 0,
      TRUE ~ NA_real_
    )
  )


# keep the recoded columns
attr_dat <- attr_dat |>
  select( male, ethnicity )


# create the names for the loop
names_loop <- names( attr_dat )


# loop through and add the attributes
for( i in 1: length( names_loop ) ){
  drug_net %v% names_loop[i] <- attr_dat[, i ]
}



# ----
# save the object as an .rda object to the data folder for use in the package

save( drug_net, file = "data/drug_net.rda" )
