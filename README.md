## Projects Repo  
###### Note: all data is not provided in the repository. Links are available in the README when a link is not available in the script itself or the report. Some data is available via fork and run.

This repository houses complete data science projects. The folder description includes the associated project
description and each folder has a report (either .pdf or .ipynb) that can be viewed directly on github.


## Folders

#### [Time Series Analysis of NYC Taxicab Ridership]()

This analysis evaluates the effectiveness of a time series model in
forecasting taxi ridership. Typically ridership data is not available in
a time series format, however, the data that is available (individual
trips per month) can be aggregated and structured as a time series object. This
analysis does just that by taking monthly ridership data produced by the
City ranging from 2010 through 2018, aggregating the number of trips by
month, and storing this as a time series object in R. An exploratory
analysis is conducted inclusive of appropriate decomposition to identify
a suitable model (ARIMA in this case). The data is then split into
training (2010-2017) and test (2018) sets, modeled on the training data,
tested on the testing data, etc. The final result includes necessary
error/residual testing and charts for comparison (“tsa_nyc_taxi_ridership.pdf”)


