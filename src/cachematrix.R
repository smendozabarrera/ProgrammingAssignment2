##
## Computing the inverse of a square matrix can be done with the solve function
## in R. For example, if X is a square invertible matrix, then solve(X) returns
## its inverse.
##
## smendoza.barrera@gmail.com
## Fri Jun 20 21:53:24 CDT 2014
##

## Original comments:

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function:

## makeCacheMatrix: This function creates a special "matrix" object that can
## cache its inverse.

## The operators <<- and ->> are normally only used in functions, and cause a
## search to made through parent environments for an existing definition of the
## variable being assigned.

makeCacheMatrix <- function(x = matrix()) {
        inv  <- NULL                    # Init inverse matrix symbol
        set  <- function(y){            # Init set function to initial values
                x <<- y                 # Input assign to x in the parent environment scope
                inv <<- NULL            # NULL assign to inv in the parent environment scope
        }
        get  <- function() x            # Init get function to x matrix


        ## inv in this case is just an argument that is passed to the function, not
        ## calculated, and the only thing that this function does is what's after the
        ## parenthesis which is basically assigning the value of that argument (solve) to
        ## a variable inv that is located in the parent function (the function inside of
        ## which setinverse is defined).
        setinverse  <- function(solve) inv  <<- solve # Passing the solve function to setinverse
        getinverse  <- function() inv                 # Getting inv value from the parent environment
        list(set= set, get = get,                     # List of functions
             setinverse = setinverse, 
             getinverse = getinverse)
}


## Write a short comment describing this function:

## cacheSolve: This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already been
## calculated (and the matrix has not changed), then cacheSolve should retrieve
## the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv  <- x$getinverse()          # Calling the getinverse() of the x special matrix object
        if (!is.null(inv)){             # If inv is not null then return cached inv value
                message("\n\t*** Getting cached data! ***\n")
                return(inv)
        }
        data  <- x$get()                # Extract the matrix class from the x special matrix defined
                                        # in makeCacheMatrix() function
        inv  <- solve(data, ...)        # Calling solve to calculate inverse matrix
        x$setinverse(inv)               # Setting to x special object the inverse of matrix
        inv                             # Return inv
}

## EOF
