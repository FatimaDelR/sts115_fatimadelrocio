################################################################
# This file contains questions for the midterm exam for STS115 #
# Winter Quarter, 2025.                                        #
#                                                              #
# This is exam is designed to provide you with the chance      #
# to demonstrate your understanding of both the concepts       #
# and syntax of the methods deployed by Data Scientists.       #
# As such, even if you are unable to provide working code      #
# for questions that require you to code, we encourage you     #
# to provide pseudo code and/or a textual explanation          #
# of your understanding of how one would approach the          #
# problem computationally, or even how the computer itself     #
# would approach the problem given your knowledge of how       #
# computers and programming languages work.                    #
#                                                              #
# Because problem solving is an essential part of being a      #
# Data Scientist, you are allowed to use any resources at      #
# your disposal to respond to the questions in this exam.      #
# This includes, but is not limited to, resources such as      #
# Google, Stack Overflow, the Course Reader, etc.              #
# The only restriction is that you may not use live chat,      # 
# messaging, email, discourse, Slack, or any other method of   # 
# real-time communication with another member of the course    #
# or any other person to formulate your response.              #
#                                                              #
# Questions appear as comments in this file.  As with the      #
# homework assignments, place your answers to each question    #
# immediately following the question prompt. Some questions    #
# require you to write computer code (R or Shell Script) as    #
# an answer and other questions ask you to provide text only   #
# explanations of computing and Data Science concepts.         #
# The phrase "[Text Answer]" appears immediately following     #
# each question that requires a text only answer. As noted     #
# above, you are encouraged to include text explanation of     #
# your code answers in all cases to increase your chances      #
# of earning partial credit for a question in the event that   #
# your code solution is incorrect.                             #
#                                                              #
# The exam duration is 1.5 hours.                              #                                                             #                                                              #
# Submit your completed exam and generated files via Github    #
# using the same workflow that you have used to submit your    #
# class homework.                                              #
################################################################


# Question 1. What is the command line symbol that provides 
# a shortcut to your "home" directory on your system.  For 
# example, what symbol would you use in place of "x" in the 
# command "cd x" if you wanted to use the cd command to move 
# into your home directory: 
"~" is the command line shortcut to use for home directory




# Question 2. Write R code to assign the value 7 to a variable "x":
x <- 7



# Question 3. Write R code that subtracts 3 from the variable "x" 
# and assigns the results to a variable "y":
y <- 3
x - y


# Question 4. Assign the values 1, 23, 6, 2, 19, 7 to a vector:

vector.a <- c(1, 23, 6, 2, 19, 7)


# Question 5. Run the code `“four” < “five”`. Paste the output 
# from R into a comment and explain why you think it provided 
# that result: [Text Answer] 
The numbers writen out are not recognized by the system, so it cant treat them like
integers, so its treating them as objects but we did not assign values
to “four” < “five”, these object have not value with in the code.




# Question 6. Write a for loop that loops through each element in
# the vector you created in your answer to Question 4 and prints
# each value to screen:
for (i in vector.a) {
  print(i)
}
This rsun through the indecies of vector.a and print each no matter the no.



# Question 7. Assign the value 3 to a variable "x" and write
# a conditional statement that tests whether x is less than 5.  
# If it is, print "Yay!" to screen:
x <- 3
if (x < 5){
  message ("Yay!")
}
  


# Question 8. Download the "wine_enthusiast_rankings.csv" file from
# the "data" directory in the "Files" area of the course Canvas
# website and then write code to load it into a variable called "wine_revs":
wine_revs <- read.csv("C:/Users/Fati and Ezra/Documents/sts115_fatimadelrocio/wine_enthusiast_rankings.csv.crdownload")

#Idealy this code would have both located the file and loaded into "wine_revs". I could not figure
#out how to download and read with the extesion crdownloads.




# Question 9.  Write code to determine the class of the "wine_revs"
# data object you created in Question 8 above:
class(wine_revs) would have returned objects types




# Question 10. Write code that returns the column/variable
# names of the "wine_revs" object:
colnames(wine_revs)
row.names(wine_revs)
This would print 2 seperate times but it would be possible to view the necessary
variable & obsersation.


# Question 11. Write code to load all observations from the
# "price" column/variable of the "wine_revs" object into
# a vector called "wine_prices":
wine_prices <- wine_revs(wine_revs$price) this would take all the data from previous
file rename it as a new vector "wine_prices"


# Question 12. Subset the "wine_revs" object to create a new 
# data.frame named "wine_revs_truncated" that contains all 
# observations for only the numeric ID, Points, Price, Variety, 
# and Winery columns/variables in "wine_revs": 

wine_revs_truncated <- df(wine_revs(Winery column), nrow(numeric ID, Points, Price, Variet)
This could call necessary column & rows from the previous vector and create 
data-frame which would name wine_revs_truncated

# Question 13. Save the "wine_revs_truncated" that you created 
# in Question 12 to your course working  directory 
# as an RDS file named "wine_revs_truncated.rds":
would it be possible to save data "save as" and select the rds extension.



# Question 14. Below is an R function that receives a single 
# argument (an integer) and returns the square root of that
# argument.  Write code (below the function) that calls the 
# function sending it the value 144 as its argument and assigns
# the returned result to a variable "z".  Note:  Be sure to run
# code of the function to load it into your environment before
# you try to call it in your answer or you won't be able to test
# your answer.
argument_1 <- 
getSqrt <- function(argument_1) {
  retval <- sqrt(argument_1) 
  return(retval)
}
The input or option for input for the argument_1 vector would have to be designated
first.



# Question 15. Write code that you would use to install the "fortunes"
# package onto your local machine and then load it into the working
# R environment:
install.packages(fortunes)



# Question 16. Why doesn't R automatically load every installed package when 
# it starts: [Text Answer]
It takes up too much space and would slow down R.



# Question 17. What command(s) create a repository and put that
# directory under git control:
git remote add origin git@github



# Question 18. List an advantage and a disadvantage for each of the
# following data file formats: [Text Answer]
#   
#     a. RDS files
small file but dificult to share data
#
#     b. CSV files
easy to read but information can be lost





# Question 19. Discuss what statisticians mean when they talk about
# finding the "center" of a data set: [Text Answer]
The center would be the mean of the total date, when using standard deviation
more than than 3 from the mean is an outlier.




# Question 20.  Explore the "wine_revs" data object that you created in 
# Question 8 above and calculate some summary statistics. Include in your 
# answer the code that you used to generate the statistics and outputs,
# a text explanation of the statistics you generated, and an interpretation
# of what those statistics mean.
#
# [Code Answer]
#
# [Text Answer]
Not sure confused by this question 



