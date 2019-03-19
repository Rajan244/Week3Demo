# vector containg column names
col_names <- c("Date", "Country", "Gender", "Age","Q1", "Q2", "Q3", "Q4", "Q5")

#Enter data into vectors before constructing 
#the data Frames

date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99)

#

q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)

#NA is an inserted value 

q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

#construct a data frame using the data from all vectors above

managers <- data.frame(date_col, country_col,
                       gender_col, age_col, 
                       q1_col, q2_col, q3_col, q4_col, q5_col)
managers
#deatils about the datatypes 
str(managers)

head(managers, 10)

colnames(managers) <- col_names
#recode the 99 age as NA
attach(managers)
managers$Age[managers$Age == 99] <- NA
managers

#Create a new attribute called AgeCat and Set a value in AgeCat
#to the following if true
#<= 25 = young Age
#>=26 & <= 44 = Middle Age
#>= 45 = Elder Age

managers$AgeCat[managers$Age >= 45] <- "Elder"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[is.na(managers$Age)] <- "Elder"
managers

#Create a new column summary_col
#that contains a summary of each row


#calculate mean value for each row

mean_col <- mean(managers$Q1 + managers$Q2 + managers$Q3 + 
                   managers$Q4 + managers$Q5)
mean_col
managers <- data.frame(managers, mean_col)
managers

