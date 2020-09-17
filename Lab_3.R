##Lab 3

##Normal distribution using the Box-Mueller metho

##u1, u2~U(0,1); x1=sqrt(-2log u1)cos (2piu2); x2=,,

nsim=5000; ns=ceiling((nsim/2))
# Can also use round() function butif it is not an ev
# even number then it will break your code

u1=runif(ns,0,1)
u2=runif(ns,0,1)

x1=(sqrt(-2*log(u1)))*cos(2*pi*u2)
x2=(sqrt(-2*log(u1)))*sin(2*pi*u2)
x=c(x1,x2)
length(x)
x


nsim=5000

normal_sim=function(nsim){
  ns=ceiling(nsim/2)
  u1=runif(ns,0,1)
  u2=runif(ns,0,1)
  x1=(sqrt(-2*log(u1)))*cos(2*pi*u2)
  x2=(sqrt(-2*log(u1)))*sin(2*pi*u2)
  x=c(x1,x2)[1:nsim]
  return(x)
}

x

hist(x)

normal_sim(15)

norm_sim=function(nsim,mu=0,var=1){
  x=normal_sim(nsim)
  z=mu+(sqrt(var))*x
  return(z)
}
z=norm_sim(1000,mu=3,var=2)
hist(z)

### Multivariate Normal Distribution
### suppose we want to simulate N_p(mu,SI)

nsim=100; mu=c(0,0); sig=matrix(c(1,0.5,0.5,1),2,2)
sig

multi_normal=function(nsim,mu,sig){
  p=length(mu)
  x=matrix(normal_sim(nsim*p),nsim,p)
  Gamma=chol(sig)
  z=mu+t(Gamma)%*%t(x)
  return(t(z))
}

x=multi_normal(1000,mu,sig)

# Notice we can check to see if the correltation matrix
# is the same as the prespecified variance covariance matrix()
cor(x)

### The Accept Reject Model
## N(0,1) --> target distribution
## DE(al) --> instrumental distribution
# 1. x~g, u~u(0,1)
# 2. y=x, u <= f(x)/Mg(x)
# 3. return to 1 otherwise


DE_sim=function(nsim,al=1){
  u1=runif(nsim,0,1)
  us=runif(nsim,0,1)
  e1=-(1/al)*log(u1)
  e2=-(1/al)*log(u2)
  x=e1-e2
  return(x)
}
DE_sim(10,2)

bound=function(M,x,al){
  num=(1/sqrt(2*pi))*exp(-(x^2)/2)
  den=M*(al/2)*exp(-al*abs(x))
  ratio=num/den
  return(ratio)
}

M=(sqrt(2/pi))*(1/al)*exp((al^2)/2)
M

bound(M,2,al)
bound(M,-1,al)

nsim=5000

while(length(ysim)<nsim){
x=DE_sim(1,al); u=runif(1)
y=ifelse(u<=bound(M,x,al),x,Na)
if(is.na(y)==FALSE){
  ysim=c(ysim,y)
}}

y




