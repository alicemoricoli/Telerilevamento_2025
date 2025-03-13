#Code to calculate spectral indices from satellite images

library(imageRy)
library(terra)
library(viridis)

im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg")
#banda: 1=NIR, 2=red, 3=green

mato1992=flip(mato1992)

im.plotRGB(mato1992, r=1, g=2,b=3)
im.plotRGB(mato1992, r=2, g=1,b=3)
im.plotRGB(mato1992, r=2, g=3,b=1)

#Import the 2006 image of the Mato Grosso area
mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006= flip(mato2006)
plot(mato2006)
im.multiframe(1,2)
im.plotRGB(mato1992, r=2, g=3,b=1, title="Mato Grosso 1992")
im.plotRGB(mato2006, r=2, g=3,b=1, title="Mato Grosso 2006")

#Radiometric resolution
plot(mato1992[[1]], col=inferno(100))
plot(mato2006[[1]], col=inferno(100))

#DVI: Difference Vegetation Index
#Tree: NIR=255, red=0, DVI=NIR-red=255 (al massimo)
#Stressed tree: NIR=100, red=20, DVI=NIR-red=80

#Calculating DVI
# 1 = NIR
# 2 = red

dvi1992 = mato1992[[1]] - mato1992[[2]] #NIR - red
plot(dvi1992)

#range DVI
#maximum: NIR - red = 255 - 0 = 255
#minimum: NIR - red = 0 - 255 = -255

plot(dvi1992, col=magma(100))

#Calculate DVI 2006
dvi2006 = mato2006[[1]] - mato2006[[2]]
plot(dvi2006, col=inferno(100))
im.multiframe(1,2)
plot(dvi1992)
plot(dvi2006)

#DVI 4 bit: range (0-15)
#maximum: NIR - red = 15 - 0 = 15
#minimum: NIR - red = 0 - 15 0 -15

#NDVI 8 bit: range (0-255)
#maximum: (NIR - red) / (NIR + red) = (255 - 0) / (255 + 0) = 1
#minimum: (NIR - red) / (NIR + red) = (0 - 255) / (0 + 255) = -1

#NDVI a 3 bit: range (0-7)
#maximum: (NIR - red) / (NIR + red) = (7 - 0) / (7 + 0) = 1
#minimum: (NIR - red) / (NIR + red) = (0 - 7) / (0 + 7) = -1

ndvi1992 = (mato1992[[1]] - mato1992[[2]] / (mato1992[[1]] + mato1992[[2]])
ndvi2006 = (mato2006[[1]] - mato2006[[2]] / (mato2006[[1]] + mato2006[[2]])


#Functions from imageRy:
dvi1992auto = im.dvi(mato1992, 1, 2)
dev.off()
plot(dvi1992auto)

dvi2006auto = im.dvi(mato2006, 1, 2)
dev.off()
plot(dvi2006auto)

#uguale per NDVI, poi plot multiframe(ndvi e ndviauto)
            

