### Plotting the Dirichlet kernel

N <- seq(1,10,1)
f <- seq(-0.5,0.5,0.005)
v = 0

y <- function(f,N,v){
  sin(N*pi*(f-v))/sin(pi*(f-v))
}

#plot(x=f, y=y(f=f,N=N[1],v=v), main = expression(paste("Dirichlet Kernel ", nu,"=0")),
#     ylim = c(-3,length(N)), type = "l")

plot(x=f, y=y(f=f,N=N[1],v=v), main = expression(paste("Dirichlet Kernel ", nu,"=0")),
     ylim = c(-3,30), type = "l")

col = rep(c("red","blue","green"),length.out = length(N))

for(i in 2:length(N)){
  lines(x=f,y=y(f,N[i],v), type ="l", col = col[i])
  }

# The Dirac Delta function has a value of 1 at f=a and 0 everywhere else.
