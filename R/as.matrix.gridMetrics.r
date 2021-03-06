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



#' Tranform a gridMetrics object into a spatial matrix
#'
#' @param x a gridMetrics object
#' @param z character. The field to plot. If NULL, autodetect
#' @param \dots Other parameters for \code{acast}
#' @seealso
#' \link[lidR:gridMetrics]{gridMetrics}
#' \link[lidR:canopyModel]{canopyModel}
#' \link[reshape2:acast]{acast}
#' @examples
#' LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
#' lidar = readLAS(LASfile)
#'
#' meanHeight = gridMetrics(lidar, 20, mean(Z))
#' mtx = as.matrix(meanHeight)
#' @importFrom reshape2 acast
#' @export
#' @method as.matrix gridMetrics
#' @importFrom magrittr %>%
as.matrix.gridMetrics = function(x, z = NULL, ...)
{
  inargs <- list(...)

  multi = duplicated(x, by = c("X","Y")) %>% sum

  if(multi > 0 & is.null(inargs$fun.aggregate))
     lidRError("GDM2", number = multi, behavior = message)

  if(is.null(inargs$fun.aggregate))
    inargs$fun.aggregate = mean

  if(is.null(z))
  {
    if(length(names(x)) > 3)
      lidRError("GDM3")
    else
      z = names(x)[3]
  }

  mtx = do.call(reshape2::acast, c(list(data = x, formula = X~Y, value.var=z), inargs))

  return(mtx)
}
