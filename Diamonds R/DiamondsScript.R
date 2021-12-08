#Import Necessary Libraries
library(readr)
library(tidyverse)
library(broom)
library(caret)
library(tidyverse)
library(writexl)
library(readxl)

# IMPORTATION OF DATASET
#df<-read_csv("offers5.csv",na="NA")
#print.df
df<-read_csv("training5.csv",na="NA")
df

# Carats change to numeric
df %>% count(Clarity)
df$'Carats' %>% replace_na(1.05)

# Clarity change to numeric
df %>% count(Clarity)
df$'Carats' %>% replace_na(2.00)
df$Clarity[df$Clarity == "IF"] <- 5
df$Clarity[df$Clarity == "VVS1"] <- 4
df$Clarity[df$Clarity == "VVS2"] <- 4
df$Clarity[df$Clarity == "VS1"] <- 3
df$Clarity[df$Clarity == "VS2"] <- 3
df$Clarity[df$Clarity == "SI1"] <- 2
df$Clarity[df$Clarity == "SI2"] <- 2
df$Clarity[df$Clarity == "I1"] <- 1
df$Clarity[df$Clarity == "I2"] <- 1
df$Clarity[df$Clarity == "I3"] <- 1


# Color change to numeric
df %>% count(Color)
df$'Color' %>% replace_na(10.00)
df$Color[df$Color == "D"] <- 15
df$Color[df$Color == "E"] <- 14
df$Color[df$Color == "F"] <- 13
df$Color[df$Color == "Ffancy darkbrown"] <- 12
df$Color[df$Color == "Flby"] <- 11
df$Color[df$Color == "G"] <- 10
df$Color[df$Color == "H"] <- 9
df$Color[df$Color == "I"] <- 8
df$Color[df$Color == "J"] <- 7
df$Color[df$Color == "K"] <- 6
df$Color[df$Color == "L"] <- 5
df$Color[df$Color == "M"] <- 4
df$Color[df$Color == "N"] <- 3
df$Color[df$Color == "S-t"] <- 2
df$Color[df$Color == "T"] <- 1
 
# Depth change to numeric
 df %>% count(Depth)
# Replace NAs in a data frame
df$'Depth' %>% replace_na(62.0)

# Fluorescence change to numeric
df %>% count(Fluroescence)
df$'Fluorescence' %>% replace_na(2)
df$Fluroescence[df$Fluroescence == "None"] <- 12
df$Fluroescence[df$Fluroescence == "Faint"] <- 11
df$Fluroescence[df$Fluroescence == "Very Smal.."] <- 10
df$Fluroescence[df$Fluroescence == "Medium"] <- 9
df$Fluroescence[df$Fluroescence == "Medium B"] <- 8
df$Fluroescence[df$Fluroescence == "Medium Bl.."] <- 7
df$Fluroescence[df$Fluroescence == "Medium Ye.."] <- 6
df$Fluroescence[df$Fluroescence == "Strong"] <- 5
df$Fluroescence[df$Fluroescence == "Strong Bl.."] <- 4
df$Fluroescence[df$Fluroescence == "Very Stro.."] <- 3
df$Fluroescence[df$Fluroescence == "NA"] <- 2
df$Fluroescence[df$Fluroescence == ""] <- 2

# Polish change to numeric
df %>% count(Polish)
df$Polish[df$Polish == "Excellent"] <- 5
df$Polish[df$Polish == "Very good"] <- 4
df$Polish[df$Polish == "Good"] <- 3
df$Polish[df$Polish == "Fair"] <- 2
df$Polish[df$Polish == ""] <- 1

