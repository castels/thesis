# Example of estimating Mt
N <- 1000
t <- 1:N

# Begin with the time series
Mt <- (t/600)^2 + sin(2*pi*(4*t/1000))
Tt <- sin(2*pi*1*t/15) + sin(2*pi*2*t/15) + sin(2*pi*3*t/15)
Et <- rnorm(N)

Xt <- Mt + Tt + Et
plot(Xt, type = "l", xlab = "Time", ylab = "")

# Estimate the first component of Mt
W = 0.1
slepseq <- dpss(n=N,nw=N*W, k = floor(2*N*W))

# note that the odd-ordered slepian sequences sum to zero
vk <- slepseq$v
Uk <- colSums(vk)

plot(Uk, type = "l")
Sw <- sum(Uk^2)

# compute the eigencoefficients
yk <- colSums(Xt*vk)

# compute the mean estimate
mu <- sum(yk*Uk)/Sw
mean(Xt)-mu # decently close!

# Estimate the second component of Mt
vk <- slepseq$v
colSums(t(vk)%*%vk) == rowSums(t(vk)%*%vk) # demonstrating orthogonality: V^TV = I

# Define the Rj polynomials:
R <- dpssap(V = vk, maxdeg = 2)[[2]]
# Expansion onto Slepian basis:
Uk <- t(vk)%*%R
colSums(t(Uk)%*%Uk) == rowSums(t(Uk)%*%Uk) # demonstrating orthogonality: U^TU = I

# define the data block:
X <- matrix(nrow = dim(vk)[1], ncol = dim(vk)[2])
X[,1:200] = Xt

# corresponding eigencoefficients:
Y <- t(vk)%*%X
# separation into polynomial:
a <- t(Uk)%*%Y
r <- Y-Uk%*%a
Xhat <- vk%*%r+ R%*%a
Ra <- R%*%a

### Putting everything together
plot(Xt, type = 'l')
lines(x = 1:length(Xt), y =  rep(mu,length(Xt)), col = "red")
lines(x = 1:length(Xt), y = rowMeans(Ra), col = "blue")

