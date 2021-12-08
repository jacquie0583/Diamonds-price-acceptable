suppressMessages(library("ggplot2"))
df<-read_csv("offers7.csv",na="NA")
df

# Price vs Carats
ggplot(aes(x=Carats, y=Price), data=df) +
  geom_point(fill=I("#F79420"), color=I("black"), shape=21) +
  scale_x_continuous(lim = c(0, quantile(df$Carats, 0.99)) ) +
  scale_y_continuous(lim = c(0, quantile(df$Price, 0.99)) ) +
  ggtitle("Diamonds: Price vs. Carats")


#f79420	#2083f7
# Retail Price vs Carats
ggplot(aes(x=Carats, y= Retail), data=df) +
  geom_point(fill=I("#f79420"), color=I("#2083f7"), shape=21) +
  scale_x_continuous(lim = c(0, quantile(df$Carats, 0.99)) ) +
  scale_y_continuous(lim = c(0, quantile(df$Price, 0.99)) ) +
  ggtitle("Diamonds: Retail Price vs. Carat")

#non-Linear relationship
ggplot(aes(x=Carats, y=Price), data=df) +
  geom_point(fill=I("#F79420"), color=I("black"), shape=21) +
  stat_smooth(method="lm") +
  scale_x_continuous(lim = c(0, quantile(df$Carats, 0.99)) ) +
  scale_y_continuous(lim = c(0, quantile(df$Price, 0.99)) ) +
  ggtitle("Diamonds: Price vs. Carats")

##Scatter plot Matrix Function
!install.packages("mnormt")
!install.packages('GGally') #used for ggpairs
!install.packages("psych")
suppressMessages(library(psych))
pairs.panels(df,pch=".")

#The Demand of Diamonds
install.package('gridExtra')
library(knitr)
opts_chunk$set(message=FALSE, fig.width=4, fig.height=2)
suppressMessages(library(gridExtra))
library(grid) - textGrob
plot1 <- ggplot(aes(Price), data=df) + 
  geom_histogram(binwidth=5) +
  ggtitle('Price')

plot2 <- ggplot(aes(Price), data=df) +
  geom_histogram() +
  ggtitle('Price (log10)') +
  scale_x_log10()

grid.arrange(plot1, plot2, ncol=2, top = title, bottom = "Sample")


plot1 <- qplot(Price, data = df, binwidth = 100) + 
  ggtitle('Price')
plot2 <- qplot(log10(Price+1), data = df, binwidth = 0.01) +
  ggtitle('Price (log10)')
grid.arrange(plot1, plot2, ncol = 2)


##Scatterplot Transformation
p1 <- ggplot(aes(Carats, Price), data=df) +
  geom_point() +
  ggtitle("Price by Carats")
p2 <- ggplot(aes(Carats, Price), data=df) +
  geom_point() +
  scale_y_continuous(trans=log10_trans()) +
  ggtitle("Price (log10) by Carats")
grid.arrange(plot1, plot2, ncol=2, top = title, bottom = "Sample")

#Over plotting
head(sort(table(df$Carats), decreasing=T))
head(sort(table(df$Price), decreasing=T))
ggplot(aes(Carats, Price), data = df) + 
  geom_point(alpha=1/10, size=3/4, position = "jitter") + 
  scale_x_continuous(trans = cuberoot_trans(), limits = c(0.2, 3),
                     breaks = c(0.2, 0.5, 1, 2, 3)) + 
  scale_y_continuous(trans = log10_trans(), limits = c(350, 15000),
                     breaks = c(350, 1000, 5000, 10000, 15000)) +
  ggtitle('Price (log10) by Cube-Root of Carat')

##Price vs. Carat and Clarity
# RColorBrewer package
suppressMessages(library("ggplot2"))
install.packages('RColorBrewer')
suppressMessages(library(RColorBrewer))

ggplot(aes(x = Carats, y = Price, color=Clarity), data = df) + 
  geom_point(alpha = 0.5, size = 1, position = 'jitter') +
  scale_color_brewer(type='div', 
                     guide=guide_legend(title='Clarity',
                                        reverse=T,
                                        override.aes=list(alpha=1, size=2))) +  
  scale_x_continuous(trans = cuberoot_trans(), 
                     limits = c(0.2, 3),
                     breaks = c(0.2, 0.5, 1, 2, 3)) + 
  scale_y_continuous(trans = log10_trans(), 
                     limits = c(350, 15000),
                     breaks = c(350, 1000, 5000, 10000, 15000)) +
  ggtitle('Price (log10) by Cube-Root of Carat and Clarity')

