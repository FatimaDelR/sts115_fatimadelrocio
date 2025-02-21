# Directions:

# This file contains homework questions for the lecture on data forensics
# and statistics. Questions appear as comments in the file. 

# The first four questions are narrative only, meaning you can just write an
# answer and do not need to write computer code. For other questions, please 
# see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. What is Deviation a measure of? [comprehension]
# Our reader states it is the  "sq root of the average squared distance to the 
# mean". It is a measure of how much data points deviate from the mean of the data.




# 2. What is Standard Deviation? [comprehension]
Reader: "Statisticians rule of thumb - any value more than 3 standard deviations 
away from the mean is an outlier". A lower Standard Deviation means data is closer
to the mean.


# 3. Load the Craigslist data and then compute:
#
#     a. The number of rows and columns. [code completion + comprehension]

cl_data <- read.csv("cl_rentals.csv")
# After importing file this ask R to read the csv filed called "cl_rentals.csv"
# and store it within data.

dim(cl_data)
# this code returns the returns (no. of rows, no. of columns)

#     b. The names of the columns. [code completion + comprehension]

colnames(cl_data)

# We are asking for the column-names from within our cl_data'

#     c. A structural summary of the data. [code completion + comprehension]

str(cl_data)

# This function returns the structural summary e.g. for exmp. no. of rows, no. 
# and names of columns, kind of data in each column, and sample values

#     d. A statistical summary of the data. [code completion + comprehension]
summary(cl_data)
# the summary function returns statistics for each column, choosing based on the 
# kind of data in the column. For numbers, this is generally the mean, median, 
# and quantiles. For categories, this is the frequencies. 

# 4. The goal of this exercise is to compute the number of missing values in
#    every column of the Craigslist data.
df <- read.csv("cl_rentals.csv")
list2env(df, .GlobalEnv)
# I created a df from the csv file then automatically created vectors for all 
# columns by using list2env

#    a. Write a function called `count_na` that accepts a vector as input and
#       returns the number of missing values in the vector. Confirm that your
#       function works by testing it on a few vectors. 
#       [code completion + comprehension]

count_na <- function(vector) {
  return(sum(is.na(vector)))
} 
# this function will call a vector as the column name so when I call to print
# I can refer to the vector by the column name below are the tested vectors 

print(count_na(city))
print(count_na(bedrooms))
print(count_na(laundry))
print(count_na(pets))
#
#    b. Test your function on the `pets` column from the Craigslist data. The
#       result should be 14. If you get an error or a different result, try
#       part a again.
#       [code completion + comprehension]

count_na(cl_data$pets)
# here I am using the column reference from the original cl_data

#    c. Use an apply function to apply your function to all of the columns in
#       the Craigslist data set. Include the result in your answer.
#       [code completion + comprehension]

na_counts <- sapply(cl_data, count_na)
print(na_counts)
# here we've taken the arguments cl_data & count_na telling sapply to give this 
# a new vector named na_counts 

#    d. Which columns have 0 missing values? [comprehension]
zero_na_cols <- names(na_counts[na_counts == 0])
print(zero_na_cols)


# 5. What time period does this data cover? Hint: convert the `date_posted`
#    column to an appropriate data type, then use the `range` function.
#    [code completion + comprehension]
cl_data$date_posted <- as.Date(cl_data$date_posted)
date_range <- range(cl_data$date_posted)
print(date_range)
# using the as.Date funtion we ask it to look to the original cl_data and look at the 
# date_posted by using "$" and create a new vector - cl_data$date_posted, then take
# the range of the newly created vector and call that date_range last we'll print
# date_range

# 6. Compute the mean price for each pets category. Based on the means, are
#    apartments that allow pets typically more expensive? Explain, being
#    careful to point out any subtleties in the result.
#    [code completion + comprehension + interpretation]
mean_prices <- aggregate(price ~ pets, data = cl_data, FUN = mean)
print(mean_prices)
# because we need the mean price for all apartment types that allow pets(cats, 
# dogs, both or none) we want a summary of these individual statistics. It appears
# at first glance that places that allow dogs are more expensive but this doest account 
# for exmp sg footage. Its possible these place are larger and likewise for cats these
# could be smaller and account for the price difference.

# 7. The `sort` function sorts the elements of a vector. For instance, try
#    running this code:
#
#x = c(4, 5, 1)
#sort(x)
#    
#    Another way to sort vectors is by using the `order` function. The order
#    function returns the indices for the sorted values rather than the values
#    themselves:
#
#    x = c(4, 5, 1)
#    order(x)
#
#    These can be used to sort the vector by subsetting:
#
#    x[order(x)]
#    
#    The key advantage of `order` over `sort` is that it can also be used to
#    sort one vector based on another, as long as the two vectors have the same
#    length.
#    
#    Create two vectors with the same length, and use one to sort the elements
#    of the other. Explain how it (should) work.
#    [code completion + comprehension]

vector1 <- c(10, 20, 5)
vector2 <- c("A", "B", "C")
# Create two vectors
vector2[order(vector1)]
# We've taken vector2 and matched it to vector1 (index 1-3) 
# the return is numerical value of V1 sorted from lowest to greatest reflected in
# V2


# 8. Use the `order` function to sort the rows of the Craigslist data set
#     based on the `sqft` column. [code completion + comprehension]
#
#     a. Compute a data frame that contains the city, square footage, and price
#        for the 5 largest apartments. [code completion + comprehension]

sorted_indices <- order(cl_data$sqft, decreasing = TRUE)
top_5 <- cl_data[sorted_indices[1:5], c("city", "sqft", "price")]
print(top_5)
# Here we are sorting by sqft and get top 5 largest

#     b. Do you think any of the 5 square footage values are outliers? Explain
#        your reasoning. [interpretation]
Out of the values in the top 5 2 are much higher than the majority of 
the dataset, I would considered outliers.
#
#     c. Do you think any of the 5 square footage values are erroneous
#        (incorrect in the data)? [interpretation]
I would consider one of these erroneous, its hard to believe an apartment could be
88900 sd ft, not impossible but highly unlikely.
