library(worldfootballR)
library(ggshakeR)
library(ggplot2)

dataA <- fb_player_scouting_report("https://fbref.com/en/players/4f255115/Aurelien-Tchouameni",
           pos_versus = "primary")
dataB <- fb_player_scouting_report("https://fbref.com/en/players/b853e0ad/Fred",
           pos_versus = "primary")

data <- rbind(dataA, dataB)

plot_pizza(data = data, type = "comparison", template= "midfielder", 
           player_1= "Aurelien Tchouameni", player_2= "Fred", 
           season_player_1 = "2020-2021 Ligue 1", season_player_2 = "2020-2021 Premier League",
           colour_compare = "#CB9F18", theme = "black")

