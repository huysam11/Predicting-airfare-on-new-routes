# Predicting Airfare on New Routes 
First Step : We have to partition the original dataset into training(60%) and validation sets(40%) .The model will be fit to the training data and evaluated on the validation set
# Linear regression model estimation 
![image](https://user-images.githubusercontent.com/99052999/153841684-20b19698-77eb-4df6-9ac0-67e7a9cb6417.png)
Based on this estimation results we have: 
Fare = -23.95 + 7.04*COUPON – 1.80*NEW + 0.01*HI + 0.01*S_INCOME + 0.00*E_INCOME + 0.00*S_POP + 0.00*E_POP + 0.07*DISTANCE – 0.00*PAX – 33.71*VACATION_YES – 39.39*SW_YES + 19.16*SLOT_CTRL + 22.93*GATE_CONS
 
We are going to predict how mile and flight run by South affect the average airfare prices 
# Prediction on mile
If other variables are held constant (all else being equal), one mile increase in distance increases fare by $0.07 on average.

# Prediction on a flight run by SouthWest 
If other variables are held constant (all else being equal), a flight run by Southwest Airlines is $39.39 cheaper than other airlines on average

# Backward model 
We used Backward variable selection to reduce the number of predictors 
![image](https://user-images.githubusercontent.com/99052999/153843046-4476ee13-0a48-49a9-8cdc-eee0e7c760db.png)
Variables COUPON and NEW are removed by backward elimination

# Comparision with backward model f
We focused on RMSE and Adjusted R^2
Result: The two models perform similarly. It shows that even without COUPON and NEW, we can achieve the same level of performance. In other words, COUPON and NEW are not useful in prediction of FARE. 

# Suggestion 
*Vacation and route that Southwest will have low fares therefore, companies should invest more flights into routes that have these 2 factors. 
*New carriers will also have lower fares. There will be more coupon if fare is lower.  
*The place has more population will sell more tickets. They should price based on these factors. By giving more coupon and put more route into high population city. 
*The high income city will have a higher fares therefore, companies should invests more route into these cities. 
