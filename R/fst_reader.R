
#' Read the fst data for a Data Resource
#' 
#' @param path path to the data set. 
#' 
#' @param resource a Data Resource.
#' @param to_factor convert columns to factor if the schema has a categories
#'   field for the column. Passed on to \code{\link{dpapplyschema}}.
#' @param ... additional arguments are passed on to \code{\link{read_fst}}.
#'
#' @seealso
#' Generally used by calling \code{\link{dpgetdata}}.
#'
#' @return
#' Returns a \code{data.frame} with the data.
#'
#' @export
fst_reader <- function(path, resource, to_factor = FALSE, ...) { 
  stopifnot(is.character(path), length(path) >= 1)
  dta <- lapply(path, function(fn, ...) {
    fst::read_fst(fn, ...)
  })
  if (is(dta[[1]], "data.table")) {
    dta <- data.table::rbindlist(dta)
  } else {
    dta <- do.call(rbind, dta)
  }
  schema <- dpschema(resource)
  if (!is.null(schema)) 
    dta <- dpapplyschema(dta, resource, to_factor = to_factor)
  structure(dta, resource = resource)
}

