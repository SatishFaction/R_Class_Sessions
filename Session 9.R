scores <- matrix(c(89,77,69,76,56,47,90,78,81,67,68,75), nrow = 4, ncol = 3)
rownames(scores) <- c("Amit", "Andy", "Abhishek", "Dibyo")
colnames(scores) <- c("Stat", "ML", "Prog")
scores
v=c()
for(i in 1:ncol(scores))
{
  v[i]=mean(scores[,i])
}
names(v)=colnames(scores)
v
rownames(scores)
colnames(scores)
ncol(scores)

#######using apply()#####################
apply(scores,MARGIN = 1,FUN = mean)###margin= 1 applies it to rows.
apply(scores,2,mean)###apllies it to the columns
#######works faster than for loop##########
high=apply(scores,2,max)
apply(scores,2,min)###returns a vector
###apply saves time################
class(high)
high[1]
high[2]
### Creating percentage of missing values in the data in each column###########
is.na(mtcars)
View(is.na(mtcars))
sum(is.na(mtcars))
apply(is.na(mtcars),MARGIN = 2,sum)/nrow(mtcars)*100
percent_missing<-function(d)
{
  return(apply(is.na(d),MARGIN = 2,sum)/nrow(d)*100)
}
getwd()
f=read.csv("framingham.csv")
percent_missing(f)
##############################################
pmiss<-function(vec)
{
  sum(is.na(vec))/length(vec)*100
}
x=c(2,5,NA,8)
y=c(NA,NA,2.25,NA)
pmiss(x)
pmiss(y)
apply(f,2,pmiss)
####we can use user defined function in apply()##############
###We can use a function within a function the inside function
###will become a local function it also wont be avaible in the global environment
percent_missing_1<-function()
{
  pmiss<-function(vec)#####This wont be available in the global env
  {
    round(sum(is.na(vec))/length(vec)*100,2)
  }
  return(apply(f,2,pmiss))
}
percent_missing_1()
?t.test
View(f)
t.test()
t=t.test(f$male,f$totChol)
t$p.value
?t.test
###########################################################################################











