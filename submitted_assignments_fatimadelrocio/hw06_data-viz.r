# Directions:

# This file contains homework questions for the lecture on data visualization.
# Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################


# 1. All of the questions in this homework use the Best in Show data set. 
#      The data is the file `dogs.rds`.

dogs = readRDS("C:/Users/Fati and Ezra/sts115_fatimadelrocio/dogs.rds")

#   a. Load the data set and use R functions to inspect the number of 
#      columns, number of rows, names of columns, and column data types.
#      [code completion + comprehension]

ncol(dogs)
nrow(dogs)
colnames(dogs)
# or
str(dogs)
which gives you all the above info plus data type.

#   b. Make a scatter plot that shows the relationship between height and
#      weight. In 2-3 sentences, discuss any patterns you see in the plot.
#      [code completion + comprehension + interpretation]

# ggplot(dogs, aes(x=height, y=weight)) + geom_point()
ggplot(dogs) +
  aes(x=height, y=weight) + 
  geom_point(color="blue")

There is a bit of a curve to the scatter plot. Mostly the increase
is gradual and as the height so does the weight.


#   c. Set the color of the points in the scatter plot from part b to a single 
#      color of your choosing. (Tip: Choose a color from one of the sites 
#      shared in the lesson (e.g. https://coolors.co/palettes/trending))
#      [code completion + comprehension]



# 2.
#   a. Make a bar plot that shows the number of dogs in each "group" of dogs.
#      [code completion + comprehension]

ggplot(dogs) +     # Create a bar graph of the counts of dogs in each group
  aes(x = group) +  # Use the existing 'group' column and sections these by type
  geom_bar(fill = "blue") +  # Create the bar plot w/ blue bars
  labs( x = "Group", y = "Count")  # Add labels


#   b. Are any groups much larger or smaller than the others? Describe what your 
#       visualization shows.
#      [interpretation]

Its failry easy to see the size difference with the exception of the 2 smallest
and largest by comparison to each other (large to large) they look to be the same
size


#   c. Fill in the bars based on the size of the dog, and set the position 
#       argument of the bar geometry to the one you think best communicates the 
#       data. Explain why you chose this position.
#      [code completion + comprehension + interpretation]

# Install and load the necessary libraries
install.packages("dplyr")  # If you haven't installed it yet
library(dplyr)  # Load dplyr for the pipe operator

# Filter dogs data to including only small and medium sizes 
#(using dplyr::filter())
dogs_filtered <- dplyr::filter(dogs, size %in% c("small", "medium"))

# Create a bar plot size(w/o Lg NA) and dog group
# played around with options a bit and ended with the side by side of availble 
# size data
ggplot(dogs_filtered) +
  aes(x = group, fill = size) +  # Fill bars based on the 'size' of the dog
  geom_bar(position = "dodge") +  # Position bars side-by-side (dodge)
  labs(x = "Dog Group", y = "Count of Dogs") +  # Labels
  scale_fill_manual(values = c("small" = "lightblue", "medium" = "skyblue"))  # Custom colors for small and medium


# 3.
#   a. Which geometry function makes a histogram? Use the ggplot2 website or
#      cheat sheet to find out.
#      [code completion + comprehension]

geom_histogram() 
# this defines the width of the bins and for controling the 
# level of granularity in the histogram.

#   b. Make a histogram of longevity for the dogs data. How long do most dogs
#      typically live? Explain in 1-2 sentences.
#      [code completion + comprehension + interpretation]

# histogram with dog group on x-axis and longevity on y-axis
#ggplot(dogs) +
#  aes(x = group, y = longevity, fill = group) +  # Group on x-axis and longevity on y-axis
#  geom_bar(stat = "identity", position = "dodge", color = "black", alpha = 0.6) +  # Create a bar plot
#  labs(title = "Longevity by Dog Group", x = "Dog Group", y = "Longevity (Years)") +  # Title and axis labels
#  theme_minimal() +  # Clean theme
#  scale_fill_manual(values = c("lightblue", "lightgreen", "lightpink", "lightyellow", "lightgray", "lightcoral", "lightskyblue"))  # Custom colors
This is incomplete, I had rows removed when running the code so the info needs
to be removed and the graph is not as easy to read. I ran out of time.

#   c. Inside the geometry function for histograms, play around with the bins
#      argument. (e.g. bins = 10, bins = 50). What do you think this is doing?
#      [code completion + comprehension]



# 4.
#   a. Modify your plot from Question 1 so that the shape of the points is
#      determined by the "group" of the dog. [code completion + comprehension]
#   b. Do height and weight effectively separate the different groups of dogs?
#      In other words, are there clear boundaries between the groups in the
#      plot (as opposed to being mixed together)? Are some groups better
#      separated than others?
#      [interpretation]
#   c. How might you improve the readability of this graph in order to visualize
#      this potential relationship more clearly?
#      [interpretation]


# 5. In a paragraph, answer the following questions for the “Best in Show” 
#    visualization (https://informationisbeautiful.net/visualizations/best-in-show-whats-the-top-data-dog/) 
#    that was built using the dogs dataset.
#    a. Who do you think is the intended audience for this data visualization? 
#        How do you think that could influence data collection, metrics calculations, 
#        and graphics choices?
#       [interpretation]
#    b. Who/what is included in this data visualization and who is left out? 
#        What do you think the impact of that decision could be on conclusions drawn
#        from viewers of the data visualization? 
#       [interpretation]
#    c. What could the potential impact of this visualization be on those 
#       who are left-out? [interpretation]



# 6. Select your favorite data visualization from https://viz.wtf/ 
# (that was not featured during class or in the reader). 
#   a. Type the direct url to the viz you selected here:
#   b. Describe in a few sentences the "data story" you think that this visualization 
#       is trying to tell.
#   c. In a paragraph, what makes this a "bad" visualization? Evaluate the visualization 
#       based on the visualization principles and perception rules discussed in class 
#       (i.e., Gestalt principles, plot type, accessibility, critical reading, etc.), 
#       and suggest a few changes to improve the graphic.
#   d. Describe in 1-2 sentences one thing that this visualization actually already does well.



# 7. Look at the plot posted with this assignment on Canvas.
#    a. Identify the marks and channels in this plot. Write them out for this answer
#    b. Write the code to generate this plot. (Hint: start with identifying the 
#        variables on each axis, then think about the types of channels).
#    c. Propose 4 improvements to the plot based on best practices.
#    d. Modify the code to implement at least two of those changes.


