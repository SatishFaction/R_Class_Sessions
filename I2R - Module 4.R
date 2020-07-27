###===================================================================================================###
###                                      INTRODUCTION TO R                                           ###
###                                          MODULE 4                                           ###
###                                    [DATA MANIPULATION]                                            ###                
###===================================================================================================###
#1. The class() function
#=======================================================================================================
#similar to type function
#class of a categorical variable is factor in R
x=4
class(x)
cha="abc"
class(cha)
ve=c("a","b")
class(ve)
class(cars$MPG)
class(cars$Origin)
str(cars)



#=======================================================================================================
#2. Class conversion
#=======================================================================================================
y=c(1,2,3,4)

z=as.matrix(y)
z
class(y)
class(z)
y[1]
z[1,1]
z[2,1]
dim(z)
length(y)
t(z)#transposing the matrix
matrix(y,2,2)#inputting a vector to the matrix function
#Conversion of variables done by as.variable type to be converted
cars=read.csv("cars.csv")
names(cars)
#=======================================================================================================
#3. Sort & Order
#=======================================================================================================

#A. Sort the variable Acceleration in ascending order

sort(cars$Acceleration)[1:5]

#B. Sort the variable Weight in Decsending Order

sort(cars$Weight,decreasing = T)


#C. Sort the data by MPG in increasing order

order(cars$MPG)# ordering by MPG gives observation values from lowest MPG to highest rank
cars2=cars[order(cars$MPG),]
View(cars2)

ve=c(22,15,17)
order(ve)
order(-ve)
-ve
cars3=cars[order(-cars$MPG),]
View(cars3)
#D. Sort the data by Origin in increasing order and then sort by MPG in decresing order

cars4=cars[order(cars$Origin,-cars$MPG),]



#E. Sort the data by Cylinders and then by MPG




#F. Sort the data by MPG in ascending order and by cylinder in descending order





#=======================================================================================================
#4. Data Transformation
#=======================================================================================================

# Plot a scatter plot between MPG and weight. Comment of the linearity.

attach(cars)
plot(Weight,MPG)#in using attach the actual variables change if you make a change in the variable
#detach(cars)
# Re-plot the scatter plot by taking the log transformation of both the variables. Does the linearity 
# Improve?

plot(log(Weight),log(MPG))


# But there is a problem! Check the summary of log(MPG). What do you observe?

summary(log(MPG))


# Can you identify where we got misleaded? Probably the answer lies in the summary of MPG.




# How can we correct this?

summary(log(MPG+1))


# Study the association between MPG and Horsepower.

plot(MPG,Horsepower)




#=======================================================================================================
#5. The ifelse() function
#=======================================================================================================

# PROBLEM 1:
# Create a variable HP which will take only two values:
# IF Horsepower < 100 THEN "Low HP"
# IF Horsepower >= 100 THEN "High HP"
##ifelse(condition,valueif true,valueif false)
#creating a new variable
cars$HP=ifelse(cars$Horsepower < 100,"Low HP","High HP")
View(cars)



#PROBLEM 2:
# Create a Variable MPG_Rate which will take on the values as follows:
# IF MPG < 15 THEN "Normal"
# IF MPG >= 15 AND MPG <=25 THEN "GOOD"
# IF MPG >= 25 AND MPG <=35 THEN "GREAT"
# IF MPG >= 35 THEN "AWESOME"

cars$MPG_Rate=





#=======================================================================================================
#6. SQL in R
#=======================================================================================================


require(sqldf)
View(mtcars)
sqldf('SELECT * from mtcars')
sqldf('select mpg from mtcars')
sqldf('select mpg, wt from mtcars')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg), stdev(mpg) from mtcars group by am')






