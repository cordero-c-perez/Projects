Time Series Analysis of NYC Taxicab Ridership
================
<center>

C. Perez

</center>

 

## Project Description

This analysis evaluates the effectiveness of a time series model in
forecasting taxi ridership. Typically ridership data is not available in
a time series format, however, the data that is available (individual
trips per month) can be aggregated to cast as a time series object. This
analysis does just that by taking monthly ridership data produced by the
City ranging from 2010 through 2018, aggregating the number of trips by
month, and storing this as a time series object in R. An exploratory
analysis is conducted inclusive of appropriate decomposition to identify
a suitable model (ARIMA in this case). The data is then split into
training (2010-2017) and test(2018) sets, modeled on the training data,
tested on the testing data, etc. The final result includes necessary
error/residual testing and charts for comparison. The “tsa\_main.md”
file is viewable directly in github to see the full analysis.  
 

## Description of Files

#### tsa\_main.rmd

A markdown file with an output converted to “.pdf” for github viewer
compatibility.

#### tsa\_main.pdf

Viewable output of tsa\_main.rmd file.

#### tsa\_main.r

A script file containing the code used in the “.rmd” files.

#### README.rmd

This file just creates a README.md file for the repository.

###### Note: the data is not provided in the repository as it is large and publicly accessible.
