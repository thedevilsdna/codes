library(ggshakeR)
library(ggplot2)

single_player <- fb_player_scouting_report("https://fbref.com/en/players/4f255115/Aurelien-Tchouameni", 
                                           pos_versus = "primary")
pizza <- plot_pizza(data = single_player, type = "single", template = "midfielder", 
                    colour_poss = "#41ab5d", colour_att = "#fec44f", season = "2021-2022 Ligue 1", 
                    colour_def = "#de2d26", theme = "dark")
pizza
