# example taken from http://trevorstephens.com/post/72916401642/titanic-getting-started-with-r

# load the training dataset
train <- read.csv("./data/train.csv", stringsAsFactors=FALSE)

# examine the Survival Counts and Rates
table(train$Survived)
prop.table(table(train$Survived))

# Conclusion, the majority of individuals in the training dataset had Survived=0
# So for our first Kaggle submission let's predict on the test set all individuals Survived=0
test <- read.csv("./data/test.csv", stringsAsFactors=FALSE)

submit1 <- data.frame(PassengerId = test$PassengerId, Survived = rep(0, nrow(test)))

write.csv(submit1, file = "./submissions/submit1/submit1.csv", row.names = FALSE)

#### get the package party - Keith Brown

# OK, so the kaggle tutorial shows that just predicting everyone as dead
# (Survived = 0) produces over 60% accuracy given the fact that about 62%
# of people died. Let's practice some R and simply sample the correct 
# proportion of rows (.616161) and then assign them as dead.

# create a new dataframe for submission 2 with all surviving (Survived=1)
submit2 <- data.frame(PassengerId = test$PassengerId,
                      Survived = rep(1, nrow(test)))

sampleVector <- (1:nrow(test)) #create vector equal to length of test set
size <- round((549/891)*nrow(test)) #number of dead to maintain proportion

# We will use a seed to ensure reproducibility then select the passengers
# to code as dead
set.seed(757)
dead <- sample(sampleVector, size=size) #picks passengers to recode as 0

submit2[dead, ]$Survived <- 0

# examine the Survival Counts and Rates
table(submit2$Survived)
prop.table(table(submit2$Survived))

write.csv(submit2,
          file = "./submissions/submit2/submit2.csv", row.names = FALSE)
