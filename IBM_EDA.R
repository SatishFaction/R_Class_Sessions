getwd()
#Reading the data
IBM=read.csv("IBM.csv")
View(IBM)
dim(IBM)
names(IBM)
#checking for null values in the data
sum(is.na(IBM$Attrition))
summary(IBM)
table(is.na(IBM))
#Univariate analysis
names(IBM)
boxplot(IBM$ï..Age)
class(IBM$Department)
str(IBM)
summary(IBM)
data=IBM[,c()]
plot(data)

