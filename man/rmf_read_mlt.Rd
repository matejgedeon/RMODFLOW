% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmf-read-mlt.R
\name{rmf_read_mlt}
\alias{rmf_read_mlt}
\alias{read_mlt}
\title{Read a MODFLOW multiplier file}
\usage{
rmf_read_mlt(file = {     cat("Please select mlt file ...\\n")    
  file.choose() }, dis = {     cat("Please select dis file ...\\n")    
  rmf_read_dis(file.choose()) })

read_mlt(...)
}
\arguments{
\item{file}{filename; typically '*.mlt'}

\item{dis}{discretization file object; defaults to that with the same filename but with extension '.dis'}
}
\value{
\code{RMODFLOW} mlt object
}
\description{
\code{read_mlt} reads in a MODFLOW multiplier file and returns it as an \code{\link{RMODFLOW}} mlt object.
}
\section{Functions}{
\itemize{
\item \code{read_mlt}: Deprecated function name
}}

\seealso{
\code{\link{rmf_write_mlt}}, \code{\link{rmf_create_mlt}}, \url{https://water.usgs.gov/ogw/modflow/MODFLOW-2005-Guide/index.html?mult.htm}
}
