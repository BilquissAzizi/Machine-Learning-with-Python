#### Association Rule Learning ####

## Eclat

# Data Preprocessing 
# install.packages('arules')
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)


# Training Eclat on the dataset
rules = eclat(data = dataset, parameter = list(support = 0.004, minlen = 2))



# Visualizing the results
inspect(sort(rules, by = 'support')[1:10])

#     items                              support    count
# [1]  {mineral water, spaghetti}         0.05972537 448  
# [2]  {chocolate, mineral water}         0.05265965 395  
# [3]  {eggs, mineral water}              0.05092654 382  
# [4]  {milk, mineral water}              0.04799360 360  
# [5]  {ground beef, mineral water}       0.04092788 307  
# [6]  {ground beef, spaghetti}           0.03919477 294  
# [7]  {chocolate, spaghetti}             0.03919477 294  
# [8]  {eggs, spaghetti}                  0.03652846 274  
# [9]  {eggs, french fries}               0.03639515 273  
# [10] {frozen vegetables, mineral water} 0.03572857 268  