# load data in

x <- c(1,-1,2,-2,3,-3,4,-4,5,-5,11,-11,12,-12,13,-13)
df = read.table('dat.txt', header=TRUE, sep="\t", fill=TRUE)

####################################
# Count number of negatives(censored) 
# in a data frame 
negcount <- function (x){
  neg <- nrow(df[x<0,])
  return(neg)
}
# example
apply(df[,1:3],2,negcount)

####################################
# sample new values from a 
# normal distribution with mu = detection limit 
# and sigma = detection limit * 0.1
# x is a vector, d can be changed within function

randnorm <- function(x,d)
{
  x.half <- x/2
  abs(replace(x, which(x<0),
  rnorm(length(x[which(x<0)]),mean=abs(x.half[which(x<0)]),sd=abs(x.half[which(x<0)])*0.1)))
}

####################################
# detection limits are divided by two
# x is a vector

randdet <- function(x) {abs(ifelse(x < 0, x / 2, x))}

####################################
# sample new values from 
# triangular distribution, where
# a=0, b=dl, c =dl/2

randtri <- function(x){
  replace(x, which(x<0), sapply(abs(x[x<0]), function(x){ rtriangle(1,0,x,x/2) }))
}

####################################
# a vector example

x.half <- randdet(x)
x.norm <- randnorm(x)
x.tri <- randtri(x)

####################################
# imputation of censored data for a data frame
# use functions defined above
# argument df has to have at least two numeric columns

imputedf <- function (df)
{
  df.imp <- data.frame(matrix(ncol = ncol(df),nrow = nrow(df)))
  colnames(df.imp) <- colnames(df)
  for (i in 1:length(df)){df.imp[,i] <- randtri(x = df[,i])}
  return (df.imp)
}

####################################
# a data frame example

test <- imputedf(df[,1:3])






