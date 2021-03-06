# This file was generated by Rcpp::compileAttributes
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Do point fall in a given polygon?
#'
#' Verifies for one point whether it fall in a given polygon
#'
#' @param vertx  numerical array of x-coordinates of polygon
#' @param verty  numerical array of y-coordinates of polygon
#' @param pointx numeric. x-coordinate of a point
#' @param pointy numeric. y-coordinate of a point
#' @return Logical. FALSE, point is exterior to the polygon, TRUE, point is in interior to the polygon
#' @references Adaptation of the C function written by W. Randolph Franklin
#' @export
pointInPolygon <- function(vertx, verty, pointx, pointy) {
    .Call('lidR_pointInPolygon', PACKAGE = 'lidR', vertx, verty, pointx, pointy)
}

#' Do points fall in a given polygon?
#'
#' Verifies for a set of points whether they fall in a given polygon
#'
#' @param vertx  numerical array of x-coordinates of polygon
#' @param verty  numerical array of y-coordinates of polygon
#' @param pointx numerical array of x-coordinates of points
#' @param pointy numerical array of y-coordinates of points
#' @return Logical array. FALSE, point is exterior to the polygon, TRUE, point is in interior to the polygon
#' @export
pointsInPolygon <- function(vertx, verty, pointx, pointy) {
    .Call('lidR_pointsInPolygon', PACKAGE = 'lidR', vertx, verty, pointx, pointy)
}

#' Do points fall in a one of the polygons?
#'
#' Verifies for a set of points whether they fall in one of the given polygon
#'
#' @param vertx  numerical list of array of x-coordinates of polygon
#' @param verty  numerical list of array of y-coordinates of polygon
#' @param pointx numerical array of x-coordinates of points
#' @param pointy numerical array of y-coordinates of points
#' @return numerical array. 0 if the points are in any polygon or the number of the polygon if points fall in a polygon
#' @export
pointsInPolygons <- function(vertx, verty, pointx, pointy) {
    .Call('lidR_pointsInPolygons', PACKAGE = 'lidR', vertx, verty, pointx, pointy)
}

#' Read data from a las and laz file with LASlib
#'
#' Read data from a las or laz file in format 1 to 4 according to LAS specification and return a list.
#'
#' This function musn't be used as is. It is an internal function. Please use \link[lidR:readLAS]{readLAS} abstraction.
#'
#' @param file character. The name of the file which the data are to be read from
#' @param Intensity logical. do you want to load Intensity field? default: TRUE
#' @param ReturnNumber logical. do you want to load ReturnNumber field? default: TRUE
#' @param NumberOfReturns logical. do you want to load NumberOfReturns field? default: TRUE
#' @param ScanDirectionFlag logical. do you want to load ScanDirectionFlag field? default: FALSE
#' @param EdgeofFlightline logical. do you want to load EdgeofFlightline field? default: FALSE
#' @param Classification logical. do you want to load Classification field? default: TRUE
#' @param ScanAngle logical. do you want to load intensity field? default: TRUE
#' @param UserData logical. do you want to load UserData field? default: FALSE
#' @param PointSourceID logical. do you want to load PointSourceID field? default: FALSE
#' @param RGB logical. do you want to load intensity R,G and B? default: TRUE
#'
#' @return list
#' @export readLASdata
readLASdata <- function(file, Intensity = TRUE, ReturnNumber = TRUE, NumberOfReturns = TRUE, ScanDirectionFlag = FALSE, EdgeofFlightline = FALSE, Classification = TRUE, ScanAngle = TRUE, UserData = FALSE, PointSourceID = FALSE, RGB = TRUE) {
    .Call('lidR_readLASdata', PACKAGE = 'lidR', file, Intensity, ReturnNumber, NumberOfReturns, ScanDirectionFlag, EdgeofFlightline, Classification, ScanAngle, UserData, PointSourceID, RGB)
}

#' Read header in a las or laz file
#'
#' Read data from a las  or laz file in format 1 to 4 according to LAS specification and return a list.
#'
#' This function musn't be used as is. It is an internal function. Please use \link[lidR:readLAS]{readLAS} abstraction.
#'
#' @param file character. the name of the file which the data are to be read from
#' @return A list
#' @export readLASheader
readLASheader <- function(file) {
    .Call('lidR_readLASheader', PACKAGE = 'lidR', file)
}

#' Write a las file with LASlib
#'
#' Methods to write las files using LASlib
#'
#' This function musn't be used as is. It is an internal function. Please use \link[lidR:writeLAS]{writeLAS} abstraction.
#'
#' @param file character. filename of .las file
#' @param LASheader list a header from a LAS object
#' @param X numeric array X data
#' @param Y numeric array Y data
#' @param Z numeric array Z data
#' @param I integer array intensity data
#' @param RN integer array return number data
#' @param NoR integer array number of returns data
#' @param SDF integer array scan direction flag data
#' @param EoF integer array edge of flightline data
#' @param C integer array classification data
#' @param SA integer array scan angle data
#' @param UD integer array user data data
#' @param PSI integer array point source id data
#' @param T numeric array gpstime data
#' @param R integer array red data
#' @param G integer array green data
#' @param B integer array blue data
#' @return void
#' @export LASlibWrite
LASlibWrite <- function(file, LASheader, X, Y, Z, I = integer(0), RN = integer(0), NoR = integer(0), SDF = integer(0), EoF = integer(0), C = integer(0), SA = integer(0), UD = integer(0), PSI = integer(0), T = numeric(0), R = integer(0), G = integer(0), B = integer(0)) {
    invisible(.Call('lidR_LASlibWrite', PACKAGE = 'lidR', file, LASheader, X, Y, Z, I, RN, NoR, SDF, EoF, C, SA, UD, PSI, T, R, G, B))
}

