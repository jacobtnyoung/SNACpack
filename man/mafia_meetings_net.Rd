% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mafia_meetings_net.R
\docType{data}
\name{mafia_meetings_net}
\alias{mafia_meetings_net}
\title{Mafia Meetings Network}
\format{
An `network` object with 101 nodes and 255 edges.
}
\source{
Data retrieved from \url{https://github.com/lcucav/criminal-nets/blob/master/dataset/Montagna_meetings_edgelist.csv}
}
\usage{
mafia_meetings_net
}
\description{
A one-mode, undirected, binary network of meetings among individuals represented as a `network` object.
}
\details{
The network represents meetings among members of the Sicilian Mafia in the first decade of
the 2000s.


Vertex attributes:
- `vertex.names`: Names
}
\examples{
data( mafia_meetings_net )
sna::gplot( mafia_meetings_net, gmode = "graph" )
}
\references{
Cavallaro, L., Ficara, A., De Meo, P., Fiumara, G., Catanese, S., et al. (2020). Disrupting resilient criminal networks through data analysis: The case of Sicilian Mafia. *PLOS ONE*, 15(8), e0236476.
\url{https://doi.org/10.1371/journal.pone.0236476}
}
\keyword{datasets}
