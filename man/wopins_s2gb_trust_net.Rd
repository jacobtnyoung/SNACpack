% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wopins_s2gb_trust_net.R
\docType{data}
\name{wopins_s2gb_trust_net}
\alias{wopins_s2gb_trust_net}
\title{WOPINS Trust Network (Site 2, Good Behavior Unit)}
\format{
An `network` object with 76 nodes and 224 edges.
}
\usage{
wopins_s2gb_trust_net
}
\description{
A one-mode directed network of 76 individuals represented as a `network` object.
}
\details{
The network...


Vertex attributes:
- `age`: Age of individual in years
- `race`: Race/Ethnicity of individual (1 = white, 2 = African American, 3 = Hispanic)
- `time_in_prison`: Number of years individual has been incarcerated
- `white`: Binary variable indicating whether the woman is white (1 = white, = 0 non-white)
}
\examples{
data( wopins_s2gb_trust_net )
sna::gplot( wopins_s2gb_trust_net )
}
\references{
Young, J. T. N., & Haynie, D. L. (2020). Trusting the untrustworthy: The social organization of trust among incarcerated women. *Justice Quarterly*, 39(3), 553–584.
\url{https://doi.org/10.1080/07418825.2020.1807588}
}
\keyword{datasets}
