###===================================================================================================###
###                                     Introduction to R                                          ###
###                                         MODULE 1                                          ###
###                                    [DATA AND VECTORS]                                             ###                
###===================================================================================================###
#1. READING THE CARS.CSV DATA IN R
#=======================================================================================================

getwd()                                 #get the working directory
setwd("C:\\Users\\ASUS\\Desktop\\R_Sessions")  #set the working directory
cars = read.csv("cars.csv")             #read the data


#========================================================================================================
#2. SOME INITIAL STEPS WITH DATA
#========================================================================================================
#A. Checking the dimension of the data
dim(cars)

#B. Number of rows of the data
nrow(cars)

#C. Number of columns of the data
ncol(cars)

#D. Studying the Structure of the data
str(cars)

#E. Printing first and last few lines of a data
head(cars)

#F. Viewing the entire data

View(cars)

#========================================================================================================
#3. INTRODUCTION TO VECTORS
#========================================================================================================

v <- 6 #assignment symbol
v+1
v1=180
v2=380
v3=v1+v2
print(v3)


#A. Defining a vector

x <- c(12,34,24,45,7,18) # c stands for combine
x
y=c(1:100)
y
#B. Generating regular sequences - The colon [:] operator
200:300
300:200

#C. Generating regular sequences - The seq() function
seq(1,20,3)

#D. generating simple random sample


#========================================================================================================
#4. SOME USEFUL FUNCTIONS
#========================================================================================================

#A. sum()
sum(y)

#B. mean(), median(), sd(), var()
mean(y)
median(y)
sd(y)
var(y)
#C. max(), min()
max(x)
min(y)
a=c(900,80,1,5,72,200)
#D. quantile()
quantile(y,c(0.5,0.75))

#E. length()

length(a)
#F. summary
summary(a)



#========================================================================================================
#5. VECTOR SUBSETTING
#========================================================================================================












#The conditional operators

# > is greater than
# < is less than
# == is equal to
# <= is less than or equal to
# >= is greater than or equal to

x
x > 20
x == 24
a>200
a==1

#and - &
#or - |

(x>30 | x<10)
(x<30 & x >10)


#PROBLEM:
#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)

x
y


#Write a R code to find the folowing solutions
# a. Vaues of x that are less than 35

tabulate(x)
x[x<35]

# b. The number of observations in y that are more than 150


length(y[y>150])
sum(y>150)


# c. The number of observations in y that are between 120 and 165
length(y[y>120&y<=165])
y[y>120&y<=165]




# d. The vaues in x that are less than 30 or greater than 50
x[x<30|x<=165]
x[x<30|x>50]

# e. The values in x for which the values in y is less than or equal to 120

x[y<=120]


# f. The values in y for which the values in x is equal to 45
y[x==45]



#========================================================================================================
#6. VECTORS IN DATA
#========================================================================================================

#Note that in a data set each rows or columns is nothing but a vector
#A variable in data can be extracted as follows:
View(cars)
cars$MPG
sum(cars$MPG)
mean(cars$MPG)


#Vector subsetting
myvec=c(22,3,4,5,6)
myvec[1]
myvec[1:3]
myvec[c(1,4)]














#PROBLEM (Reference: cars.csv)

# a. Which car has the highest mpg?
cars$Car[cars$MPG ==max(cars$MPG)]



# b. Which car is the heaviest?

cars$Car[cars$Weight ==max(cars$Weight)]

# c. Which car is the lightest?

cars$Car[cars$Weight ==min(cars$Weight)]

# d. Which car has the highest value of the horsepower?
cars$Car[cars$Horsepower==max(cars$Horsepower)]


# e. What is the lowest value of the horsepower?

min(cars$Horsepower)

# f. What is the highest values of the mpg?

max(cars$MPG)

# g. List the top 10 percentile values of mpg.
quantile(cars$MPG)
quantile(cars$MPG)
quantile(cars$MPG, probs = c(0, 0.25, 0.5, 0.75, 1))
quantile(cars$MPG, probs = seq(0, 1, by= 0.1))
summary(cars$MPG)
# h. List the name of cars which has mileage between 25 and 35 mpg.
cars$Car[cars$MPG>=25&cars$MPG<=35]


# i. What is the average weight of the cars which has 8 cylinders?

mean(cars$Weight[cars$Cylinders==8])

# j. What is the average weight of the cars that are originated in Japan?
mean(cars$Weight[cars$Origin=='Japan'])



# k. Randomly select 20 cars from the given list of cars.
sample(cars$Car,10)













