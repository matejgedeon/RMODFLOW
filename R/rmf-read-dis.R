#' Read a MODFLOW discretization file
#' 
#' \code{rmf_read_dis} reads in a MODFLOW discretization file and returns it as an \code{\link{RMODFLOW}} dis object.
#' 
#' @param file filename; typically '*.dis'
#' @param ... arguments passed to \code{rmfi_parse_array}. Can be ignored when input arrays are free-format and INTERNAL or CONSTANT.
#' @return object of class dis
#' @importFrom readr read_lines
#' @export
#' @seealso \code{\link{rmf_write_dis}}, \code{\link{rmf_create_dis}} and \url{http://water.usgs.gov/nrp/gwsoftware/modflow2000/MFDOC/index.html?dis.htm}
rmf_read_dis <- function(file = {cat('Please select dis file ...\n'); file.choose()}, ...) {
  
  dis_lines <- read_lines(file)
  dis <- list()
  
  # data set 0
    data_set_0 <- rmfi_parse_comments(dis_lines)
    comment(dis) <- data_set_0$comments
    dis_lines <- data_set_0$remaining_lines
    rm(data_set_0)
  
  # data set 1
    data_set_1 <- rmfi_parse_variables(dis_lines)
    dis$nlay <- as.numeric(data_set_1$variables[1])
    dis$nrow <- as.numeric(data_set_1$variables[2])
    dis$ncol <- as.numeric(data_set_1$variables[3])
    dis$nper <- as.numeric(data_set_1$variables[4])
    dis$itmuni <- as.numeric(data_set_1$variables[5])
    dis$lenuni <- as.numeric(data_set_1$variables[6])
    dis_lines <- data_set_1$remaining_lines
    rm(data_set_1)
    
  # data set 2
    data_set_2 <- rmfi_parse_variables(dis_lines)
    dis$laycbd <- as.numeric(data_set_2$variables[1:dis$nlay])
    dis_lines <- data_set_2$remaining_lines
    rm(data_set_2)
    if(dis$laycbd[dis$nlay] != 0) {
      warning("Setting laycbd for the bottom layer to zero.")
      dis$laycbd[dis$nlay] <- 0
    }
    
  # data set 3
    data_set_3 <- rmfi_parse_array(dis_lines, 1, dis$ncol, 1, ndim = 1, file = file, ...)
    dis$delr <- data_set_3$array
    dis_lines <- data_set_3$remaining_lines
    rm(data_set_3)
    
  # data set 4
    data_set_4 <- rmfi_parse_array(dis_lines, 1, dis$nrow, 1, ndim = 1, file = file, ...)
    dis$delc <- data_set_4$array
    dis_lines <- data_set_4$remaining_lines
    rm(data_set_4)
  
  # data set 5
    data_set_5 <- rmfi_parse_array(dis_lines,dis$nrow,dis$ncol,1, ndim = 2, file = file, ...)
    dis_lines <- data_set_5$remaining_lines
    dis$top <- data_set_5$array
    rm(data_set_5)
  
  # data set 6
    data_set_6 <- rmfi_parse_array(dis_lines,dis$nrow,dis$ncol,dis$nlay+length(which(dis$laycbd != 0)), file = file, ...)
    dis_lines <- data_set_6$remaining_lines
    dis$botm <- rmf_create_array(data_set_6$array, dim = c(dis$nrow, dis$ncol, dis$nlay+length(which(dis$laycbd != 0))))
    rm(data_set_6)
  
  # data set 7
    for(i in 1:dis$nper) {
      data_set_7 <- rmfi_parse_variables(dis_lines)
      dis$perlen[i] <- as.numeric(data_set_7$variables[1])
      dis$nstp[i] <- as.numeric(data_set_7$variables[2])
      dis$tsmult[i] <- as.numeric(data_set_7$variables[3])
      dis$sstr[i] <- data_set_7$variables[4]
      dis_lines <- data_set_7$remaining_lines
      rm(data_set_7)
    }
  
  class(dis) <- c('dis','rmf_package')
  return(dis)
}

#' @describeIn rmf_read_dis Deprecated function name
#' @export
read_dis <- function(...) {
  .Deprecated(new = "rmf_read_dis", old = "read_dis")
  rmf_read_dis(...)
}
