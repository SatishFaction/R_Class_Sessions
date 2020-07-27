###===================================================================================================###
###                                    INTRODUCTION TO R                                          ###
###                                        MODULE 3                                                  ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================
getwd()
setwd("C:\\Users\\ASUS\\Desktop\\R_Sessions")
cars <- read.csv("cars.csv")

#A. The summary() function
summary(cars$MPG)
summary(cars$Origin)
summary(cars)


#B. The by() / tapply() function
?by
by(cars$Weight, cars$Origin, FUN=mean)
by(cars$Weight, cars$Origin, FUN=median)
by(cars$Weight, cars$Origin, FUN=sd)
by(cars$Weight, cars$Origin, FUN=summary)

tapply(cars$Weight, cars$Origin, FUN=mean)#tapply and apply replacement for for loop
#the output is returned as an araay data structure and the output can be subsetted
sum1=by(cars$Weight, cars$Origin, FUN=summary)
sum1['Europe']$Europe
sum1['Japan']$Japan
sum2=tapply(cars$Weight, cars$Origin, FUN=summary)
sum2['Europe']$Europe
class(tapply(cars$Weight, cars$Origin, FUN=summary))

sum3=tapply(cars$Weight, cars$Origin, FUN=summary)
sum3$Japan
sum3$US['Mean']
c=c(1,2,3)
class(c)
typeof(c)
#=======================================================================================================
#2. TABLES
#=======================================================================================================

table(cars$Origin)
table(cars$Cylinders)
table(cars$Origin,cars$Cylinders)
round(prop.table(table(cars$Origin))*100,2)
round(prop.table(table(cars$Origin,cars$Cylinders))*100,2)
#from our sample we have observed that 0% of the total number of cars in Japan have 8 cylinders
##from our sample we have observed that 16% of the total number of cars 
#in Europe have 8 cylinders

#2. TABLES
#=======================================================================================================
?table
table(cars$Origin)
table(cars$Cylinders)
z<-round(prop.table(table(cars$Origin,cars$Cylinders)))
typeof(z)
#bi variate table
round(prop.table((table(cars$Origin,cars$Cylinders ))),2)
#inferences from the table

#from our sample we have observed that 16% of the total number of cars
#in Europe has got 4 cylinders=
#p(cars has 4 cyl|Cars are originated in Eu) =0.16 (this is incorrect!)

#.....out of all the cars having 4 cylinders 16% of them originated in
#Europe
#P(cars originated in Eu|CARS HAS 4 Cyl)=0.16 ( again incorrect!)

#....16% of all the cars have 4 cylinders and originates from Europe
#P(cars having 4Cyl & cars originated in Eu)= 0.16(correct!)

#conditioning by rows
round(prop.table((table(cars$Origin,cars$Cylinders )),1),2)

#from our sample, we have observed that 90% of the total number of cars
#in europe has got 4 cylinders =
#P(cars has 4 Cyl|Cars are originated in Eu)=0.9 (correct)

#conditioning by columns
round(prop.table((table(cars$Origin,cars$Cylinders )) ,2),2)

#...out of all the cars having 8 cylinders 100% of them are originated in
#Us (Or) 100% of all the cars with 8 cylinders are from US origin
#P(cars Originated in US|Cars has 8 cyl)=1.00 (correct)



#=======================================================================================================
#3. HISTOGRAMS
#=======================================================================================================

hist(cars$MPG)

hist(cars$MPG,xlab = 'Miles per Gallon',ylab = 'No of Cars',main = 'Histogram of MPG'
      ,col = 'pink',border = FALSE)

#Limiting the histogram with xlim
hist(cars$MPG,xlab = 'Miles per Gallon',ylab = 'No of Cars',main = 'Histogram of MPG'
     ,col = 'orange',border = FALSE,xlim =range(0,50) )

#specifying the number of bins using breaks

hist(cars$MPG,xlab = 'Miles per Gallon',ylab = 'No of Cars',main = 'Histogram of MPG'
     ,col = 'orange',border = FALSE,breaks = seq(0,50,10))

?hist

#=======================================================================================================
#4. BOXPLOTS
#=======================================================================================================
boxplot(cars$MPG)
boxplot(cars$MPG,horizontal = T,notch = T)
boxplot(cars$MPG,horizontal = T,notch = T,col = 'lightblue',xlab='Miles per gallon',
        main='Boxlot of MPG')

boxplot(cars$MPG ~ cars$Origin)

#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================




#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================

plot(cars$Weight,cars$MPG,xlab = "Weight of the Cars",
     ylab = "Miles per gallon",main = "Association between MPG and weight")
#We do not want such a plot
plot(cars$Weight,cars$MPG,xlab = "Weight of the Cars",
     ylab = "Miles per gallon",main = "Association between MPG and weight",type='l')
plot(cars$Weight,cars$MPG,xlab = "Weight of the Cars",
     ylab = "Miles per gallon",main = "Association between MPG and weight",type='b')
#Using pch argument
plot(cars$Weight,cars$MPG,xlab = "Weight of the Cars",
     ylab = "Miles per gallon",main = "Association between MPG and weight",pch=20)

plot(cars$Weight,cars$MPG,xlab = "Weight of the Cars",
     ylab = "Miles per gallon",main = "Association between MPG and weight",pch=1)

High=cars[cars$MPG>35 & cars$Weight>2900,c("MPG","Weight")]
points(x=High$Weight,y=High$MPG,pch=0,cex=1.5,col='red')
points(x=2950,y=36.4,pch=0,cex=1.5,col='red')
##pairwise Scatter plot
#Important in analysing relationship between the target and the predictors 
#It can also be used to learn about associations between predictors as well
names(cars)
data=cars[,2:7]
plot(data)
#Corelation
#Cor(x,y)=cor(y,x)
cor(cars$Weight,cars$MPG)
cor(cars$MPG,cars$Weight)
