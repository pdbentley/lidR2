# ===============================================================================
#
# PROGRAMMERS:
#
# jean-romain.roussel.1@ulaval.ca  -  https://github.com/Jean-Romain/lidR
#
# COPYRIGHT:
#
# Copyright 2016 Jean-Romain Roussel
#
# This file is part of lidR R package.
#
# lidR is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#
# ===============================================================================



#' Canopy surface model
#'
#' Creates a canopy surface model using a LiDAR cloud of points.
#'
#' The algorithm used is the local maximum algorithm. It assigns the
#' elevation of the highest return within each grid cell to the grid cell center.
#' @aliases  canopyModel
#' @param obj An object of class \code{LAS}
#' @param res numeric. The size of a grid cell in LiDAR data coordinates units. Default is 2 units i.e. 4 square units cells.
#' @param start vector of x and y coordinates for the reference raster. Default is (0,0) see \link[lidR:gridMetrics]{gridMetrics}
#' @return It returns a \code{data.table} with the class \code{gridMetrics} which enables easier plotting.
#' @examples
#' LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
#' lidar = readLAS(LASfile)
#'
#' # Local maximum algorithm with a resolution of 2 meters
#' lidar %>% canopyModel(2) %>% plot
#' lidar %>% canopyModel(2) %>% plot3d
#' @seealso
#' \code{\link[lidR:gridMetrics]{gridMetrics}}
#' \code{\link[lidR:clipCircle]{clipCircle}}
#' @export canopyModel
#' @importFrom dplyr rename
#' @importFrom magrittr %>% %$%
setGeneric("canopyModel", function(obj, res = 2, start = c(0,0)){standardGeneric("canopyModel")})

#' @rdname canopyModel
setMethod("canopyModel", "LAS",
	function(obj, res = 2, start=c(0,0))
	{
	  X <- Y <- Z <- V1 <- NULL

	  ret = gridMetrics(obj, res, max(Z), start) %>% dplyr::rename(Z = V1)

	  #lidRError("LDR6")

    return(ret)
	}
)
