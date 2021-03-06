% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{readLASdata}
\alias{readLASdata}
\title{Read data from a las and laz file with LASlib}
\usage{
readLASdata(file, Intensity = TRUE, ReturnNumber = TRUE,
  NumberOfReturns = TRUE, ScanDirectionFlag = FALSE,
  EdgeofFlightline = FALSE, Classification = TRUE, ScanAngle = TRUE,
  UserData = FALSE, PointSourceID = FALSE, RGB = TRUE)
}
\arguments{
\item{file}{character. The name of the file which the data are to be read from}

\item{Intensity}{logical. do you want to load Intensity field? default: TRUE}

\item{ReturnNumber}{logical. do you want to load ReturnNumber field? default: TRUE}

\item{NumberOfReturns}{logical. do you want to load NumberOfReturns field? default: TRUE}

\item{ScanDirectionFlag}{logical. do you want to load ScanDirectionFlag field? default: FALSE}

\item{EdgeofFlightline}{logical. do you want to load EdgeofFlightline field? default: FALSE}

\item{Classification}{logical. do you want to load Classification field? default: TRUE}

\item{ScanAngle}{logical. do you want to load intensity field? default: TRUE}

\item{UserData}{logical. do you want to load UserData field? default: FALSE}

\item{PointSourceID}{logical. do you want to load PointSourceID field? default: FALSE}

\item{RGB}{logical. do you want to load intensity R,G and B? default: TRUE}
}
\value{
list
}
\description{
Read data from a las or laz file in format 1 to 4 according to LAS specification and return a list.
}
\details{
This function musn't be used as is. It is an internal function. Please use \link[lidR:readLAS]{readLAS} abstraction.
}

