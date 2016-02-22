% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setGeneric.r, R/ClassLidar.r
\docType{methods}
\name{getSingle}
\alias{getSingle}
\alias{getSingle,Lidar-method}
\title{Filter single returns}
\usage{
getSingle(obj)

\S4method{getSingle}{Lidar}(obj)
}
\arguments{
\item{obj}{An object of class \code{Lidar}}
}
\value{
An object of class \code{Lidar}
}
\description{
Select only the returns which return only one points form a \code{Lidar} object
}
\note{
\code{getSingle(obj)} is an alias for \code{leach(obj, NumberOfReturns == 1))}
}
\examples{
LASfile <- system.file("extdata", "Megaplot.las", package="lidR")

lidar = LoadLidar(LASfile)

singleReturns = lidar \%>\% getSingle
}
\seealso{
\code{\link[lidR:getFirst]{getFirst} }
\code{\link[lidR:getFirstLast]{getFirstLast} }
\code{\link[lidR:getFirstOfMany]{getFirstOfMany} }
\code{\link[lidR:getSingle]{getSingle} }
\code{\link[lidR:getLast]{getLast} }
\code{\link[lidR:getGround]{getGround} }
\code{\link[lidR:getNth]{getNth} }
\code{\link[lidR:leach]{leach} }
}
