# R code for visualizing satellite 

library(terra)
library(imageRy)

im.list()

# For the whole course we will be using = instead of <-
b2=im.import("sentinel.dolomites.b2.tif")
cl=colorRampPalette(c("black","dark grey","light grey"))(100)
plot(b2, col=cl)

# Exercise: make your own color ramp
cl2=colorRampPalette(c("chartreuse","coral2","gold1"))(100)
plot(b2, col=cl2)
