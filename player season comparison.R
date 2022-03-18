library(worldfootballR)
library(ggshakeR)

data <- fb_player_scouting_report("https://fbref.com/en/players/cc77354e/Boubacar-Kamara",
                             pos_versus= "primary")

plot_pizza(data = data, type = "comparison", template= "midfielder", 
           player_1= "Boubacar Kamara", player_2= "Boubacar Kamara", 
           season_player_1 = "2019-2020 Ligue 1", season_player_2 = "2020-2021 Ligue 1",
           colour_compare = "#ce1256", theme = "black")

