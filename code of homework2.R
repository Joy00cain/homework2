# answer to question 2
# meed to remove NA in intent, or it will show in the bars
gun_deaths %>%
  filter(!is.na(intent)) %>%
       ggplot(aes(x=intent))+
       geom_bar()+
       labs( title= "Gun Deaths of Different Intents",
             x = "Intents", 
             y = "Number of Deaths")

# answer to question 3
gun_deaths %>%
     group_by(sex) %>%
     summarise(avgage = mean(age, na.rm = TRUE))
# generate pic of this data
ggplot(aes(x = sex))+
            geom_bar( aes(y = avgage), stat = "identity")

# answer to question 4