##
##
##
## Testing the cached inverse of a matrix
## smendoza.barrera@gmail.com
## Sat Jun 21 17:25:52 CDT 2014
##
##

############################################################
## First experiment - Normal behavior of the function
rm(list = ls())                         # Remove all workspace data

## library(MASS)
source("cachematrix.R")

seq1 <- c(1, 1, 4, 0, 3, 1, 4, 4, 0)
myM <- matrix(seq1, 3)
myM

myInverseM <- solve(myM)                # Non cached inverse matrix
myInverseM
class(myInverseM)

myCachedM <- makeCacheMatrix(myM)
class(myCachedM)

## First time call
myCachedInvMatrix <- cacheSolve(myCachedM)
myCachedInvMatrix

## Second time call - getting cached data
myCachedInvMatrix <- cacheSolve(myCachedM)
myCachedInvMatrix

############################################################
## Second experiment - debug function
rm(list = ls())                         # Remove all workspace data

## library(MASS)
source("cachematrix.R")

seq1 <- c(1, 1, 4, 0, 3, 1, 4, 4, 0)
myM <- matrix(seq1, 3)
myM

myInverseM <- solve(myM)                # Non cached inverse matrix
myInverseM
class(myInverseM)

debug(makeCacheMatrix)
myCachedM <- makeCacheMatrix(myM)
class(myCachedM)

## First time call
debug(cacheSolve)
myCachedInvMatrix <- cacheSolve(myCachedM)
myCachedInvMatrix

## Second time call - getting cached data
debug(cacheSolve)
myCachedInvMatrix <- cacheSolve(myCachedM)
myCachedInvMatrix

seq1 <- c(1, 0, 5, 2, 1, 6, 3, 4, 0)
myM <- matrix(seq1, 3)
myM

## Third time call - new calculation
debug(cacheSolve)
myCachedInvMatrix <- cacheSolve(myCachedM)
myCachedInvMatrix

## EOF
