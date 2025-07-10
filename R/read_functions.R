#'  Import data from Shimadzu F-AAS
#'
#'  Function that imports either a basic or a detailed data report file
#'  from the Shimadzu AA-7000 Flame-Atomic absorption spectroscope
#'  located in the small lab at ZR.
#'
#' @param file_path character; path to the file to load.
#'
#' @param skip_lines numeric; number of lines to be skipped when
#'  reading the file. The value depends on how many lines the initial
#'  comment at the beginning of a measurement file has.
#'
#' @param device_setup character; default is "flame"
#' @param ... further arguments passed to or from other methods.
#'
#' @return a tibble.
#'
#' @importFrom readr read_delim
#'
#'
#' @author Anil Axel Tellbüscher
#'
#'
#'
#' @export
read_aas <- function(file_path, skip_lines = 2,
                     device_setup = "flame", ...) {

  aas_data <- readr::read_delim(
    file = file_path,
    skip = skip_lines,
    delim =  "\t"
  )

  return(aas_data)
}




#' Import data from FLASH 2000
#'
#' This function reads in data from the Thermo Scientific FLASH 2000 CHNS-O
#' analyzer located at the Husova laboratory.
#'
#' @param file_path character; path to file
#' @param mode character; analysis mode. usually either "chns" or "o".
#'
#' @author Anil Axel Tellbüscher
#'
#' @importFrom readxl read_xls
#'
#' @export
read_chnso <- function(file_path, mode = "chns") {

  stopifnot(mode %in% c("chns", "o",
                        "chn", "chs", "cns",
                        "ch", "cn", "cs", "hn", "hs",
                        "c", "h", "n", "s"))

  if(!mode %in% c("chns", "o")) {
    print(cat("Non-standard mode selected!\n Did you really run the analysis in", toupper(mode), "mode?"))
  }

  imported_data <- readxl::read_xls(path = file_path, col_names = FALSE)

  return(imported_data)
}





#' Import data from MasterSizer 3000
#'
#' Convenience function to import data files from Malvern Panalytics
#' MasterSizer 3000 laser diffraction particle analyzer equipped with
#' a HydroEV unit.
#'
#' The device is located at the Husova building.
#'
#' @param file_path character; path to file
#' @param decimal_mark character; indicating the decimal mark to be used. The
#' default is comma, due to the language settings of the computer.
#'
#' @return a tibble
#'
#' @author Anil Axel Tellbüscher
#'
#' @importFrom readr read_delim
#' @importFrom readr locale
#'
#' @export
read_mastersizer <- function(

  file_path,

  # Set decimal mark
  # Czechia: "," instead of "."
  decimal_mark = ","
) {

  data <- readr::read_delim(
    delim = "\t",
    locale = readr::locale(decimal_mark = decimal_mark),
    file = file_path,
    fileEncoding = "UTF-16"
  )

  return(data)
}


#'  Import data from Shimadzu TOC-L/TNM-L
#'
#'  Function that imports either a basic or a detailed data report file
#'  from the Shimadzu TOC-L/TNM-L analyzer located in the small lab at
#'  ZR.
#'
#' @param file_path character; path to the file to load
#' @param detailed logical; indicating whether the file to be loaded is a basic
#' report (only summarized results) or a detailed report (including data from
#' individual injections).
#' @param ... further arguments passed to or from other methods.
#'
#' @return a tibble
#'
#' @author Anil Axel Tellbüscher
#'
#' @importFrom readr read_delim
#' @importFrom readr locale
#' @importFrom dplyr if_else
#'
#' @export
read_toc <- function(

  # Define the path to the file to load
  file_path,

  # Define whether the file to be loaded is
  # "detailed": including data from each individual sample injection
  # "standard": including summarized results
  detailed = FALSE,

  ...
) {

  toctn_data <- readr::read_delim(
    file = file_path,
    delim =  "\t",
    locale = readr::locale(decimal_mark = ","),
    skip = dplyr::if_else(detailed == TRUE, 13, 11)
  )

  return(toctn_data)
}
