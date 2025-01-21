#' Imoprt data from MasterSizer 3000
#'
#' Convenience function to import data files from Malvern Panalytics
#' MasterSizer 3000 laser diffraction particle analyzer equipped with
#' a HydroEV unit.
#'
#' The device is located at XXX, Husova building.
#'
#' @param file_path character; path to file
#' @param decimal_mark character; indicating the decimal mark to be used. The
#' default is comma, due to the language settings of the computer.
#'
#' @return a tibble
#'
#' @author Anil Axel Tellbüscher
#'
#' @export
load_MasterSizer <- function(

    file_path,

    # Set decimal mark
    # Czechia: "," instead of "."
    decimal_mark = ","
    ) {

data <- read.delim(
  delim = "\t",
  locale = locale(decimal_mark = decimal_mark),
  file = file_path,
  fileEncoding = "UTF-16"
  )

return(data)
}


