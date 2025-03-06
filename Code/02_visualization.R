# R code for visualizing satellite 

install.packages("viridis")
library(viridis)

library(terra)
library(imageRy)

im.list()

# For the whole course we will be using = instead of <-
b2 = im.import("sentinel.dolomites.b2.tif")
cl=colorRampPalette(c("black","dark grey","light grey"))(100)
plot(b2, col=cl)

# Exercise: make your own color ramp
cl2=colorRampPalette(c("chartreuse","coral2","gold1"))(100)
plot(b2, col=cl2)

# band 3
b3 = im.import("sentinel.dolomites.b3.tif")
b4 = im.import("sentinel.dolomites.b4.tif")
b8 = im.import("sentinel.dolomites.b8.tif")

par(mfrow=c(1, 4))
b2 = im.import("sentinel.dolomites.b2.tif")
b3 = im.import("sentinel.dolomites.b3.tif")
b4 = im.import("sentinel.dolomites.b4.tif")
b8 = im.import("sentinel.dolomites.b8.tif")

#or
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#instead of using par
im.multiframe(1,4)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#Exercise: plot the bands using im.multiframe() one on top of the other
im.multiframe(4,1)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

im.multiframe(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

cl=colorRampPalette(c("black","light grey"))(100)
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

sent=c(b2,b3,b4,b8)
sent
plot(sent, col=cl)
names(sent)=c("b2blue","b3green","b4red","b8NIR")
plot(sent)

#How to plot a single element of the stac
plot(sent$b8NIR)
plot(sent[[4]])

#How to import several sets altogether
sentdol=im.import("sentinel.dolomites")

#How to import several sets altogether
pairs(sentdol)

#viridis
plot(sentdol, col=viridis(100))
plot(sentdol, col=mako(100))
plot(sentdol, col=magma(100))
