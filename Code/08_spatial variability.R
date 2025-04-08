#COde for calculating spatial variability
#Standard deviation

library(terra)
library(imageRy)
library(viridis)
library(patchwork)

install.packages("RStoolbox")
library(RStoolbox)

im.list()
sent = im.import("sentinel.png")

# band 1 = NIR
# band 2 = red
# band 3 = green

# Exercise: plot the image in RGB with the NIR ontop of the red component
im.plotRGB(sent, r=1, g=2, b=3)

#Exercise: make three plots with NIR ontop of each component (non importa come mettiamo le altre bande perchè sempre molto correlate tra loro)
im.multiframe(1,3)
im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)
im.plotRGB(sent, r=3, g=2, b=1)

nir = sent[[1]]
dev.off()
plot(nir)

# Exercise: plot the nir band with the inferno color ramp palette
plot(nir, col=inferno(100))
sd3 = focal(nir, w=c(3,3), fun=sd)

#Exercise: calculate sd of the nir band with a moving window of 5x5 pixels
sd5 = focal(nir, w=c(5,5), fun=sd)

#Exxercise: use ggplot to plot sd
im.ggplot(sd3)

#Exercise: plot the 2 sd maps (3 and 5) one beside the other with gglpot
p1 = im.ggplot(sd3)
p2 = im.ggplot(sd5)
p1 + p2

#Exercise: with ggplot, plot the original set in RGB (ggRGB) together with 3 and 5 pixels
p3 = ggRGB(sent, r=1, g=2, b=3)
p1 + p2 + p3
