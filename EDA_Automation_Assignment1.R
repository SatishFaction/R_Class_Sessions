EDA <- function(da)
{
  par(mfrow=c(2,1))
  print("#########  Mean of all Variables########## ")
  for(i in 1:ncol(da))
  {
    print(paste(names(da)[i],sep = "---",round(mean(da[,i]),2)))
  }
  print("#########  Median of all Variables########## ")
  for(i in 1:ncol(da))
  {
    print(paste(names(da)[i],sep = "---",round(median(da[,i]),2)))
  }
}
###########################################################################################
Univariate_All<-function(dataframe)
{
  if(!is.data.frame(dataframe))
  {
    stop("The input should be a data frame object")
  }
  for(i in 1:ncol(dataframe))
  {
    if(is.numeric(dataframe[,i]))
    {
    par(mfrow=c(2,1))
    boxplot(dataframe[,i],main=paste("BoxPlot of ",names(dataframe)[i])
            ,xlab=names(dataframe)[i],col = 'light green')
    hist(dataframe[,i],main = paste("Histogram of ",names(dataframe)[i]),
         xlab = names(dataframe)[i],col = "maroon")
    }
    
  }
}
#SUGGESTION 1:
#Often we are not required the graphs for all the numeric variables. Try to improve the code
#by adding an additional parameter "variable" that can take a vector of variable index and 
#return the graphs for only those variables.
#################################################################################################
Univariate_V<-function(dat,v)
{
  if(!is.data.frame(dat))
  {
    stop("The input should be a data frame object")
  }
  for(i in v)
  {
    if(is.numeric(dat[,i]))
    {
    par(mfrow=c(2,1))
    boxplot(dat[,i],main=paste("BoxPlot of ",names(dat)[i])
            ,xlab=names(dat)[i],col = 'light green')
    hist(dat[,i],main = paste("Histogram of ",names(dat)[i]),
         xlab = names(dat)[i],col = "maroon")
    }
    
  }
}
##########################################################################################
#SUGGESTION 2:
#Improve the code in suggestion 1 such that if the argument variable is ignored then it will
#return the graphs of all the numeric variables in the data by default.

Univariate_V_Ignore<-function(dat1,v=1:ncol(dat1))
{
  if(!is.data.frame(dat1))
  {
    stop("The input should be a data frame object")
  }
  for(i in v)
  {
    if(is.numeric(dat1[,i]))
    {
      par(mfrow=c(2,1))
      boxplot(dat1[,i],main=paste("BoxPlot of ",names(dat1)[i])
              ,xlab=names(dat1)[i],col = 'light green')
      hist(dat1[,i],main = paste("Histogram of ",names(dat1)[i]),
           xlab = names(dat1)[i],col = "maroon")
    }
    
  }
}
###################################################################################################
#########Adding Categorical Variable graphs############################
#SUGGESTION 3:
#We ignored the cateorical variables in our discussion. Make some improvement in your codes
#in suggestion 2 such that the function will take the argument "data" and "variable" and will
#return boxplots & histograms for the numerical variables and barplots and pie charts for
#the categorical variables.

Univariate_V_Plus_Cat<-function(dat1,v=1:ncol(dat1))
{
  if(!is.data.frame(dat1))
  {
    stop("The input should be a data frame object")
  }
  for(i in v)
  {
    if(is.numeric(dat1[,i]))
    {
      par(mfrow=c(2,1))
      boxplot(dat1[,i],main=paste("BoxPlot of ",names(dat1)[i])
              ,xlab=names(dat1)[i],col = 'light green')
      hist(dat1[,i],main = paste("Histogram of ",names(dat1)[i]),
           xlab = names(dat1)[i],col = "maroon")
    }
    if(is.factor(dat1[,i]))
    {
      par(mfrow=c(1,1))
      barplot(table(dat1[,i]),xlab = names(dat1)[i],col = "maroon")
    }
    
  }
}
Univariate_V_Plus_Cat(ibm)

#SUGGESTION 4:
#Probably you need not want to mess up your working directory with so many image files...
#Create an additional argument for the function "dir" (directory), such that the function
#exports all the files to your specified folder (which need not necessaryly be your working
#directory).
##############################################################################
############Final Function##################################################
Univariate_V_Plus_Cat_dir<-function(dat1,v=1:ncol(dat1),dir="C:\\Users\\ASUS\\Desktop\\R_Practise")
{
  if(!is.data.frame(dat1))
  {
    stop("The input should be a data frame object")
  }
  s=getwd()
  setwd(dir)
  for(i in v)
  {
    if(is.numeric(dat1[,i]))
    {
      png(paste(names(dat1)[i],".png",sep = ""))
      par(mfrow=c(2,1))
      boxplot(dat1[,i],main=paste("BoxPlot of ",names(dat1)[i])
              ,xlab=names(dat1)[i],col = 'light green')
      hist(dat1[,i],main = paste("Histogram of ",names(dat1)[i]),
           xlab = names(dat1)[i],col = "maroon")
      dev.off()
    }
    if(is.factor(dat1[,i]))
    {
      png(paste(names(dat1)[i],".png",sep = ""))
      par(mfrow=c(1,1))
      barplot(table(dat1[,i]),xlab = names(dat1)[i],col = "maroon")
      dev.off()
    }
    
  }
  setwd(s)
}



###############################################################################
####This function splits the dataset according to the datatype##############
re_arrange<-function(data)
{
  a=c()
  b=c()
  for(i in 1:ncol(data))
  {
    if(length(unique(data[,i]))<=5)
    {
      data[,i]=as.factor(data[,i])
    }
    
    a[i]=is.numeric(data[,i])
    b[i]=is.factor(data[,i])
  }
  a
  da=data[,a]
  db=data[,b]
  dd=data.frame(da,db)
  View(dd)
}

re_arrange(f)
############################################################################
################# Ttest for data set###########################################
Ttest<-function(data,x=c(),y=c())
{
  t=c()
  for(i in x)
  {
    t=t.test(data[,i],data[,y])
    print(t$p.value)
    
  }
}
chi_test<-function(data,x=c(),y=c())
{
  chi=c()
  for(i in x)
  {
    chi=chisq.test(data[,i],data[,y])
    print(chi$p.value)
    
  }
}
chi_test(car,c(3),c(9))










