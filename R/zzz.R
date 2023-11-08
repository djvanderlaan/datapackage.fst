


.onLoad <- function(libname, pkgname) {
  datapackage::dpaddreader("fst", fst_reader, 
    mediatypes = "application/x-fst",
    extensions = "fst")
}


