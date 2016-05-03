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