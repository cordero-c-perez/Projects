# Times-Seris-Analysis - ARIMA Model

rm(list = ls(all.names = TRUE)) # clear global environment

par(mfrow = c(1,1)) # reset image window for basic plotting

# libraries
library(tidyverse)
library(TSA)
library(gridExtra) 
library(tseries)
library(forecast)


# load and convert data to a time series object
tsdata_original <- read_csv("~/Documents/R/RProjects-Public/Time-Series-Analysis-Data/ts_data_freq_12-Table 1.csv", col_names = FALSE)
tsdata_original <- tsdata_original$X1
tsdata <- tsdata_original[13:108] #extract section 2010 through 2017
tsdata <- ts(tsdata, frequency = 12, start = 2010) #assign years to 12 cycle structure


# view the time series data for structure
tsdata 

# questionable points: 2/2010, 3/2010 ~ accuracy seems off

# initial plot
plot(tsdata, type = "l", main = str_to_title("time series plot of raw data"),
     xlab = str_to_title("monthly 2010:2017"), 
     ylab = str_to_title("total trips"))


# key info: cycle = Freq = 12
# boxplot construction to explore seasonal trend
boxplot(tsdata ~ cycle(tsdata), main = str_to_title("seasonality of trip data by cycle"),
        xlab = str_to_title("cycle summary 2010:2017"),
        ylab = str_to_title("median across time"), col = "light blue")


# decompose data: with the exception of the questionable points the seasonal variation looks constant
tsdecomp <- decompose(tsdata, "multiplicative")
plot(tsdecomp)


# trend data as it shows a a decline in trips starting in 2012
plot(tsdecomp$trend, main = str_to_title("isolated trend of time series data"),
     xlab = str_to_title("months 2010:2017"),
     ylab = str_to_title("trend"))
abline(h = 15062412, lty = 2, col = "magenta") #intersection of downward trend
abline(v = 2012+(2/12), lty = 2, col = "magenta")#intersection "              "


# find a model - auto.arima updated December 2019 
trip_data_model <- auto.arima(tsdata, trace = TRUE)
trip_data_model


# create a forecast
trip_data_forecast <- forecast(trip_data_model, level = c(95), h = 12)
plot(trip_data_forecast, ylab = str_to_title("ridership"), xlab = "Time")
lines(tsdata_original)


# plot forecast
plot(trip_data_forecast$fitted, col = "red", main = str_to_title("model vs. original time series"),
     ylab = str_to_title("ridership"))
lines(tsdata)
legend(2016, 1.6e+07, legend=c("Model", "Original"),
       col=c("red", "black"), lty = 1:1)



# accuracy check
accuracy(trip_data_forecast, tsdata_original[109:120])


# compare forecast
predicted_2018_df <- as.data.frame(trip_data_forecast)
predicted_points_2018 <- predicted_2018_df$`Point Forecast`
actual_2018 <- tsdata_original[109:120]
plot(actual_2018, lty = 1, main = str_to_title("projected values vs. actual values"))
lines(actual_2018)
lines(predicted_points_2018, col = "red")
legend(8, 9400000, legend=c("Projected", "Actual"),
       col=c("red", "black"), lty = 1:1)


#Section 2----Residual Testing


# residuals testing
par(mfrow = c(3,1))
qqnorm(trip_data_model$residuals, frame = FALSE)
qqnorm(trip_data_model$residuals, frame = FALSE)
qqline(trip_data_model$residuals)
pacf(trip_data_model$residuals, main = "Residuals: PACF Look",lag.max = 20)


# standard function for residuals testing
(tsdiag(trip_data_model))


# density check
par(mfrow = c(1,2))
hist(trip_data_model$residuals, main = str_to_title("residual histogram"),
     xlab = "Spread")
plot(density(trip_data_model$residuals), main = "Density Shape", frame = FALSE)








