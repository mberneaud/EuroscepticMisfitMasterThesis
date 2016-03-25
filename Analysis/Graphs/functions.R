############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 23.03.16
# Last edited: 23.03.16
# Contains functions used for automating plot generation


# Function for drawing ggplot with country ID and country names
drawgg <- function(cid) {
  tmp <- dplyr::filter(CYmerge, nation == cid)
  tmp <- select(tmp, nation, year, sum.EUS.vote, avg.EUS, diff.EUS)
  g <- ggplot(tmp, aes(x = year)) +
    geom_line(aes(y = avg.EUS, colour = "#00BA38")) +
    geom_line(aes(y = sum.EUS.vote, colour = "#619CFF")) +
    geom_line(aes(y = diff.EUS, colour = "F8766D")) +
    ylab("Variable value in %") + xlab("Year of EP election") +
    theme(legend.position = "none") +
    theme(text = element_text(size = 20))
  print(g)
}


# Multiple plot function credit goes to Winston Chang 
# (http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_%28ggplot2%29/)
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
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