## The functions below return the inverse of a matrix. Once the matrix 
## inverse has been calculated, its values is cached so that the 
## value does not need to be recalculated next time the matrix inverse
## is needed. Avoiding the recalculation of the inverse is important,
## because matrix inversion is usually a costly computation.

## The makeCacheMatrix function creates a special "matrix" object that can
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
                
        }
        get <- function() x
        setinverse <- function(solve) i<<- solve
        getinverse <- function() i
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The cacheSolve function computes the inverse of the matrix returned by
## the makeCacheMatrix function. If the inverse has already been calculated,
## then the cacheSolve function retrieves the inverse from the cache rather
## than recalculating the inverse.

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)){
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
