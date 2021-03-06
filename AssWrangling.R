#importing libraries
library(dplyr)
library(tidyr)
library(stringr)
library(urltools)
library(textclean)
library(janitor)

# reading the csv file using read.csv
df <- read.csv("fake_job_postings.csv")

# checking for all the attributes name
f <-colnames(df)
print(f)

# appending attributes in which we need to make changes
df2 <- df[c("company_profile", "description", "requirements", "benefits")]

# replacing all the special characters and URL from the data
test_edited.1 <- str_replace_all(string = df2$company_profile, pattern = "[;�Y�-�΢��???T:)]", replacement = "")
test_edited.1 <- gsub("#\\w+", "", test_edited.1)
test_edited.1 <- str_replace_all(string = test_edited.1, pattern = "[;�Y��ι-΢�???T#:)]", replacement = "")


test_edited.2 <- str_replace_all(string = df2$description, pattern = "[;�Y�-�ιο�???T:)]", replacement = "")
test_edited.2 <- gsub("#\\w+", "", test_edited.2)
test_edited.2 <- str_replace_all(string = test_edited.2, pattern = "[;�Y�???T�-�ιο#:)]", replacement = "")


test_edited.3 <- str_replace_all(string = df2$requirements, pattern = "[;�Y�-��ιο???T:)]", replacement = "")
test_edited.3 <- gsub("#\\w+", "", test_edited.3)
test_edited.3 <- str_replace_all(string = test_edited.3, pattern = "[;�Y�???�T#-�ιο:)]", replacement = "")


test_edited.4 <- str_replace_all(string = df2$benefits, pattern = "[;�Y��ι-�ο???T:)]", replacement = "")
test_edited.4 <- gsub("#\\w+", "", test_edited.4)
test_edited.4 <- str_replace_all(string = test_edited.4, pattern = "[;�Y��΢�-ο???T#:)]", replacement = "")

#appending the results in list
my_list <- list(test_edited.1, test_edited.2, test_edited.3, test_edited.4)
#combining the list of data together in myDf
myDf <- as.data.frame(do.call(cbind, my_list))

#appending the combined data in main data frame
df$company_profile <- test_edited.1
df$description <- test_edited.2  
df$requirements <- test_edited.3
df$benefits <- test_edited.4

# Saving the final data in new csv file
write.csv(df, file = 'Wrangle_data_fake_job_postings.csv')

          