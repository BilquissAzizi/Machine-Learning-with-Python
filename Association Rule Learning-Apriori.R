#### Association Rule Learning ####

## Apriori

# Data Preprocessing 
install.packages('arules')
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)


# Training Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.003, confidence = 0.4))


# Visualizing the results
inspect(sort(rules, by = 'lift')[1:10])

#     lhs                                              rhs                 support     confidence coverage    lift     count
# [1]  {mineral water, whole wheat pasta}            => {olive oil}         0.003866151 0.4027778  0.009598720 6.115863 29   
# [2]  {spaghetti, tomato sauce}                     => {ground beef}       0.003066258 0.4893617  0.006265831 4.980600 23   
# [3]  {french fries, herb & pepper}                 => {ground beef}       0.003199573 0.4615385  0.006932409 4.697422 24   
# [4]  {cereals, spaghetti}                          => {ground beef}       0.003066258 0.4600000  0.006665778 4.681764 23   
# [5]  {frozen vegetables, mineral water, soup}      => {milk}              0.003066258 0.6052632  0.005065991 4.670863 23   
# [6]  {chocolate, herb & pepper}                    => {ground beef}       0.003999467 0.4411765  0.009065458 4.490183 30   
# [7]  {chocolate, mineral water, shrimp}            => {frozen vegetables} 0.003199573 0.4210526  0.007598987 4.417225 24   
# [8]  {frozen vegetables, mineral water, olive oil} => {milk}              0.003332889 0.5102041  0.006532462 3.937285 25   
# [9]  {cereals, ground beef}                        => {spaghetti}         0.003066258 0.6764706  0.004532729 3.885303 23   
# [10] {frozen vegetables, soup}                     => {milk}              0.003999467 0.5000000  0.007998933 3.858539 30  








