library(worldfootballR)
library(tidyverse)

#scrape data
ere_table <- tm_matchday_table(country_name="England", start_year = 2021, matchday=c(1:25), league_url = "https://www.transfermarkt.com/league-one/startseite/wettbewerb/GB3")
#ere_table <- tm_matchday_table(country_name="England", start_year="2021", matchday=c(1:25))
#select columns and create a second one for team
ere_table <- ere_table %>% select(Team = squad,Match = matchday, Points = pts,Team2 = squad)
#create a matchday 0 to let every line start in 0,0
temp <- data.frame(Team = unique(ere_table$Team), Match = 0,Points=0, Team2 =unique(ere_table$Team)) 
#bind the two tables
df <- rbind(temp,ere_table) 

#plot
ggplot(df, aes(Match,Points, group=Team)) + 
  geom_line(data=df[,2:4], aes(x=Match, y=Points, group=Team2), colour="#79CFDB", alpha=.1) +
  geom_line(colour="#E172A8",size=1.2) + 
  scale_x_continuous(breaks = c(4,8,12,16,20,24)) +
  facet_wrap(~ Team) +
  labs(y="Points",
       x = "Matchday",
       title = "Number of points over time in EFL League 1",
       subtitle = "Cumulative sum of points per matchday",
       caption = "Data: Transfermarkt\n@TheDevilsDNA") +
  theme( plot.background = element_rect(fill="#120E41", colour="#120E41"),
         panel.background = element_rect(fill="#120E41", colour="#120E41"),
         text = element_text(family = "Spartan-Medium", colour="#4CACE2"),
         plot.title = element_text(family = "Spartan-Medium", colour="white",size=16),
         plot.subtitle = element_text(family = "Spartan-Medium", colour="#4CACE2"),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.text =element_text(family = "Spartan-Medium", colour="#4CACE2"),
         #axis.text = element_blank(),
         strip.background =element_rect(fill="#79CFDB"),
         strip.text = element_text(colour = 'black'))