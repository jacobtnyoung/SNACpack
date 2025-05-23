% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pins_pi_net.R
\docType{data}
\name{pins_pi_net}
\alias{pins_pi_net}
\title{PINS Power & Influence Network}
\format{
An `network` object with 205 nodes and 161 edges.
}
\usage{
pins_pi_net
}
\description{
A one-mode directed network of 205 individuals represented as a `network` object.
}
\details{
The network...


Vertex attributes:
- `age`: Age of individual in years
- `race`: Race/Ethnicity of individual (1 = white, 2 = African American, 3 = Hispanic)
- `time_in_prison`: Number of years individual has been incarcerated
}
\examples{
data( pins_pi_net )
sna::gplot( pins_pi_net )
}
\references{
Kreager, D. A., Young, J. T. N., Haynie, D. L., Bouchard, M., Schaefer, D. R., & Zajac, G. (2017).
Where “old heads” prevail: Inmate hierarchy in a men’s prison unit. *American Sociological Review*, 82(4), 685–718.
\url{https://doi.org/10.1177/0003122417710462}
}
\keyword{datasets}
