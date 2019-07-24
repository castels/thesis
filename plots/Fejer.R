### Plotting the Fejer kernel

N <- seq(1,10,1)
f <- seq(-0.5,0.5,0.005)
v = 0

y <- function(f,N,v){
  (sin(N*pi*(f-v))/sin(pi*(f-v)))^2
}

plot(x=f, y=y(f=f,N=N[1],v=v), main = expression(paste("Fejer Kernel ", nu,"=0")), ylim = c(-3,length(N)^2), type = "l")

col = rep(c("red","blue","green"),length.out = length(N))

for(i in 2:length(N)){
  lines(x=f,y=y(f,N[i],v), type ="l", col = col[i])
}


