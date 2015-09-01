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