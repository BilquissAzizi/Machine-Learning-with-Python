## Multiple Linear Regression ####

# Importing the dataset
dataset = read.csv('50_Startups.csv')


# Encoding categorical data
dataset$State = factor(dataset$State, 
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Traning set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)


# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)


### The results indicate that R&D Spend has a strong positive and statistically 
###    significant impact on Profit (p-value < 0.001), while Administration and 
###    Marketing Spend are not significant predictors (p-values > 0.1). The 
###    categorical variable State also does not show a significant impact. The 
###    model explains about 94.25% of the variance in profit (Adjusted R-squared = 0.9425), 
###    which suggests a good fit overall. 




# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)
summary(regressor)


# Remove the predictor
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)
summary(regressor)


# Remove the predictor
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset)
summary(regressor)


# Remove the predictor
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor)



### Through the backward elimination process, the final model includes only R&D Spend 
###    as a predictor, which is highly significant (p-value < 0.001) and explains about 
###    94.54% of the variance in profit (Adjusted R-squared = 0.9454). This indicates 
###    that R&D Spend is the most crucial factor influencing profit, while other variables 
###    like State, Administration and Marketing Spend do not significantly improve the model's 
###    performance. The final model is both simpler and highly predictive.