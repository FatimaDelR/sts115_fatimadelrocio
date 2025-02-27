# 1. Interview 5 people from outside of STS115 and add their data to the “my_data” data
# frame from class to create a new data frame called “our_data”. You will use this for the
# subsequent questions. (Please do not interview someone who a classmate has already
# interviewed. You can call, Zoom, etc. but you need to actually talk to other human
# beings to complete this assignment!)
## to confirm working directory
getwd()
## to reassign csv as data.
data <- read.csv("my_data.csv")
## to check it worked
print(data)
## NEW COLUMN NAME <- data[#] do this for every column.
## data2 <- read.csv("my_data.csv") begin process with other data set same steps as before
## I stopped half way, figured there had to be a more efficient way.
### after verifying appropriate dir tell R to look in scr folder myfolder = "scr"
### creating allfiles calling list function and including 3 arguments, where to look, kind of file (all .csv), and all names 
### allfiles = list.files(path=myfolder, pattern="*.csv", full.names=TRUE)
### installed packages #install.packages(c("plyr" , "readr"))
###library(plyr), library(readr). ## Then comb_csv # = ldply(allfiles, read_csv)
### DID NOT WORK, tried another way comb_csv <- list.files(pattern="*.csv", full.names=TRUE), lapply(read_csv)
### Error in lapply(read_csv) : argument "FUN" is missing, with no default. After HOURS I realized the "easiest" way
### to combine would be adding the rows 1 by 1. I took the larger data and appended each row. 
## new_row <- list("RESPONSE", "MAJOR", "STUDY", "COFFE/FOOD", "PET", "DISTANCE", "TIME")
## new_row <- list("psychology", "PSC", "resource center", "peets", "dogs", ".6", "4")
## and updating every time data <- rbind(data, new_row) what previously worked in the console does not. 
##data2 <- read.csv("our_data.csv")
## data <- rbind(data, data2)

# 2. Come up with a yes/no or true/false question you’d have liked the survey to have
# asked. Make up these data for every subject in the survey, then create it as a logical
# vector and add it to the data frame.

# 3. Use a single function to return the class of each column in the data frame.

# 4. Look up how to use the function `max`. Use it to calculate the longest commute distance 
# and travel time.

# 5. Calculate travel speed across subjects as miles per minute. Assign this to a new vector 
# `mi.per.min` and add it to the data frame.

# 6. Use a function to return the total number of elements in mi.per.min.

# 7. Index/subset the vector `major` to get a new vector that contains the 3rd, 1st, 
# and 9th elements (in that order).

# 8. R’s `[` indexing operator accepts several different types of indexes, not only 
# positive whole numbers. For example, the operator accepts negative numbers as indexes. 
# Using the vector `places`, try out three to five different negative indexes. Based on the results,
# what do you think the [ operator does with negative indexes?

# 9. Consider the R code `c(3, 3.1, “4”, -1, TRUE)`.
# a. WITHOUT running the code, what data type you think the result will have and why?
# b. Now run the code to check whether your guess was correct. If it was not correct, explain what 
# the actual data type is and why. If your guess was correct, write a new, different line of code 
# that yields the same resulting data type.

# 10. Run the code `“four” < “five”`. Paste the output from R into a comment and explain why you 
# think it provided that result.

# 11. There are several major mistakes in the data entered in class.
# a. Describe in complete sentences what at least 2 of the errors are. Make some guesses as to how 
# those errors may have happened, and how they might affect analyses and/or re-use of these data.
# b. Pretend the data frame was too big for you to view it manually. List specific function calls you could use in R to help you find these mistakes programmatically.