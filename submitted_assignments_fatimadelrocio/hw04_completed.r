# Directions:

# This file contains homework questions for the lecture on working with files
# and data exploration. Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. Write out the file extension and explain what it means for the following
#    files: [comprehension]
#
#       a. `myscript.py`
The py extension indicates the file stores python code and is opened and read in 
the python program. The name of this file is myscript.
#
#       b. `/home/arthur/images/selfie.jpg`
The extension jpg informs us this is an image file, named selfie. 
The path to the file is under images, within aurthur from the home directory.
#
#       c. `~/Documents/data.csv`
CSV extension denotes comma-separated values, a file containing tabular data.
The name of the file is data saved under documents within the home directory.


# 2. Which command line utility can be used to determine the type of a file? 
# [code completion]
tools::file_ext() 
# this is part of the tool package and can be used to extract the file extension from 
# the file path string


# 3. Why is it a bad idea to explicitly call the `setwd` function within an R
#    script? [comprehension]
`setwd` should be used in the R console, saving it into the code could make the files
harder to read, understand and less portable to other computers.
#
# 4. List one advantage and one disadvantage for each of these formats:
# [comprehension]
#   
#     a. RDS files
Adv: RDS files offer the smallest possible way of storing data. 
Dis: These are not suitable for interchanging between machines. 
#
#     b. CSV files
Adv: CSV files contain text that it human-readable, great sending info back and forth. 
Dis: Info can be lost using this format
#
# 5. Why doesn't R automatically load every installed package when it starts?
# [comprehension]
If automatically loaded this would slow down R and require a lot of memory space. 
Loading packages as needed helps R run much more efficiently.
#
# 6. Load the dogs data from the `dogs.rds` file provided in lecture.
#
#     a. How many missing values are in the `height` column? 
#       [code completion + comprehension]

dogs <- readRDS("dogs.rds")
sum(is.na(dogs$height))
there are 13 missing values
# I've asked R to read "dogs.rds" and rename/assign this info to dogs
# asking for the sum/total of missing values from variable/column height from
# with in dogs  
#
#     b. Think of a strategy to check the number of missing values in every
#        column using no more than 3 lines of code. Hint: think about last
#        week's lecture. Explain your strategy in words. 
#       [code completion + comprehension]

colSums(is.na(dogs))

# We've now asked R to sum/total of every column and return every column 
# and its missing values. 


#     c. Which column has the most missing values? Try to solve this by
#        implementing your strategy from part b. If that doesn't work, you can
#        use the `summary` function to get the number of missing values in each
#        column as well as a lot of other information (we'll discuss this
#        function more next week).
#       [code completion + comprehension]
The same code as above gives us a view of all missing values and we can see
that weight has the most missing.
#
# 7. Use indexing to get the subset of the dogs data which only contains large
#    dogs that are good with kids (the category `high` in the `kids` column
#    means good with kids). [code completion + comprehension]

large_dogs_good_with_kids <- dogs[dogs$size == "large" & dogs$kids == "high", ]

# This code is working from data in dogs and looking only at the size column
# "large" value entry and the kids column with "high" value entry then created a
# subset called "large_dogs_good_with_kids"
#
# 8. With the dogs data:
#
#     a. Write the condition to test which dogs need daily grooming (the result
#        should be a logical vector). Does it contain missing values? 
#       [code completion + comprehension]

grooming_condition <- dogs$grooming == "daily"
any(is.na(dogs$grooming == "daily"))
# This conditional states if the grooming column in dogs list "daily
# I had trouble coming up with with a way to return missing values.

#     b. Use the condition from part a to get the subset of all rows containing
#        dogs that need daily grooming. How many rows are there?
#       [code completion + comprehension]
daily_dogs <- dogs[dogs$grooming == "daily", ]
nrow(daily_dogs)
#
#     c. Use the `table` function to compute the number of dogs in each
#        grooming category. You should see a different count than in part b for
#        daily grooming. What do you think is the reason for this difference?
#       [code completion + interpretation]

table(dogs$grooming)
# there is missing information, in some cases the only information provided is 
# the daily grooming,, that is why b. numbers are higher.
#
#     d. Enclose the condition from part a in a call to the `which` function,
#        and then use it to get the subset of all rows containing dogs that
#        need daily grooming. Now how many rows are there? Does the number of
#        rows agree with the count in part c?
#       [code completion + comprehension]

daily_grooming_dogs <- dogs[which(grooming_condition), ]
nrow(daily_grooming_dogs)
#  the which() function returns the indices of the dogs that need daily grooming 
# and then subsets the data based on those indices. We still get 23 returned 
# this coinsides with part C

# 9. Compute a table that shows the number of dogs in each grooming category
#    versus size. Does it seem like size is related to how often dogs need to
#    be groomed? Explain your reasoning. [code completion + interpretation]
table(dogs$grooming, dogs$size)
# yes, it seems like size of daily grooming is related to what we've seen previously.
# total daily grooming is 23.

# 10. Compute the number of dogs in the `terrier` group in two different ways:
#
#     a. By making a table from the `group` column. 
#       [code completion + comprehension]
table(dogs$group)
# This generates a frequency table of all groups in the dataset, 
# allowing you to easily count 

#     b. By getting a subset of only terriers and counting the rows.
#       [code completion + comprehension]

terrier_dogs <- dogs[dogs$group == "terrier", ]
nrow(terrier_dogs)
# This subsets the dataset to only include terriers and counts the number of rows

#     c. Computing the table is simpler (in terms of code) and provides more
#        information. In spite of that, when would indexing (approach b) be more
#        useful? [comprehension + interpretation]
Indexing is most useful when there is a need to perform further calculations on 
the subset beyond just counting.


