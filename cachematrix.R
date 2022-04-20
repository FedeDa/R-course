## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    #I create a special matrix that can cache its inverse.
    m <- NULL
    #first element of the list
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    #second element of the list
    get <- function() x
    #third element of the list
    setsolve <- function(solve) m <<- solve
    #4th element of the list
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    #is there a matrix in the cache? 
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get
    #compute the inverse
    m <- solve(data, ...)
    x$setsolve(m)
    m
    
}
