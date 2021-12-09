# Diamonds price? acceptable
## Step 1: Define the problem
  1.	Replenish the inventory
  2.	Budget:  $5,000,000 towards the purchase of new diamonds.  
  3.	Place an offer forset of diamonds and the distributor at that price.
 
## Resources:
   1.	Train:  diamonds that were purchased from various distributor vendors and the prices they retailed for:
		  how much diamonds have sold for
		  retail price the diamond sells at
		  price paid to the vendor to acquire it
   2.	List of diamonds that are currently on the market, but this list does not include any set prices.
	    data set provided, I made offers on


## Goal: 
  1. Clean
  2. Ml for multiclassification as regression model
  3. Ml model process 
  4. Prediction
  5. Offers
			   
##  Step 2: Decide on an approach
Multi-class regression: useful for questions that occur as rankings or comparisons.

## Step 3: Collect data
Cleaning included removing missing values, identifying duplicate records, and correcting incorrect values.  Revised to allow for imperfections in the data.

##  Step 4: Analyze data

Spent time getting to know the data and the research going into diamond value, analysis, and pricing.  

###  Carat vs Price 


The carats vs. price graph were somewhat inconsistent, see on the left, but carats are the driving force for price.  An increase in carat weight would lead to an increase in diamond price.
The relationship between price and carat is an obvious positive (non-linear) relationship between both variables: as carat size increases, price also increases, possibly exponential. The variance of the relationship increases as carat size increases. The carat size takes on a very clear discrete values which are those vertical stripes on the graph.
The linear trend line doesn’t go through the center of the data at some key places which curve in certain parts of the graph. A slope up more towards the end should occur. For predictions, at points on the graph there are some key places that have deviated and thus causing the accuracy of predictions to lack in accuracy. There are fewer customers who can afford a bigger diamond (one larger than one carat). Hence, we shouldn’t expect the market for bigger diamonds to be as competitive as the one for smaller diamonds. It makes sense that the variance, as well as the price, would increase with carat size.

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture2.png">   
</p>


Looking at the Retail Price vs. Carat, a noticeable difference in the height and width of the 
data.  The distribution of any monetary variable like dollars will be highly skewed and vary over orders of
magnitude. 

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture3.png">   
</p> 

This can result from path dependence, for example the rich getting richer or multiplicative processes
like year-on-year inflation or some combination of both. A good idea to look into compressing any such variable
by putting it on a log scale.


<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture4.png">   
</p> 

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture5.png">   
</p> 

###  Connecting Demand and Price Distributions
Looking at these two parameters: the price for diamonds is heavily skewed (long right tail). However, looking at price on the log10 scale, it seems closer to the bell curve normal distribution. It even shows evidence of bimodality on this scale. There appear to be two different “populations.” One peak might represent the mean for the people that buy diamonds of size one carat or less. And the other mean represents the rich people that can afford higher priced diamonds.
Features 

<p align="center">
   <img width="800" height="300" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture6.png">   
</p> 

The factor that determines the price of a diamond is the size, or carat weight, of the diamond. The carat vs price has an exponential relationship. Larger continuous chunks of diamonds without significant flaws are probably harder to find than smaller ones. This might help explain the sort of exponential looking curve.
Transforming the data with a cube root function, looks like an almost linear relationship between carat weight and price after the transformations.  Also, noted was the relationship between x (length), y(width), and z(depth) v/s price and carat weight: Diamond prices tend to rise exponentially with an increase in dimensions.

## Price vs. Carat and Clarity
Clarity also factors into price. Typically, the search for a revolves around a specific size, so we shouldn’t expect clarity to be as strong a factor as size (carat). 
Clarity can affect changes in price: “IF” are the most expensive whereas “I1” are the least expensive clarity types.
Keeping carat weight constant, we see that diamonds with lower clarity are almost always cheaper than diamonds with better clarity. Clarity explains a lot of the variance found in price.
<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture7.png">   
</p> 
<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture8.png">   
</p> 


### Color and Price
Keeping carat size constant, it is a very clear division on the various diamond “color” categories similar to what we saw for “clarity”. Therefore, diamond color does have a clear influence on price.  Based on our domain expertise, we should have seen price dropping from color type D to J. But here again, we are up for a surprise.

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture10.png">   
</p> 

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture9.png">   
</p> 

### Depth:    Bivariate relationships
For a given depth, diamond prices fluctuate from high to low. Could be that there is no correlation between them.

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture11.png">   
</p> 
 
## Other Explorations:

## Vendors:  

The vendors are on different levels with regards to the middle man making a profit.

<p align="center">
   <img width="400" height="100" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture13.png">   
</p> 

<p align="center">
   <img width="400" height="100" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture12.png">   
</p> 

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture14.png">   
</p> 
 
The vendor that allowed for an increase in profit for the company as well as have higher quality of diamonds was the vendor #2.  The quality of the diamond appears to be higher with vendor #2 as well.
 
<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture15.png">   
</p> 

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture16.png">   
</p> 



When sending the training data through the ml predication model, I evaluated the “label price’ that the model came up with, with that of the actual price listed.  When purchasing from #2 we ended up with a higher profit margin then that of the other vendors.
Vendor #4 appears to have a large variance in quality of number #2.  Vendor #3 has the least variance in clarity.

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture17.png">   
</p> 



##  Step 5: Interpret results
I used Python, Excel, R, Tableau to demonstrate my diversity in technology.  Python was used for ml, excel pivot tables to work toward choosing diamonds, R for graphs, and exploratory analysis, and Tableau to make a few graphs.
Analysis of the machine learning model
Feature Scaling:
Divide the Dataset into Train and Test, so that we can fit the Train for Modelling Algos and Predict on Test.  Then Apply Feature Scaling although it's not necessary in this case. Split the data into train and test.
Algorithms and R2 Scores
Given the results, I would say that overfitting is probably at work here.  With Random Forest topping the highest R2 score and Ridge Regression coming out at 83%.  I tried to use this info to populate the offers column but couldn’t get it to work.

<p align="center">
   <img width="400" height="200" src="https://github.com/jacquie0583/Diamonds-price-acceptable/blob/main/Picture18.png">   
</p> 


##  CONCLUSIONS:
   1. Depth is inversely related to Price.  This could be as a result of the Depth percentage is too large or small the diamond will become 'dark' in appearance because it will no longer return an Attractive amount of light.
   2. The Price of the Diamond is highly correlated to Carat, and its Dimensions.
   3. The Weight (Carat) of a diamond has the most significant impact on its Price.  The larger a stone is, the Rarer it is, one 2 carat diamond will be more 'Expensive' than the total cost of two 1 Carat Diamonds of the same Quality.
   4. The Length(x) , Width(y) and Height(z) seems to be highly related to Price and even each other.
   5.  Purchases are on the Offers.csv document. Purchase Total:   $ 4,999,820
