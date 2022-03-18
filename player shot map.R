library(ggshakeR)
library(worldfootballR)
library(understatr)

shot_data <- understat_player_shots("https://understat.com/player/8995")
plot <- plot_shot(shot_data, type = "point")
plot

#density #hexbin #point