#Price vs. Carats and Color
library('scales') #import the library
cuberoot_trans = function() trans_new('cuberoot',
                                      transform = function(x) x^(1/3),
                                      inverse = function(x) x^3)

###############Formula For Ideal Diamond Collection###########################
#Create a new function to transform the carat variable
library(tidyverse)
suppressMessages(library("ggplot2"))
df<-read_csv("offers7.csv",na="NA")
df
# Price vs carat weight - scatter plot of price (y) vs carat weight (x)
# Limit the x-axis and y-axis to omit the top 1% of values.
ggplot(df, aes(x=Carats, y=Price)) +
  geom_point(color="orange") +
  stat_smooth(method="lm") +
  scale_x_continuous(limits=c(min(df$Carats), quantile(df$Carats, 0.99))) +
  scale_y_continuous(trans = log10_trans(), limits=c(min(df$Price), quantile(df$Price, 0.99))) +
  ggtitle('Price (log10) by Carat')

library(GGally)
library(scales)
library(memisc)
library(lattice)
library(MASS)
library(reshape)
library(plyr)

set.seed(12345)
df_samp <- df[sample(1:length(df$Price), = 5000),]
ggpairs(df_samp, params = c(shape = I('.'), outlier.shape = I('.')))

## Transform our data along these axes
cuberoot_trans = function() trans_new('cuberoot',
                                      transform = function(x) x^(1/3),
                                      inverse = function(x) x^3)
#Price vs Carats
ggplot(df, aes(x=Carats, y=Price)) +
  geom_jitter(alpha = 1/2, size=3/4, color="orange") +
  stat_smooth(method="lm") +
  scale_x_continuous(trans = cuberoot_trans(), limits=c(min(df$Carats), quantile(df$Carats, 0.99))) +
  scale_y_continuous(trans = log10_trans(), limits=c(min(df$Price), quantile(df$Price, 0.99))) +
  ggtitle('Price (log10) by Cube-Root of Carat')

# Adjust the plot to explore clarity impact on price
ggplot(df, aes(x=Carats, y=Price, color=Clarity)) +
  geom_jitter(alpha = 1/2, size=3/4) +
  # stat_smooth(method="lm") +
  scale_x_continuous(trans = cuberoot_trans(), limits=c(min(df$Carats), quantile(df$Carats, 0.99))) +
  scale_y_continuous(trans = log10_trans(), limits=c(min(df$Price), quantile(df$Price, 0.99))) +
  ggtitle('Price (log10) by Cube-Root of Carats')

# Adjust plot explore color impact on price
ggplot(df, aes(x=Carats, y=Price, color=Color)) +
  geom_jitter(alpha = 1/2, size=3/4) +
  # stat_smooth(method="lm") +
  scale_x_continuous(trans = cuberoot_trans(), limits=c(min(df$Carats), quantile(df$Carats, 0.99))) +
  scale_y_continuous(trans = log10_trans(), limits=c(min(df$Price), quantile(df$Price, 0.99))) +
  ggtitle('Price (log10) by Cube-Root of Carat colored by Color')

#Building the Linear Model
# Time to model. Need to use I feature
m1 <- lm(I(log(Price)) ~ I(Carats^(1/3)), data = df)
m2 <- update(m1, ~ . + Carats)
m3 <- update(m2, ~ . + Color)
m4 <- update(m3, ~ . + Clarity)
mtable(m1, m2, m3, m4)
library(tidyverse)
suppressMessages(library("ggplot2"))
df<-read_csv("offers7.csv",na="NA")
df
testDiamond = data.frame('Carats' <= 1.00, 
                         'Color' <= "I", 'Clarity' <= "VS1")

Price = predict(m4, newdata = testDiamond,
                        interval = "prediction", level = .95)

df_sam=predict('Price', df, type="response",
        norm.votes=TRUE, predict.all=FALSE, proximity=FALSE, nodes=FALSE,
        cutoff)

write.csv(df_samp,"C:\\Users\\jacqu\\Desktop\\2\\Diamonds\\offers8.csv", row.names = TRUE)

sum(df_samp$Price)
