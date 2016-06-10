# CodeBook

The code book explains the resulting data  in tidy.txt.

## Idss

* subject - ID of the  subject
* activity - Type of activity performed 


## Activity Labels

* WALKING: subject was walking 
* WALKING_UPSTAIRS: subject was walking  upstairs
* WALKING_DOWNSTAIRS: subject was walking down a staircase 
* SITTING: subject was sitting 
* STANDING: subject was standing  
* LAYING: subject was laying down  


Transformations in the analysis script 
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