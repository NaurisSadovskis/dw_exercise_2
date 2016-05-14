library(dplyr)
library(tidyr)

# 0. load the data
titanic <- tbl_df(read.csv("./titanic_original.csv", sep = ","))

# 1. embarkation - fill in the missing values
titanic$embarked[titanic$embarked == ""] <- "S"
titanic$embarked <- droplevels(titanic$embarked) # removing the empty ("") level.

# 2. average age
avg_age <- mean(titanic$age, na.rm = TRUE)
avg_age <- round(avg_age, digits = 1)
titanic$age[is.na(titanic$age)] <- avg_age
# an alternative method might be to populate missing values with a random numbers from a specific range - e.g 20:40. 

# 3. lifeboats
titanic$boat[titanic$boat == ""] <- NA

# 4. cabins
titanic$has_cabin_number <- as.numeric(grepl("^[A-Z]", titanic$cabin))

# 5. save & export .csv
write.csv(titanic, "titanic_clean.csv")
