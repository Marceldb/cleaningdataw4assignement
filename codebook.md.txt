
#Load data, Merging  training and test sets  

xtrain,ytrain.trainsub: info about training data.
xtest, ytest, testsub: infon about testing data.
using cbind() and rbind to merge the two sets

#Mean and standard deviation
grep() will give the position for mean() and std()
  
#Descriptive activity names  
Factor() will replace numbers with activity desc
  
gsub() will characters where needed
  
# Creating the tidy set
I use functions group_by()  and summarise_each() from the dplyr package 