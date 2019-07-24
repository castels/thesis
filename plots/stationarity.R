###### Stationarity

x <- seq(0,20,0.01)

# Linear trend
y_lin <- function(x){
  1/2*x + 2*sin(x) + 1.5*sin(3*x) + rnorm(x,0,1)
}

# Exponential trend
y_exp <- function(x){
  1/2*exp(x) + 2*sin(x) + 1.5*sin(3*x) + rnorm(x,0,1)
}

# Differencing
par(mfrow = c(1,2))
plot(y_lin(x), xlab = "time", ylab = "x(t)", type = "l")
lines(1/2*x, col = "red")
plot(diff(y_lin(x)), type = "l", xlab = "time", ylab = "diff(x(t))")

# Log-transform
par(mfrow = c(1,2))
plot(y_exp(x), type = "l")
plot(log(y_exp(x)), type = "l")


