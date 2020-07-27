
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

