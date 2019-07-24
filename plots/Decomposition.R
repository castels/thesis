##### Decomposition of a Time series

x <- seq(0,20,0.01)

y_tre <- function(x){
  1/2*x
}  

y_cyc <- function(x){
  2*sin(x) + y_tre(x)
}

y_sea <- function(x){
  1.5*sin(3*x) + y_cyc(x)
}

y_wn <- function(x){
  y_sea(x) + rnorm(x,0,1)
}


plot(x,y_tre(x),ylim = c(-2,15), xlab = "time", ylab = expression(x[t]), type = "l", col = "black")
lines(x,y_cyc(x), col = "black")
lines(x,y_sea(x), col = "black")
lines(x,y_wn(x))


