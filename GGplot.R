####   GGPLOT Session    #######################
getwd()
setwd('C:\\Users\\ASUS\\Desktop\\R_Sessions')
library(ggplot2)
car=read.csv('cars.csv')
View(car)
###Histogram
##Creating an empty canvas
ggplot(aes(MPG),data = car)
##Simple histogram
ggplot(aes(MPG),data = car) +geom_histogram()
#binwidth argument(setting binwidth of the graph to 10)
ggplot(aes(MPG),data = car) +geom_histogram(binwidth = 10)
##
plt=ggplot(aes(MPG),data = car)
plt+geom_histogram(binwidth = 10)
##Relative Frequency plot
plt+geom_histogram(aes(y= ..density..),bins = 10)
###Adding Axis labels,subtitles, changing line in title
plt+geom_histogram(binwidth = 10)+xlab('Miles per gallon')+ylab("Number of cars")+ggtitle("Histogram of MPG")
plt+geom_histogram(binwidth = 10)+xlab('Miles per gallon')+ylab("Number of cars")+ggtitle("Histogram of MPG",subtitle = "Date 18th August")
plt+geom_histogram(binwidth = 10)+xlab('Miles per gallon')+ylab("Number of cars")+ggtitle("Histogram of\n MPG")

#Changing axis ticks
plt+geom_histogram(binwidth = 10)+scale_x_continuous(name = "Miles per gallon",breaks = seq(0,50,5))
plt+geom_histogram(binwidth = 10)+scale_x_continuous(name = "Miles per gallon",breaks = seq(0,50,5),limits = c(0,50))
#Changing colors
plt+geom_histogram(fill="light blue", binwidth = 10)
plt+geom_histogram(fill="light blue",color="black", binwidth = 10)
plt+geom_histogram(aes(fill=..count..), binwidth = 10)
plt+geom_histogram(aes(fill=..count..), binwidth = 10)+scale_fill_gradient("Count",low = "orange",high = "red")
###Using themes
plt+geom_histogram(aes(fill=..count..), binwidth = 10)+scale_fill_gradient("Count",low = "orange",high = "red")+theme_classic()
plt+geom_histogram(aes(fill=..count..), binwidth = 10)+scale_fill_gradient("Count",low = "black",high = "green")+theme_minimal()
plt+geom_histogram(aes(fill=..count..), binwidth = 10)+scale_fill_gradient("Count",low = "black",high = "green")+theme_light()
plt+geom_histogram(aes(fill=..count..), binwidth = 10)+scale_fill_gradient("Count",low = "black",high = "green")+theme_dark()
###Multiple Histograms
plt+geom_histogram(aes(fill=..count..), binwidth = 10)+scale_fill_gradient("Count",low = "orange",high = "red")+facet_wrap(~Cylinders,nrow = 2)
plt+geom_histogram(aes(fill=..count..), binwidth = 10)+scale_fill_gradient("Count",low = "orange",high = "red")+facet_wrap(c("Cylinders","Origin"),nrow = 2)

