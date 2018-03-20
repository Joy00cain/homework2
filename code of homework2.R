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
   filter(gun_deaths, sex == "M", race == "White", year == 2012, education != "Less than HS", education != "NA")
   
# answer to question 5
   gun_deaths %>%
 #generate catogory variables for month
     mutate(category = cut(month, breaks = c(0,3,6,9,12), labels = c("winter","spring","summer","fall"))) %>%
     
    ggplot(aes(x = category))+
    geom_bar()+
    labs( title = "Gun Death in Different Seasons",
          x = "Season",
          y = "Number of Gun Death")
     
     
     
   
   