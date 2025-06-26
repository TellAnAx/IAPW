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
