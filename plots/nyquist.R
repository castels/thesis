### Showing the Nyquist Frequency

par(mfrow = c(2,1))
x_seq <- seq(-2*pi,2*pi,0.01)
y <- sin(2*x_seq)

x<-c(-2*pi,-7/4*pi,-3/2*pi,-5/4*pi,-pi,-3/4*pi,-pi/2,-1/4*pi,0,
     1/4*pi,pi/2,3/4*pi,pi,5/4*pi,3/2*pi,7/4*pi,2*pi)

plot(x_seq,y, xlab = "time", ylab = "x(t)", type = "l", col = "red")
abline(h=0, col = "black")


nyquist_x<-x[c(1,3,5,7,9,11,13,15,17)]
points(x=nyquist_x, y=sin(2*nyquist_x), pch = 12, col = "blue")

lines(x = x_seq, y = 0*sin(2*x_seq), col = "blue")

plot(x_seq,y, xlab = "time", ylab = "x(t)", type = "l", col = "red")
abline(h=0, col = "black")

nyquist_gx <- x[c()]

# this is a change




