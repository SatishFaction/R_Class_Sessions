getwd()
#setting the working directory
setwd("C:\\Users\\ASUS\\Desktop\\R_Sessions")
cars=read.csv("cars.csv")
#dimesinon of cars
dim(cars)
#number of rows
nrow(cars)
#no of columns
ncol(cars)
#data types
str(cars)
head(cars)
tail(cars)
tail(cars,10)
View(cars)
#Introduction to vectors
v<-5 #assignement symbol
v+1
x<- c(1,45,53,555)#vector c stands for combine
x
#generating regular sequence
1:20
20:1
#sequence function
seq(25,50,5)
seq(from=50,to=100,by=5)
seq(50,100,length.out = 99)
rep(10,4) #repeats 10 four times
rep(c(1,2,3),4) #repeats the vector 4 times
rep(c(1,2,3),each=3)#repeats each value of the vector 3 times
#simple random sample
sample(1:100,10)#10 random sample without replacement
sample(c(1,2),size = 10,replace = TRUE)#sample with replacement
?sample
sample(c(1,2),size = 10,replace = TRUE,prob = c(0.8,0.2))#probability sample
set.seed(1,2,3)
#Some Useful Functions
#sum
sum(x)
#quantile
quantile(x,c(.25,0.90))
#gives lenght of the vector
length(x)
#summary of the vector
summary(x)
max(x)
min(x)
mean(x)
median(x)
sd(x)
var(x)
