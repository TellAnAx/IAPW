#' Import data from Shimadzu TOC-L/TNM-L
#'
#' Function that imports either a basic or a detailed data report file from
#' the Shimadzu TOC-L/TNM-L analyzer located in ZR 02 040.
#'
#' @param file_path character; path to the file to load
#' @param detailed logical; indicating whether the file to be loaded is a basic
#' report (only summarized results) or a detailed report (including data from
#' individual injections).
#' @param decimal_mark character; indicating the decimal mark to be used. The
#' default is comma, due to the language settings of the computer.
#'
#' @return a tibble
#'
#' @author Anil Axel Tellbüscher
#'
#' @export
load_TOCTN <- function(

    # Define the path to the file to load
    file_path,

    # Define whether the file to be loaded is
    # "detailed": including data from each individual sample injection
    # "standard": including summarized results
    detailed = FALSE,

    # Set decimal mark
    # Czechia: "," instead of "."
    decimal_mark = ","
    ) {

  toctn_data <- read_delim(
    file = file_path,
    delim =  "\t",
    locale = locale(decimal_mark = decimal_mark),
    skip = if_else(detailed == TRUE, 14, 11)
    )

  return(toctn_data)
}
