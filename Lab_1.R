
x = c(1,2,3,4) ## Define a vector

x


## A few basic operations

y = c(3,4,5,6)

x + y

2*x

t(x)%*%y ## inner product

t(x)
x


xbar = mean(x)
xbar
v=var(x)
s=sd(x)

v;s # anyting seperated with a semi colon will be run as two seperate lines

## other basic operations

#log, exp, sin, cos, tan, sqrt, max, min, sum and so on...
x
log(x)
max(x);min(x)
length(x)

## generate sequences

x = 3:10 # generates a column vector of 3 to 10
x

x = seq(1,10, by=.5)
x

x = rep(1,5)
x
## logical operators
# <, >, <=, >=, !=, ==

x = 3
x <= 5
x >= 7

x = c(1,2,3,4)
x == 4

x = c(1,5,16,21,39.23,-1,-2,-4)

x2 = x[x>4]
x2
x3 = x[x>4|x< -2] ## subset to union
x3
x4 = x[x<4 & x> -2] ## subset to intersection
x4
x5 = x[(x<4 & x> -2)|(x<50 & x>25)]
x5
x6 = x[c(1,2,5)] ## extract (1,2,5)th components
x6

## matracies

m1 = matrix(c(1,2,3,4), nrow = 2, ncol = 2)
m1

##making a matrix by joining vectors
x1 = rep(0,5);x2=rep(1,5)

m1 = rbind(x1,x2)
m1
m2 = cbind(x1,x2)
m2

2*m1

m1%*%m2
m1*m1

## inverse of a matrix
m=matrix(c(1,0.5,0.5,1),nrow=2,ncol=2)
m
det(m)
im=solve(m) ##inverse of a matrix

im%*%m ## this is becuase (A)^-1 A = Identity Matrix

## repeating an operation several times over

x = seq(0,1,by=0.01)
y = c() # creates an empty vector of an arbitrary size

for(i in 1:length(x)){
  y[i]=x[i]^2

}

y

# equivalently
y=x^2
y

# note: try to avoid loops if possible as they can take a long time to compute
# example

x = seq(0,1,by=0.000001)
y = c() # creates an empty vector of an arbitrary size

ptm=proc.time()
for(i in 1:length(x)){
  y[i]=x[i]^2
}
time

ptm = proc.time()
y=x^2
time = proc.time()-ptm
time

## repeating and operation until a criteria is satisfied
# while loop

i=1
while(i<10){
  print(i);
  i=i+1
  
}

##define a custom function

h = function(x){
  y=x^2-2*x;
  return(y)
}

h(1)
h(5)
h(2)

h = function(x,y){
  z=x^2-2*x+y^3;
  return(z)
}

h(1,2)
h(2,6)

h2 = function(x,y){
  z=x^2-2*x+y^3;
  d=y^2-1;
  out=c(z,d);
  return(out)
}

h2(2,1)

install.packages("ISLR")
library(ISLR)

data(Wage)
wage

help("ISLR")
??ISLR



