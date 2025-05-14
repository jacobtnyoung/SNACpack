# SNACpack

## *Social Network Analysis for Crime (Analysts) Package*

<br>

**SNACpack** is a package developed for crime analysts and criminologists conducting social network analysis (SNA).  
It includes datasets and helper functions used in the [*Social Network Analysis*]() course in the [Master of Science in Crime Analysis](https://ccj.asu.edu/degree-programs/ms-crime-analysis) 
program and the [*Statistical Analysis of Network Data (SAND)*](https://jacobtnyoung.github.io/SAND/) 
course for the [Criminology and Criminal Justice, PhD](https://ccj.asu.edu/content/criminology-and-criminal-justice-phd). Both
courses are taught in the [School of Criminology and Criminal Justice](https://ccj.asu.edu) at [Arizona State University](https://www.asu.edu).

<br>

---

## Installation

To install SNACpack from GitHub:

```r
# install devtools (if not already installed)
install.packages( "devtools" )  

# install the package from the Github repository
devtools::install_github( "jacobtnyoung/SNACpack" )
```

---

## Example Usage

```r

# the data are objects of class network, so you need the network package
install.packages( "network" )
library( network )

# load the library for SNACpack
library( SNACpack )

# take a look at the cocaine dealing network
data( "cocaine_dealing_net" )

# print it out to see the features
cocaine_dealing_net

```










