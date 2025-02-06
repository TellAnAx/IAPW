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
#' @param ... further arguments passed to or from other methods.
#'
#'
#' @return a tibble.
#'
#'
#' @importFrom readr read_delim
#'
#'
#' @author Anil Axel Tellbüscher
#'
#'
#'
#' @export
read_aas <- function(file_path, skip_lines = 2, ...) {

      aas_data <- readr::read_delim(
        file = file_path,
        skip = skip_lines,
        delim =  "\t"
      )

      return(aas_data)
    }
