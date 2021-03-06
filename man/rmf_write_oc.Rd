% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmf-write-oc.R
\name{rmf_write_oc}
\alias{rmf_write_oc}
\alias{write_oc}
\title{Write a MODFLOW output control option file}
\usage{
rmf_write_oc(oc, file = {    
  cat("Please select oc file to overwrite or provide new filename ...\\n")    
  file.choose() })

write_oc(...)
}
\arguments{
\item{oc}{an \code{\link{RMODFLOW}} oc object}

\item{file}{filename to write to; typically '*.oc'}
}
\value{
\code{NULL}
}
\description{
\code{rmf_write_oc} writes a MODFLOW output control option file based on an \code{\link{RMODFLOW}} oc object.
}
\section{Functions}{
\itemize{
\item \code{write_oc}: Deprecated function name
}}

\seealso{
\code{\link{read_oc}}, \code{\link{create_oc}} and \url{http://water.usgs.gov/nrp/gwsoftware/modflow2000/MFDOC/index.html?oc.htm}
}
