here_S <- function(file_path,
                   name,
                   folder = c("r", "rw"),
                   server_path = "S:/010 SLOŽKY ZAMĚSTNANCU - FOLDERS OF EMPLOYEES") {

  # Make sure all name inputs work
  name <- toupper(name)


  # Create folder_path, based on the last name and the selected folder
  last_name <- strsplit(name, " ")[[1]][1]

  if(folder == "r") {
    folder_name <- "READ ONLY"
  } else if (folder == "rw") {
    folder_name <- "READ WRITE FREE"
  } else {
    warning("Select the folder!\n
            'r'   = READ ONLY\n
            'rw'  = READ WRITE FREE")
  }

  folder_path <- paste(last_name, "-", folder_name)


  # Create full path
  full_path <- paste(server_path, name, folder_path, file_path,
                     sep ="/")

  return(full_path)
}
