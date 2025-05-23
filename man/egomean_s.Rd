% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils_egocentric.R
\name{egomean_s}
\alias{egomean_s}
\title{Egocentric Mean (Send Network)}
\usage{
egomean_s(adj, var)
}
\arguments{
\item{adj}{A square adjacency matrix.}

\item{var}{A numeric vector of attribute values for each node.}
}
\value{
A numeric vector of egocentric means for each ego.
}
\description{
Calculates the mean value of a variable among the alters each ego nominates.
}
