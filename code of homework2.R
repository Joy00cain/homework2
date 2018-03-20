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
   
# answer to question 6
   gun_deaths %>%
    filter(!is.na(race), !is.na(intent), race == "White"| race == "Black"| race == "Hispanic") %>%
# category to category
     count(race, intent) %>%
      ggplot(aes(x=race, y=intent))+
      geom_tile(aes(fill = n))+
      labs( title = "Gun Death of Different Intents in White, Black and Hispanic")
      
# answer to question 7
  # police and age
   gun_deaths %>%
     filter(!is.na(police), !is.na(age)) %>%
     ggplot(aes(x=police, y= age))+
       geom_boxplot(aes(group = cut_width(police,1)))
  #police and race
   gun_deaths %>%
     filter(!is.na(police), !is.na(race)) %>%
     ggplot(aes(x=police)) +
      geom_freqpoly(aes(color= race), binwidth = 0.5)
   #police/race/age
   gun_deaths %>%
     filter(!is.na(police), !is.na(race), !is.na(age)) %>%
     ggplot(aes(x=police, y= age))+
     geom_boxplot(aes(group = cut_width(police,1)))+
     facet_grid(.~race)
   
   