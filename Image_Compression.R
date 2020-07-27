install.packages("jpeg")
library(jpeg)
getwd()
setwd("C:\\Users\\ASUS\\Desktop\\R_Sessions")
image=readJPEG("katia.jpg")
dim(image)
writeJPEG(image,"pianist.jpg")
###Exercises######################
#1. Try compressing an image with a white background
#2. Repeat step one with the pixel correction observe and report the differences
#3. Calculate the proportion of variance explained by the pc for the matrix r g and b
#choose the number of components which explains atleast 99.5% of the variance in each matrix 
## r g and b seperately
## create an application which will help you to organize your image files present in a folder
## create a compressed version of them and save them in another folder
### set an option for delete orginal. popping a msg would you like to delete the original folder
