####Introduction to loops,functions and Conditions#########
###Creating a function which takes a dataframe as argument and does ####
###univariate analysis###################
print("Satish Kumar R")
#########for loops#####
for (i in 1:5) ###1:5 is a vector c(1,2,3,4,5)

{
  print("Satish")
}

for (i in 1:5) ###1:5 is a vector c(1,2,3,4,5)
{
  print(i)
  print("Satish")
}
x<-c(3,5,6,7,8)
for (i in 1:length(x)) {
  print(x[i])
}

for (i in x) {
  print(i)
}
#############################----###############################
###Paste()
paste("Satish","Kumar")
a<-"aple"
b<-"pie"
paste(a,b)
paste(a,b, sep ="")
paste(a,b, sep ="_")###output of paste is a string

for(i in c("satish","apurba"))
{
  print(paste("happy bday",i))
}
###Some Basic Revision#############
library(MASS)
data("Boston")
nrow(Boston)  
ncol(Boston)
Boston[,1]####gives the 1st column
mean(Boston[,1])
####Printing the means of each variable in a dataframe#################
for(i in 1:ncol(Boston))
{
  print(mean(Boston[,i]))
}

for(i in 1:ncol(Boston))
{
  print(paste(names(Boston)[i],"-",mean(Boston[,i])))
}

for (i in names(Boston)) {
  print(paste(i,":",round(mean(Boston[,i]),2)))
}
View(Boston)
#########################################################
avg=c()
avg=numeric()##numeric empty vector
for (i in names(Boston)) {
  avg[i]=mean(Boston[,i])
}
avg
names(avg)
for (i in 1:ncol(Boston)) {
  avg[i]=mean(Boston[,i])
}
avg
####Aside
b<-c(1,34,5,6,2)
names(b)
names(b)=c("a","b","c","d","e")
b
b["a"]
b[1]
names(avg)=names(Boston)
View(avg)
avg=matrix(avg)
View(avg)
rownames(avg)=names(Boston)
colnames(avg)="Mean"
View(avg)
avg['zn','Mean']


############ Session 8 #################################################

#Plots
hist(Boston$nox)
hist(Boston[,9])
hist(Boston[,9],xlab = names(Boston)[9],ylab = "No of houses",main = paste("Histogram of",names(Boston)[9]),
     col ="pink"  )

##For loop to plot histogram of all variables##
for(i in 1:ncol(Boston))
{
  hist(Boston[,i])
}
for(i in 1:ncol(Boston))
{
  hist(Boston[,i],xlab = names(Boston)[i],ylab = "No of houses",
       main = paste("Histogram of",names(Boston)[i]),
       col ="pink"  )
}
######partitioning the display####################
par(mfrow=c(1,2))
hist(Boston$crim)  
boxplot(Boston$crim)


par(mfrow=c(2,1))
hist(Boston$crim)  
boxplot(Boston$crim,horizontal = T)


par(mfrow=c(2,1))
for(i in 1:ncol(Boston))
{
  hist(Boston[,i],xlab = names(Boston)[i],ylab = "No of houses",
       main = paste("Histogram of",names(Boston)[i]),
       col ="pink"  )
  boxplot(Boston[,i],xlab = names(Boston)[i],horizontal=T,
       main = paste("boxplot of",names(Boston)[i]),
       col ="maroon"  )
}

########################################################################
#############Exporting the plots#####################################
par(mfrow=c(1,1))
hist(Boston$nox,main = "Histogram of nox",col = "light blue")
getwd()
setwd("C:\\Users\\ASUS\\Desktop\\R_Sessions")

for(i in 1:ncol(Boston))
{
  png(paste(names(Boston)[i],".png",sep = ""))
  par(mfrow=c(2,1))
  hist(Boston[,i],xlab = names(Boston)[i],ylab = "No of houses",
       main = paste("Histogram of",names(Boston)[i]),
       col ="pink"  )
  boxplot(Boston[,i],xlab = names(Boston)[i],horizontal=T,
          main = paste("boxplot of",names(Boston)[i]),
          col ="maroon"  )
  dev.off()
}
###################################################################################
###################################################################################
##################### Session 9 ###################################################
###### User Defined Functions############################33

bill<-function(bill)
{
  total<-bill+bill*0.2
  return(total)
}
bill(100)
bill(1224)
bill(c(100,1000))  
##############################
Bill<-function(bill,tax=10)###default setting can be  given in the argument
{
  total<-bill+bill*tax/100
  return(total)
}
  
Bill(100,20) 
  
####creating a generic function for creating histograms################
par(mfrow=c(1,1))
graphs<-function(data)
{
  for(i in 1:ncol(data))
  {
    hist(data[,i],xlab = names(data)[i],
         main = paste("Histogram of",names(data)[i]),
         col ="pink"  )
  }
}
graphs(Boston)
graphs(mtcars)
getwd()
ibm=read.csv("IBM.csv")
f=read.csv("cars.csv")
ncol(ibm)
graphs(f)###this does not work since it contains categorical variable
################################################################
######Conditional statements##############

x=-5






