# Code to build your own function

somma <- function(x,y)  { 
z=x+y
return (z)
}

# Exercise: make a new function called differenza

differenza <- function(x,y)  { 
z=x-y
return (z)
}

mf <- function(nrow,ncol) { 
  par(mfrow=c(nrow, ncol))
  }

positivo <- function (x) { 
  if(x>0) { 
    print ("Positive number")
     }
  else if(x<0){ 
    print ("Negative number")
    }
  }
