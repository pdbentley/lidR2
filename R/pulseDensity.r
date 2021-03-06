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



#' Pulse density surface model
#'
#' Creates a pulse density map using a LiDAR cloud of points.
#'
#' @aliases pulseDensity
#' @param obj An object of class \code{LAS}
#' @param res numeric. The size of a grid cell in LiDAR data coordinates units. Default is 4 units i.e. 16 square units cells.
#' @return It returns a \code{data.table} with the class \code{gridMetrics} which which enables easier plotting.
#' @examples
#' LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
#' lidar = readLAS(LASfile)
#'
#' lidar %>% pulseDensity(5) %>% plot
#' lidar %>% pulseDensity(10) %>% plot
#' @seealso
#' \code{\link[lidR:gridMetrics]{gridMetrics}}
#' @export pulseDensity
#' @importFrom dplyr rename
setGeneric("pulseDensity", function(obj, res = 4){standardGeneric("pulseDensity")})

#' @rdname pulseDensity
setMethod("pulseDensity", "LAS",
	function(obj, res = 4)
	{
	  pulseID <- V1 <- NULL

		ret = gridMetrics(obj, res, length(unique(pulseID))/res^2) %>% dplyr::rename(Z = V1)
    return(ret)
	}
)
