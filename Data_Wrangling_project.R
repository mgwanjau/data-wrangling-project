
install.packages("tidyverse")
library(tidyverse)

#Download the dataset from https://bit.ly/2ZlpzjF

telcom_df <- read_csv("https://bit.ly/2ZlpzjF")
head(telcom_df, 5)

#ize of the dataset

dim(telecom_df)

#Get column names

names(telcom_df)

#The `glimpse()` function displays the variable names, datatypes and first few records of the dataset

glimpse(telcom_df)

#Strip the leading and trailing spaces
names(telcom_df) <- trimws(names(telcom_df), which = c("both"))
names(telcom_df)

#column names to have lowercase characters
names(telcom_df) <- toupper(names(telcom_df))
names(telcom_df)

#drop the CUSTOMERID column
telcom_df = select(telcom_df, -c("CUSTOMERID"))
head(telcom_df, 2)

#extract the duplicated records from the dataset
telcom_df[duplicated(telcom_df), ]

#total missing values in each column
colSums(is.na(telcom_df))

#Drop all rows containing missing values
na.omit(telcom_df)

#how many customers churned
telcom_df %>%
  group_by(CHURN) %>%
  summarise(count=n())

#comparison between male and female churning
telcom_df %>%
  group_by(GENDER, CHURN) %>%
  summarise(count=n())

#distribution of churn by seniorcitizen
telcom_df %>%
  group_by(SENIORCITIZEN, CHURN) %>%
  summarise(count=n())

#distribution of churn by multiple lines
telcom_df %>%
  group_by(MULTIPLELINES, CHURN) %>%
  summarise(count=n())

#distribution of churn by tech support
telcom_df %>%
  group_by(TECHSUPPORT, CHURN) %>%
  summarise(count=n())


Observations:
  
#There is no significant difference in churn rate between male and female subscribers. So this is not an area management needs to worry about.
#Majority of the customers are not senior citizens so this makes this dataset biased and hard to identify whether being a senior citizen affects churn rate.
#No significant churn rate based on multiple lines 
