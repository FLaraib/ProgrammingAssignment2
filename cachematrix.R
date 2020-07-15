
### The following pair of functions - makeCacheMatrix() and cacheSolve() - respectively 
# cache the inverse of a matrix 
# and compute the inverse of a matrix 

# The makeCacheMatrix function caches the inverse of a matrix. 
# It returns 4 functions: 
# set.matrix() and get.matrix(), set and retrieve the value of a matrix respectively 
# set.inverse() caches the inverse by assigning it to the inv variable, defined in the parent environment
# get.inverse () retrieves the cached inverse 

makeCacheMatrix <- function(x = matrix()) { # x is a formal argument to the function
  inv = NULL  # local variable, stores the inverse of the matrix
  set.matrix <- function(y){ # another function is created for setting the value of the matrix
    x <<- y 
    # The "<<-" assignment operator allows redefining the variable in the parent environment;
    # important for managing variables at different levels
  }
  
  get.matrix <- function() { # retrieves the matrix
    x
  }
  set.inverse <- function(inverse) { #This is where the inverse is cached 
    inv <<- inverse
  }
  get.inverse <- function() { # This function call retrieves the cached inverse 
    inverse 
  }
  # Returning a list of all functions (*the last statement is what the function returns)
  list(set.matrix = set.matrix, get.matrix = get.matrix, set.inverse = set.inverse, get.inverse = get.inverse)
}

## The cacheSolve function will compute the value of the inverse of a matrix. 
## In case a matrix's inverse is already cached, the function will retrieve it from get.inverse 

cacheSolve <- function(x,...){
  # First, check if the inverse of the matrix is already cached and retrieve it
  inv <- x$get.inverse()
  # retrieving the inverse:
  if (!is.null(inverse)) {
    print("Cached inverse: ", inv)
  }
  #computing the inverse using solve()
  m <- x$get.matrix()
  inv <- solve(mat,...)
  # calling set inverse to cache the inverse
  x$set.inverse(inv)
  inv
}