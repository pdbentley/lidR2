% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selectTiles.r
\docType{methods}
\name{selectTiles}
\alias{selectTiles}
\alias{selectTiles,Catalog-method}
\title{Select LAS files interactively}
\usage{
selectTiles(x)

\S4method{selectTiles}{Catalog}(x)
}
\arguments{
\item{x}{A Catalog object}
}
\value{
A Catalog object
}
\description{
Select a set of LAS tile from a Catalog using interactively the mouse
}
\details{
This function enable the user to select a set of las file from a Catalog clicking on the map of the file with the mouse.
The selected files turn red on the plot at the end of the selection.
}
\examples{
\dontrun{

catalog = Catalog("<Path to a folder containing a set of .las files>")
selectedFiles = selectTiles(catalog)
}
}
\seealso{
\link[lidR:Catalog-class]{Catalog-class}
\link[lidR:Catalog]{Catalog}
}

