## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## set, set the value of the matrix / set, definir des valeurs de matrice
## get, get the value of the matrix/ get, obtenir des valeurs de matrice
## setinverse, set the value of inverse matrix/ setinverse, definir des valeurs de matrice inversée
## getinerse, get the valeu of inverse matrix/ getinverse, obtenir des valeurs de matrice inversée

makeCacheMatrix <- function(x = matrix()) {
        
        mat_inverse <- NULL
        set <-function(y){
                x<<-y
                mat_inverse <<- NULL
        }
        
        get <- funciton() x
        setinverse <-function(solve) mat_inverse<<- solve
        getinverse <- function() mat_inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        }


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        mat_inverse <- x$getinverse()
        
        ## Check if we have already the inverse matrix in cache
        ## verifier si on a deja une matrice inversée
        
        
        if(!is.null(mat_inverse)) {
                message("getting cached data")
                return(mat_inverse)
        }
        
        ## If so, we send the message "getting cached data",and return the inverse matrix 
        ## Si c'est le cas, on affiche le message "getting cached data" et retourne la matrice inversée
        
        data <- x$get()
        mat_inverse <- solve(data)
        x$setinverse(mat_inverse)
        mat_inverse
        
        ## If not, we'll first get the value of matrix, calculate inverse matrix and retrun the inverse matrix
        ##Sinon, on obtient d'abord des valeurs de matrice, les calcule et retourne.
        
        
}
