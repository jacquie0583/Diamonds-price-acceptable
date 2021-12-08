#Import Necessary Libraries
library(readr)
library(tidyverse)
library(broom)
library(caret)
library(tidyverse)
install.packages(c("readxl","writexl")) 
library(readxl)
library(writexl)
!install.packages("ggplot2")

df<-read_csv("training5.csv",na="NA")
df
summary(df)

##1 stats_summary method
ggplot(df,                                        # name of dataset
       aes(x = Clarity,                                 # x-axis variable
           y = Price,                                   # y-axis variable
           group = Color,                                 # grouping variable (legend)
           color = Color)) +                              # coloring the grouping variable
  stat_summary(fun = "mean", geom = "point") +        # adding data points
  stat_summary(fun = "mean", geom = "line") +         # adding connecting lines
  stat_summary(fun.data = "mean_se", geom = "errorbar") # adding error bars (standard error)

##2tidyverse method
### first requires the 'sem' function to be loaded:
sem <- function(x, na.rm = FALSE) {
  out <-sd(x, na.rm = na.rm)/sqrt(length(x))
  return(out)
}

##3 graphing code
df %>%                          # name of dataset
  group_by(Clarity, Color) %>%          # grouping variables
  summarize(m = mean(Price),          # calculating mean price
            s = sem(Price)) %>%       # calculating standard error
  ggplot(aes(x = Clarity,             # x-axis variable
             y = m,                   # y-axis variable 
             group = Color,             # grouping variable
             color = Color)) +          # color the grouping variable
  geom_point() +                      # adding data points
  stat_summary(geom_line() +                       # adding connecting lines
  geom_errorbar(aes(ymin = m - s,     # adding lower error bars
                    ymax = m + s))    # adding upper error bars
##4 stat_summary method
ggplot(df, 
       aes(x = Clarity, 
           y = Price, 
           group = Color,
           color = Color)) +
  stat_summary(fun.y = "mean", geom = "point") +
  stat_summary(fun.y = "mean", geom = "line") +
  stat_summary(fun.y = "mean", 
               fun.max = function(x) mean(x) + sd(x), # calculating sd
               fun.min = function(x) mean(x) - sd(x), # calculating sd
               geom = "errorbar") 
#5 Bar
ggplot(df, aes(x = Clarity, group = Color, fill = Color)) +
  geom_bar()

#6 SCATTER Plot
df %>% 
  ggplot(aes(x = Depth, y = Price)) +
  geom_point()

#7 Clarity
df %>%
  group_by(Clarity) %>% 
  summarize(m = mean(Price)) %>% # m is defined as the mean price of diamonds grouped by clarity categories
  ungroup()
df %>% 
  group_by(Clarity) %>% # sets up the grouping variable
  summarize(m = mean(Price)) %>% # calculates the mean price for each diamond clarity
  ungroup() %>% # make sure to ungroup the data after summarizing
  ggplot(aes(x = Clarity, y = m)) + # setting up x and y values for graphing
  geom_point() # plotting data points on the graph
#Clarity/price standard error
df %>% 
  group_by(Clarity) %>% 
  summarize(m = mean(Price),
            se = sem(Price)) %>% 
  ungroup() %>%
  ggplot(aes(x = Clarity, y = m)) +
  geom_point() +
  geom_errorbar(aes(ymin = m - se, ymax = m + se))

#Multiple Independent Variables
df %>% 
  group_by(Clarity, Carats) %>% 
  summarize(m = mean(Price),
            se = sem(Price)) %>% 
  ggplot(aes(x = Clarity, y = m, group = Carats, color = Carats)) +
  geom_point() +
  geom_errorbar(aes(ymin = m - se, ymax = m + se)) +
  geom_line()

df %>% 
  group_by(Clarity, Color) %>% 
  summarize(m = mean(Price)) %>% 
  ggplot(aes(x = Clarity, y = m, group = Color, fill = Color)) +
  geom_bar(stat = "identity") 
