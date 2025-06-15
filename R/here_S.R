#' File path to S: drive
#'
#' The `here_S()` function provides a convenient shortcut to access
#' the private folder on S: drive. Note that the function only works
#' when the computer is connected  to the university network.
#'
#' @param file_path character; path to file in the selected folder.
#' @param name character; name of employee, usually in the format
#' "LASTNAME FIRSTNAME". The name is read from .Renviron by default.
#' @param folder character; indicates whether to set the path to the
#' "READ ONLY" `('read')` or the "READ WRITE FREE" `('read_write')`folder.
#' @param server_path character; hard-coded path to the employee folders
#' on S: drive.
#'
#' @export
here_S <- function(file_path,
                   name = Sys.getenv("FFPW_NAME"),
                   folder = "w",
                   server_path = "S:/010 SLO\u017DKY ZAM\u011ASTNANCU - FOLDERS OF EMPLOYEES") {

  # Make sure all name inputs work
  if(name == "") {
    warning("No name provided and 'FPPW_NAME' not found in .Renviron.")
  }

  name <- toupper(name)


  # Create folder_path, based on the last name and the selected folder
  last_name <- strsplit(name, " ")[[1]][1]

  if(folder == "read") {
    folder_name <- "READ ONLY"
  } else if (folder == "read_write") {
    folder_name <- "READ WRITE FREE"
  } else {
    warning("Select the folder!\n
            'read'   = READ ONLY\n
            'read_write'  = READ WRITE FREE")
  }

  folder_path <- paste(last_name, "-", folder_name)


  # Create full path
  full_path <- paste(server_path, name, folder_path, file_path,
                     sep ="/")

  return(full_path)
}
