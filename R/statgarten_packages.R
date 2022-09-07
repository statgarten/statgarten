#' List all packages in the statgarten
#'
#' @param include_self Include statgarten in the list?
#' @export
#' @examples
#' statgarten_packages()
statgarten_packages <- function(include_self = TRUE) {
  raw <- utils::packageDescription("statgarten")$Imports
  imports <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", imports)
  names <- vapply(strsplit(parsed, "\\s+"), "[[", 1, FUN.VALUE = character(1))

  if (include_self) {
    names <- c(names, "statgarten")
  }

  names
}

