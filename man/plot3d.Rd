% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot3d.gridMetrics.r
\name{plot3d}
\alias{plot3d}
\title{Plot an object of class gridMetrics in 3D}
\usage{
plot3d(x, z = NULL, ...)
}
\arguments{
\item{x}{A data.frame or data.table of class gridMetrics.}

\item{z}{character. The field to plot. If NULL, autodetect.}

\item{\dots}{Other parameters for \link[rgl:surface3d]{surface3}}
}
\description{
Plot an object of class gridMetrics in 3D
}
\examples{
LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

# Canopy surface model with 4 m^2 cells
gridMetrics(lidar, 2, max(Z)) \%>\% plot3d

# Mean height with 400 m^2 cells
gridMetrics(lidar, 20, mean(Z)) \%>\% plot3d
}
\seealso{
\link[lidR:gridMetrics]{gridMetrics}
\link[lidR:canopyModel]{canopyModel}
\link[rgl:surface3d]{surface3d}
\link[lidR:plot.gridMetrics]{plot2d}
}

