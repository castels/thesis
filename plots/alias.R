#### Sound waves

par(mfrow = c(1,1))
x_seq <- seq(-2*pi,2*pi,0.01)
y <- sin(2*x_seq)

x<-c(-2*pi,-7/4*pi,-3/2*pi,-5/4*pi,-pi,-3/4*pi,-pi/2,-1/4*pi,0,
     1/4*pi,pi/2,3/4*pi,pi,5/4*pi,3/2*pi,7/4*pi,2*pi)

plot(x_seq,y, xlab = "time", ylab = "x(t)", type = "l", col = "red")
abline(h=0, col = "black")


alias_x<-x[c(1,4,7,10,13,16)]
points(x=alias_x, y=sin(2*alias_x), pch = 12, col = "blue")

lines(x = x_seq, y = sin(2/3*x_seq+pi/3), col = "blue")



