##Regression tree
install.packages("HSAUR")
library(HSAUR)
data("Forbes2000")
View(Forbes2000)
dim(Forbes2000)
summary(Forbes2000)
#getting rid of missing values from profit
Forbes2000=subset(Forbes2000,!is.na(profits))
#fitting a decision tree
library(rpart)
model=rpart(profits~assets+marketvalue+sales,data = Forbes2000)
#visualizing the decision tree
plot(model)
text(model,cex=0.75,pretty=0)
plot(model,uniform = T)
plot(model,uniform = T,margin = 0.05)
plot(model,uniform = T,margin = 0.05,branch = 0.5)
text(model,cex=0.8,pretty = 0)
#printing the cptable from where we take the value of lambda
printcp(model)
model.prune=prune(model,cp=0.020309 )
plot(model.prune,uniform = T,margin = 0.05,branch = 0.5)
text(model.prune,cex=0.8)
##generalizing the above code
model$cptable
class(model$cptable)
which.min(model$cptable[,"xerror"])
          