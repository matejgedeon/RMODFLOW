% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmf-read-sip.R
\name{rmf_read_sip}
\alias{rmf_read_sip}
\title{Read a MODFLOW strongly implicit procedure file}
\usage{
rmf_read_sip(file = {    
  cat("Please select strongly implicit procedure file ...\\n")     file.choose()
  })
}
\arguments{
\item{file}{filename; typically '*_sip'}
}
\value{
\code{RMODFLOW} sip object
}
\description{
\code{rmf_read_sip} reads in a MODFLOW strongly implicit procedure file and returns it as an \code{RMODFLOW} sip object
}
\seealso{
\code{\link{rmf_write_sip}}, \code{\link{rmf_create_sip}}, \url{https://water.usgs.gov/ogw/modflow/MODFLOW-2005-Guide/index.html?sip.htm}
}
