/*
===============================================================================

PROGRAMMERS:

jean-romain.roussel.1@ulaval.ca  -  https://github.com/Jean-Romain/lidR

COPYRIGHT:

Copyright 2016 Jean-Romain Roussel

This file is part of lidR R package.

lidR is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>

===============================================================================
*/

#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::plugins("cpp0x")]]

//' Do point fall in a given polygon?
//'
//' Verifies for one point whether it fall in a given polygon
//'
//' @param vertx  numerical array of x-coordinates of polygon
//' @param verty  numerical array of y-coordinates of polygon
//' @param pointx numeric. x-coordinate of a point
//' @param pointy numeric. y-coordinate of a point
//' @return Logical. FALSE, point is exterior to the polygon, TRUE, point is in interior to the polygon
//' @references Adaptation of the C function written by W. Randolph Franklin
//' @export
// [[Rcpp::export]]
bool pointInPolygon(NumericVector vertx, NumericVector verty, float pointx, float pointy)
{
  bool c = false;
  int i,j;
  int nvert = vertx.length();

  for (i = 0, j = nvert-1 ; i < nvert ; j = i++)
  {
    if( ((verty[i] > pointy) != (verty[j] > pointy)) && (pointx < (vertx[j]-vertx[i]) * (pointy-verty[i]) / (verty[j]-verty[i]) + vertx[i]) )
      c = !c;
  }

  return c;
}

//' Do points fall in a given polygon?
//'
//' Verifies for a set of points whether they fall in a given polygon
//'
//' @param vertx  numerical array of x-coordinates of polygon
//' @param verty  numerical array of y-coordinates of polygon
//' @param pointx numerical array of x-coordinates of points
//' @param pointy numerical array of y-coordinates of points
//' @return Logical array. FALSE, point is exterior to the polygon, TRUE, point is in interior to the polygon
//' @export
// [[Rcpp::export]]
LogicalVector pointsInPolygon(NumericVector vertx, NumericVector verty, NumericVector pointx, NumericVector pointy)
{
  int i;
  int npoints = pointx.length();
  LogicalVector c(npoints);

  for (i = 0 ; i < npoints ; i++)
  {
    c[i] = pointInPolygon(vertx, verty, pointx[i], pointy[i]);
  }

  return c;
}

//' Do points fall in a one of the polygons?
//'
//' Verifies for a set of points whether they fall in one of the given polygon
//'
//' @param vertx  numerical list of array of x-coordinates of polygon
//' @param verty  numerical list of array of y-coordinates of polygon
//' @param pointx numerical array of x-coordinates of points
//' @param pointy numerical array of y-coordinates of points
//' @return numerical array. 0 if the points are in any polygon or the number of the polygon if points fall in a polygon
//' @export
// [[Rcpp::export]]
IntegerVector pointsInPolygons(Rcpp::List vertx, Rcpp::List verty, NumericVector pointx, NumericVector pointy)
{
  int i,j;
  int npoints = pointx.length();
  int nvert   = vertx.length();
  IntegerVector id(npoints);

  for (i = 0 ; i < npoints ; i++)
  {
    for (j = 0 ; j < nvert ; j++)
    {
        if(pointInPolygon(vertx[j], verty[j], pointx[i], pointy[i]))
          id[i] = j+1;
    }
  }

  return id;
}
