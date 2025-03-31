# Reporting multitemporal analysis in R

First of all, we should import an image by:

``` r
im.list() # make a list
gr = im.import ("greenland") # to import the image
```

Then, we might calculate the difference of values of the images

``` r
grdif = gr[[4]] - gr[[1]]
```
This will create the following image:
<img src="../Pics/output.jpeg" width=100% />

A pdf version of the output is the following:
<img src="../Pics/output.jpeg" width=100% />

> Note 1: If you want to put pdf files you can rely on:

> Note 2: Information about the Copernicus program can be found at

