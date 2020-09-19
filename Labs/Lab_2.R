

#Clears all objects from workspace (i.e. your global environment)
rm(list = ls())

#
# Need to have > R version 3.5 to use library(rtweet)
#

# Load Required Packages for Text
library(combinat) # combinatorics utilities
library(datasets) # The R Datasets Package

#Load packages
library(tidyverse)
library(stringi)
library(stringr)
library(caret)
library(tm)
library(MASS)
library(dplyr)
library(readxl)
library(e1071)
library(ranger)
library(RcppEigen)
library(ggplot2)
library(devtools)
library(varhandle)
library(rtweet)
library(tidytext)
library(textdata)
library(matlib)
library(rmarkdown)

n = 100000
x = runif(n,0,1) ##simulate 100 realizations from U(0,1)
x
hist(x)

## implementing inverse method to simulate exponential
# 1. simulate uniform
# 2. x = -(1/lambda)*log(U)
lam = 2
n=1000; U=runif(n)
E=-(1/lam)*log(U)
hist(E)

## simulate Bernoulli(p) from a uniform dist.
p=0.5
n=1000; U=runif(n,0,1)
X=ifelse(U<(1-p),0,1) # Checks to see if the condition is true, and if true use the first argument
X
hist(X)

## simulate a Gamma distribution
alpha = 2; beta = 1; n = 1000; 
U=matrix(runif(n*alpha),alpha,n)
U

E=-log(U) ## exp(1)
G=beta*colSums(E) # colSums sums accross columns
hist(G)

##make a custom function simulate a Gamma distribution
gamma_sim=function(nsim=1000,alpha=3,beta=2){
  U=matrix(runif(nsim*alpha),alpha,nsim)
  E=-log(U) ## exp(1)
  G=beta*colSums(E) # colSums sums accross columns
  return(G)}
G
hist(G)

x=gamma_sim(10,4,0.5)
hist(x)


