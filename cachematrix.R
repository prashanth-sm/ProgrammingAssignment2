# Code

makeCacheMatrix <- function(0x = numeric())
  
    { 
      cache <- NULL  #S1 NULL assignment to cache
      
        setMatrix <- function(newValue) #S2 Stores the matrix
          { 
                     x <<- newValue 
                     cache <<- NULL 
           } 
   
        getMatrix <- function()  #S3 returns the stored matrix
          { 
                     x 
          } 
   
        cacheInverse <- function(solve)  #S4 caching the argument
          { 
                     cache <<- solve 
          } 
   
        getInverse <- function() #S5 getting the cached value 
          { 
                     cache 
          } 
            
          
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse) 
        #S5 return a list of all functions
        
    } 


 
 
 cacheSolve <- function(y, ...) 
   
          { 
            
           inverse <- y$getInverse()  #S1 getting the cached value
            
           if(!is.null(inverse)) 
             { 
                     message("getting the cached data") 
                     return(inverse) 
             } 
           #S2 otherwise get the matrix, caclulate the inverse and store it in the cache 
           
           data <- y$getMatrix() 
           inverse <- solve(data) 
           y$cacheInverse(inverse) 
          
            
           inverse  #S3 return the inverse
   } 
   
   
   
  # Solution:
   
    source('~/.active-rstudio-document')
> mmatrix <-makeCacheMatrix(matrix(1:4,2,2))
> mmatrix$getMatrix()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> mmatrix$getInverse()
NULL
> cacheSolve(mmatrix)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> mmatrix$getInverse()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

