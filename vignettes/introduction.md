<!--
%\VignetteEngine{simplermarkdown::mdweave_to_html}
%\VignetteIndexEntry{Introduction to datapackage}
-->

---
title: Reading fst file from Data Packages
author: Jan van der Laan
css: "style.css"
---

`datapackage.fst` is an extension for the `datapackage` R package that adds
functionality for reading data from fst files (as written by the `fst` package).
It also serves as an example how one can implement additional readers for the
`datapackage` package.

First an example on how to use the package:

```{.R}
library(datapackage)
library(datapackage.fst)
```

When loading the `datapackage.fst` package it registers a reader for Data
Resources with a format `fst` or extension `fst`. One of the example resources
in the package uses this format:

```{.R}
dp <- opendatapackage(system.file("example", package = "datapackage.fst"))
res <- dpresource(dp, "complex")
res
```

To get the data one can simply do:
```{.R}
dpgetdata(res)
```

Or, with recoding categorical variables to factor:

```{.R}
dpgetdata(res, to_factor = TRUE)
```
