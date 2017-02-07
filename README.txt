----07.02.2017----
Censored data must be encoded 
as negative numbers
Function to impute censored data

# x - a vector example

# df - a data frame
example

# negcount()
counts number of negative (censored)
values in a vector in a data frame

# randnorm()
samples new values from a normal
distribution with mu = dl and 
sigma = dl*0.1. Number of sampled
values correspond to a number of
negative values in a vector

# randdet()
divides by 2 only negative 
elements of a vector

# randtri()
samples new values from
triangula distrbution with
a=0, b=dl, c=dl/2.
number of sampled values 
correspond to a number of
negative values of a vector

# imputedf()
imputation of censored data
for a data frame. Imputation 
can be done via randnorm(),
randdet() or randtri().