# Shape change to numeric
df %>% count(Shape)
df$Shape[df$Shape == "ROUND"] <- 20
df$Shape[df$Shape == "Round"] <- 20
df$Shape[df$Shape == "Marquise"] <- 15 
df$Shape[df$Shape == "Marquis"] <- 15
df$Shape[df$Shape == "Marwuise"] <- 15   
df$Shape[df$Shape == "Oval"] <- 14  
df$Shape[df$Shape == "Emerald"] <-13 
df$Shape[df$Shape == "Pear"] <- 12 
df$Shape[df$Shape == "Princess"] <- 11
df$Shape[df$Shape == "Asscher"] <- 10  
df$Shape[df$Shape == "Cushion"] <- 9
df$Shape[df$Shape == "Radiant"] <- 8
df$Shape[df$Shape == "Uncut"] <- 7
df$Shape[df$Shape == ""] <- 7

# Symmetry change to numeric
df %>% count(Symmetry)
df$Symmetry[df$Symmetry == "Excellent"] <- 6
df$Symmetry[df$Symmetry == "Very good"] <- 5
df$Symmetry[df$Symmetry == "Good"] <- 4
df$Symmetry[df$Symmetry == "Fair"] <- 3
df$Symmetry[df$Symmetry == "Faint"] <- 2
df$Symmetry[df$Symmetry == ""] <- 2

# Table change to numeric
df %>% count(Table)
# Replace NAs in a data frame
df$'Table' %>% replace_na(58.0)

# this calculates the total cost of all diamonds within each clarity category
# for example: "the cumulative cost of all diamonds with an I1 clarity is $2,907,809"
df %>% 
  ggplot(aes(x = Clarity, y = Price)) + 
  geom_bar(stat = "identity") 

# to calculate the average price of diamonds per each clarity:
df %>% 
  ggplot(aes(x = Clarity, y = Price)) + 
  geom_bar(stat = "identity") 

df %>% 
  group_by(Clarity) %>% 
  summarize(m = mean(Price)) %>% # defined m as the mean price of the diamonds dataset
  ggplot(aes(x = Clarity, y = m)) +
  geom_bar(stat = "identity") +
  labs(y = "Mean Price of Diamonds",
       x = "Clarity Category")

df %>% 
  group_by(Clarity) %>% 
  summarize(m = mean(Price),
            s = sd(Price)) %>% # standard deviation
  ggplot(aes(x = Clarity, y = m, group = Clarity, color = Clarity, fill = Clarity)) + # what happens when you add both color and fill arguments? (hint: remove one argument at a time to see the difference)
  geom_bar(stat = "identity")+
  geom_errorbar(aes(ymin = m-s, ymax = m+s)) +
  facet_wrap(~Clarity)

df %>% 
  group_by(Clarity) %>% 
  summarize(m = mean(Price)) %>% # defined m as the mean price of the diamonds dataset
  ggplot(aes(x = Clarity, y = m)) +
  geom_bar(stat = "identity",
           show.legend = FALSE, # altering the show.legend argument
           color = "red",
           size = 1, # when we change the size, what are we really changing? (size of what?)
           alpha = .5) # what does changing the value of alpha do? 
df<-read_csv("offers7.csv",na="NA")
summary(df)  
#write.csv(df,"C:\\Users\\jacqu\\Desktop\\2\\Diamonds\\offers6.csv", row.names = TRUE)
write.csv(df,"C:\\Users\\jacqu\\Desktop\\2\\Diamonds\\training4.csv", row.names = TRUE)
ggplot(data = df, aes(x = Color)) +
  geom_bar()

df %>% 
  group_by(Clarity, Color) %>% 
  ggplot(aes(x = Clarity, y = Price, group = Color, fill = Color)) +
  geom_boxplot() 


ggplot(data = diamonds, aes(x = depth)) +
  geom_histogram(binwidth = 0.2) +
  facet_wrap(~ cut)

df %>%
  filter(cut == "Fair")
ggplot(data = df, aes(x = Price, y = Carats)) +
  geom_point()
ggplot(data = df, aes(x = Price, y = Carats)) +
  geom_point(position = "jitter")

ggplot(data = df, aes(x = Carats, y = Price)) +
  geom_point()
ggplot(data = df, aes(x = Carats, y = Price)) +
  geom_point() +
  ylim(0, 2000) +
  xlim(0, 1)