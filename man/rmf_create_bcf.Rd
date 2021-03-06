% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmf-create-bcf.R
\name{rmf_create_bcf}
\alias{rmf_create_bcf}
\title{Create an \code{RMODFLOW} bcf object}
\usage{
rmf_create_bcf(ibcfcb = 0, hdry = -888, iwdflg = 0, wetfct = 1,
  iwetit = 1, ihdwet = 0, int_trans = rep(0, 3), laycon = rep(0, 3),
  trpy = rep(1, 3), sf1 = NULL, tran = array(0.001, dim = c(10, 10, 3)),
  hy = NULL, vcont = array(1e-05, dim = c(10, 10, 2)), sf2 = NULL,
  wetdry = NULL)
}
\arguments{
\item{ibcfcb}{flag and unit number for writing cell-by-cell flow terms; defaults to 0}

\item{hdry}{head assigned to cells that are converted to dry cells; defaults to -888}

\item{iwdflg}{wetting capability flag; defaults to 0}

\item{wetfct}{factor included in the calculation of the initial head when a cell is converted from dry to wet; defaults to 1}

\item{iwetit}{iteration interval for attempting to wet cells; defaults to 1}

\item{ihdwet}{flag determining which equation is used to define initial heads at cells that are converted from dry to wet; defaults to 0}

\item{int_trans}{numeric vector of length \code{dis$nlay} determining which method of calculating interblock transmissivity to use for each layer; defaults to 0 for 3 layers}

\item{laycon}{numeric vector of length \code{dis$nlay} determining which layer type (LAYCON) to use for each layer; defaults to 0 for 3 layer}

\item{trpy}{numeric vector of length \code{dis$nlay} determining the horizontal anisotropy of each layer; defaults to 1 for 3 layers}

\item{sf1}{numeric 3D array of dimensions \code{dis$nrow x dis$ncol x dis$nlay} specifying the primary storage coefficient for each cell. If not read for a specific layer, set all values in that layer to NA; defaults to NULL}

\item{tran}{numeric 3D array of dimensions \code{dis$nrow x dis$ncol x dis$nlay} specifying the transmissivity along rows for each cell. If not read for a specific layer, set all values in that layer to NA; defaults to 0.001 for each cell}

\item{hy}{numeric 3D array of dimensions \code{dis$nrow x dis$ncol x dis$nlay} specifying the hydraulic conductivity along rows for each cell. If not read for a specific layer, set all values in that layer to NA; defaults to NULL}

\item{vcont}{numeric 3D array of dimensions \code{dis$nrow x dis$ncol x (dis$nlay-1)} specifying the vertical hydraulic conductivity divided by the thickness between the node in the cell and the node in the cell below. If not read for a specific layer, set all values in that layer to NA; defaults to 1e-5 for each cell}

\item{sf2}{numeric 3D array of dimensions \code{dis$nrow x dis$ncol x dis$nlay} specifying the secondary storage coefficient for each cell. If not read for a specific layer, set all values in that layer to NA; defaults to NULL}

\item{wetdry}{numeric 3D array of dimensions \code{dis$nrow x dis$ncol x dis$nlay} specifying the flag and wetting threshold for each cell. If not read for a specific layer, set all values in that layer to NA; defaults to NULL}
}
\value{
\code{RMODFLOW} bcf object
}
\description{
\code{rmf_create_bcf} creates an \code{RMODFLOW} bcf object
}
\seealso{
\code{\link{rmf_read_bcf}}, \code{\link{rmf_write_bcf}}, \url{https://water.usgs.gov/ogw/modflow/MODFLOW-2005-Guide/index.html?bcf.htm}
}
