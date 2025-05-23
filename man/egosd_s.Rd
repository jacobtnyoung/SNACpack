% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils_egocentric.R
\name{egosd_s}
\alias{egosd_s}
\title{Egocentric SD (Send Network)}
\usage{
egosd_s(adj, var)
}
\arguments{
\item{adj}{A square adjacency matrix.}

\item{var}{A numeric vector of attribute values for each node.}
}
\value{
A numeric vector of egocentric standard deviations for each ego.
}
\description{
Calculates the standard deviation of a variable among alters each ego nominates.
}
