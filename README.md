<!--
%\VignetteEngine{simplermarkdown::mdweave_to_html}
%\VignetteIndexEntry{Introduction to datapackage}
-->

`datapackage.fst` is an extension for the `datapackage` R package that
adds functionality for reading data from fst files (as written by the
`fst` package). It also serves as an example how one can implement
additional readers for the `datapackage` package.

First an example on how to use the package:

``` R
> library(datapackage)
> library(datapackage.fst)
```

When loading the `datapackage.fst` package it registers a reader for
Data Resources with a format `fst` or extension `fst`. One of the
example resources in the package uses this format:

``` R
> dp <- opendatapackage(system.file("example", package = "datapackage.fst"))
> res <- dpresource(dp, "complex")
> res
[complex] A complex example dataset

Selected properties:
path  :"complex.fst"
format:"fst"
schema:Table Schema [9] "string1" "integer1" "boolean1" "number1" "number2" "boolean2" ...
```

To get the data one can simply do:

``` R
> dpgetdata(res)
  string1 integer1 boolean1  number1    number2 boolean2      date1 factor1
1       a        1     TRUE  1.2e+00      1.200     TRUE 2020-01-01       1
2       b     -100    FALSE -1.0e-04     -0.001    FALSE 2022-01-12       2
3       c       NA     TRUE      Inf   1100.000     TRUE       <NA>       1
4              100     TRUE  1.0e+04 -11000.400       NA 1950-10-10       3
5       f        0       NA      NaN         NA    FALSE 1920-12-10      NA
6       g        0    FALSE       NA      0.000     TRUE 2002-02-20       3
  factor2
1     101
2     102
3     101
4     103
5     102
6    <NA>
```

Or, with recoding categorical variables to factor:

``` R
> dpgetdata(res, to_factor = TRUE)
  string1 integer1 boolean1  number1    number2 boolean2      date1 factor1
1       a        1     TRUE  1.2e+00      1.200     TRUE 2020-01-01  Purple
2       b     -100    FALSE -1.0e-04     -0.001    FALSE 2022-01-12     Red
3       c       NA     TRUE      Inf   1100.000     TRUE       <NA>  Purple
4              100     TRUE  1.0e+04 -11000.400       NA 1950-10-10   Other
5       f        0       NA      NaN         NA    FALSE 1920-12-10    <NA>
6       g        0    FALSE       NA      0.000     TRUE 2002-02-20   Other
   factor2
1   circle
2   square
3   circle
4 triangle
5   square
6     <NA>
```
