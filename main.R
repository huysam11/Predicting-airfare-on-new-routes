install.packages("forecast")
library("forecast")

df <- read.csv("Airfares.csv")
dim(df)
names(df)

selected.var <- c("S_CODE","S_CITY","E_CODE","E_CITY","COUPON","NEW","VACATION_YES",
                  "VACATION_NO","SW_YES","SW_NO","HI","S_INCOME",
                  "E_INCOME","S_POP","E_POP","SLOT_FREE","SLOT_CTRL","GATE_FREE",
                  "GATE_CONS","DISTANCE","PAX","FARE")
df$FARE = as.numeric(gsub("\\$","",df$FARE)) #REMOVE $ SIGN
# training/ test databases
set.seed(1)  
train.index <- sample(c(1:638), 383)  
train.df <- df[train.index, selected.var]
valid.df <- df[-train.index, selected.var]
dim(train.df)
dim(valid.df)

#Building multiple linear regression model
model1<- lm(FARE ~ COUPON + NEW + VACATION_YES + SW_YES + HI + S_INCOME + E_INCOME + S_POP + E_POP 
            + SLOT_CTRL + GATE_CONS + DISTANCE + PAX,data = train.df) 
summary(model1)

#used"backward" variable selection to reduce the number of predictors
model1.step <- step(model1, direction = "backward")
sum_back<-summary(model1.step)
#get prediction accuracy for both models 
model1.step.pred <- predict(model1.step, valid.df)
accuracy(model1.step.pred, valid.df$FARE)
model1.pred <- predict(model1, valid.df)
accuracy(model1.pred, valid.df$FARE)
