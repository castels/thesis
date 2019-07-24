library(ggplot2)
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

t = 1:200
dat <- data.frame(sto = rnorm(length(t)),
                  det = sin(t) + cos(t/2) + t/30)


# Stochastic

p1 <- ggplot(dat, aes(x=t, y=sto)) +
  geom_line() +
  ggtitle("(a) Purely Stochastic", subtitle = "Gaussian White Noise") + 
  labs(x = NULL, y = NULL)  + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank()) 

# Deterministic

p2 <- ggplot(dat, aes(x=t, y=det)) +
  geom_line() +
  ggtitle("(b) Purely Deterministic", subtitle = "sin(x) + cos(x/2)") + 
  labs(x = NULL, y = NULL) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank()) 

# Combination

p3 <- ggplot(dat, aes(x=t, y=sto+det)) +
  geom_line() +
  ggtitle("(c) Combination", subtitle = "Signal + Noise") + 
  labs(x = NULL, y = NULL) + 
  theme(axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank()) 
  


multiplot(p1,p2,p3, cols = 1)







