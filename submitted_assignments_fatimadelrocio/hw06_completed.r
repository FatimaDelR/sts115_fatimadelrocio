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
library(ggplot2)


#   a. Load the data set and use R functions to inspect the number of 
#      columns, number of rows, names of columns, and column data types.
#      [code completion + comprehension]

ncol(dogs)
nrow(dogs)
colnames(dogs)
# and/or
str(dogs) # this gives you all the above info plus data type.


#   b. Make a scatter plot that shows the relationship between height and
#      weight. In 2-3 sentences, discuss any patterns you see in the plot.
#      [code completion + comprehension + interpretation]

ggplot(dogs) + 
  aes(x=height, y=weight) +
  geom_point()
# There is a bit of a curve to the scatter plot. Mostly the increase
# is gradual and as the height so does the weight.


#   c. Set the color of the points in the scatter plot from part b to a single 
#      color of your choosing. (Tip: Choose a color from one of the sites 
#      shared in the lesson (e.g. https://coolors.co/palettes/trending))
#      [code completion + comprehension]

ggplot(dogs) +
  aes(x=height, y=weight) + 
  geom_point(color="blue")
# Same code plus the color we're instructing, with the geom function 
# to add the blue color.



# 2.
#   a. Make a bar plot that shows the number of dogs in each "group" of dogs.
#      [code completion + comprehension]

ggplot(dogs) +     # Create a bar graph of the no. "count" of dogs in each group
  aes(x = group) +  # Use the existing 'group' column and sections these by type
  geom_bar(fill = "blue") +  # Create the bar plot w/ blue bars
  labs( x = "Group", y = "Count")  # Add labels


#   b. Are any groups much larger or smaller than the others? Describe what your 
#       visualization shows.
#      [interpretation]
#Its fairly easy to see the size difference with the exception of the 2 smallest
#and largest by comparison to each other (large to large) they look to be the same
#size


#   c. Fill in the bars based on the size of the dog, and set the position 
#       argument of the bar geometry to the one you think best communicates the 
#       data. Explain why you chose this position.
#      [code completion + comprehension + interpretation]

# played around with options a bit and ended with the side by side of size
ggplot(dogs) +
  aes(x = group, fill = size) +  # Filled based on the 'size' of the dog
  geom_bar(position = "dodge") +  # Position bars side-by-side (dodge)
  labs(x = "Dog Group", y = "Count of Dogs") +  # Labels
  scale_fill_manual(values = c("small" = "lightblue", "medium" = "skyblue", "large" = "dark blue"))  
# Custom colors for sizes



# 3.
#   a. Which geometry function makes a histogram? Use the ggplot2 website or
#      cheat sheet to find out.
#      [code completion + comprehension]
geom_histogram() 
# this defines the width of the bins and for controlling the 
# level of granularity in the histogram.


#   b. Make a histogram of longevity for the dogs data. How long do most dogs
#      typically live? Explain in 1-2 sentences.
#      [code completion + comprehension + interpretation]
# Id say most dogs live in the 12-15 year range, however the dog groups 
# are lumped together so its hard to say precisely

# histogram with dog group on x-axis and longevity on y-axis
ggplot(dogs) +
  aes(x = group, y = longevity, fill = group) +  # Group on x-axis and longevity on y-axis
  geom_bar(stat = "identity", position = "dodge", color = "black", alpha = 0.6) +  # Create a bar plot
  labs(x = "Dog Group", y = "Longevity (Years)") +  # Axis labels
  theme_minimal() +  # Clean theme
  scale_fill_manual(values = c("lightblue", "lightgreen", "lightpink", "lightyellow", "lightgray", "lightcoral", "lightskyblue"))  # Custom colors


#   c. Inside the geometry function for histograms, play around with the bins
#      argument. (e.g. bins = 10, bins = 50). What do you think this is doing?
#      [code completion + comprehension]
#This changes the column/bars width in the graph. The large the bins no. 
#the thinner the bin is.



# 4.
#   a. Modify your plot from Question 1 so that the shape of the points is
#      determined by the "group" of the dog. [code completion + comprehension]

# Customizing shapes beyond the default 6
ggplot(dogs, aes(x = height, y = weight, shape = group)) + 
  geom_point() +  # Points plotted, shape determined by 'group'
  scale_shape_manual(values = c(1, 2, 3, 4, 5, 6, 7)) +  # Manually assign shapes for each group
  labs(title = "Dog Height vs. Weight by Group", x = "Height", y = "Weight") + 
  theme_minimal()


#   b. Do height and weight effectively separate the different groups of dogs?
#      In other words, are there clear boundaries between the groups in the
#      plot (as opposed to being mixed together)? Are some groups better
#      separated than others?
#      [interpretation]
#for the most part there are clear boundaries, the individual shapes help to
#to distinguish them from the others, unless there is an overlap.


#   c. How might you improve the readability of this graph in order to visualize
#      this potential relationship more clearly?
#      [interpretation]
#I would use the jitter function that prevents overlapping points.



# 5. In a paragraph, answer the following questions for the “Best in Show” 
#    visualization (https://informationisbeautiful.net/visualizations/best-in-show-whats-the-top-data-dog/) 
#    that was built using the dogs dataset.
#    a. Who do you think is the intended audience for this data visualization? 
#        How do you think that could influence data collection, metrics calculations, 
#        and graphics choices?
#       [interpretation]
#  This data visualization may have been created for those looking to purchase dogs, maybe those 
#  interested raising show dogs. It appears that all dogs are reflected however 
#  we dont know how the missing data values were managed. Seems to me the majority of metrics
#  included have to do with overall expenses, with the exception of intelligence.
#  Im guessing food_cost was some how converted to appetite.


#    b. Who/what is included in this data visualization and who is left out? 
#        What do you think the impact of that decision could be on conclusions drawn
#        from viewers of the data visualization? 
#       [interpretation]
#  Its possible popularity & popularity_all were combined. The visualization key 
#  list intelligence, cost, longevity, grooming, ailment and appetite but its not so easy  
#  to read these measures from the graph. The visualization is missing Kids, megarank, 
#  megarank_kids, weight & height. Its possible lifetime cost was left out completely
#  or rolled into some other metric.


#    c. What could the potential impact of this visualization be on those 
#       who are left-out? [interpretation]
#  if this is a chart to assit in purchasing a dog, knowing how the dogs behave w/ 
#  children could be of high importance if the family has kids. Lifetime cost would 
#  also be important to the average family. 


# 6. Select your favorite data visualization from https://viz.wtf/ 
# (that was not featured during class or in the reader). 
#   a. Type the direct url to the viz you selected here:

# https://viz.wtf/image/634334417095098368


#   b. Describe in a few sentences the "data story" you think that this visualization 
#   is trying to tell.
#  I think the visualization is trying to show the way people (w/in the US 2 party system) 
#  are voting in a given income bracket. 


#   c. In a paragraph, what makes this a "bad" visualization? Evaluate the visualization 
#       based on the visualization principles and perception rules discussed in class 
#       (i.e., Gestalt principles, plot type, accessibility, critical reading, etc.), 
#       and suggest a few changes to improve the graphic.

# Red and blue are among the most common colors ppl are color blind to, this chart has both.
# However if you get past that because the bars are the same size its easy to see the 
# distribution w/in the bar. Unfortunately the income levels are repeated in slightly
# different ways such as 50k-99k and 50k or more followed by under 100k. Sticking with 
# the 1st would provide the most detail and eliminate redundancy. W/in the bar percentages
# should be out of 100 not 59+37 for example. 


#   d. Describe in 1-2 sentences one thing that this visualization actually already does well.

# The info is easy to read like the larger part of the bar has the larger 
# no. associated to it. 



# 7. Look at the plot posted with this assignment on Canvas.
#    a. Identify the marks and channels in this plot. Write them out for this answer
# Scatter plot titled "Dogs", marks and channels:
# Marks are points (0D): This visualization has points(shapes), representing dog groups.

Channels: 
Position
X-axis encodes "Longevity"
Y- axis encodes "lifetime_cost"

Color: Different colors are used for each dog groups.

Shape: Different shapes are used for each dog groups:
Orange-Circles for herding dogs; Yellow-Triangles for hound dogs
Green-Squares for non-sporting dogs; turquoise-Plus signs for sporting dogs
light_Blue-Box_w/_X-mark for terriers dogs; Purple-Asterisks for toy dogs
Additional shape for working dogs is missing

The legend on the right side clarifies the mapping between colors/shapes and dog groups.


#    b. Write the code to generate this plot. (Hint: start with identifying the 
#        variables on each axis, then think about the types of channels).
# Create the plot with named shapes and colors, with the default theme
ggplot(dogs, aes(x = longevity, y = lifetime_cost, shape = group, color = group)) +
  geom_point() +  # Plot the points with shapes and colors based on 'group'
  labs(title = "Dogs", 
       x = "Longevity (years)", 
       y = "Lifetime Cost") +
  scale_shape_manual(values = c(
    "herding" = "circle",      
    "hound" = "triangle",     
    "non-sporting" = "square",
    "sporting" = "plus",      
    "terrier" = "cross",      # Cross (closest to square with X)
    "toy" = "asterisk",       
    "working" = "diamond"     # tried to hide 'working' group
  )) +
  scale_color_manual(values = c(
    "herding" = "orange",
    "hound" = "yellow",
    "non-sporting" = "green",
    "sporting" = "turquoise",
    "terrier" = "lightblue",
    "toy" = "purple",
    "working" = "grey"  # tried to hide 'working' group color
  )) +
  theme_grey()  # Used grey theme


#    c. Propose 4 improvements to the plot based on best practices.
#Remove grey theme, use minimal theme, use jitter(), make shapes bigger, 
#change colors



#    d. Modify the code to implement at least two of those changes.
ggplot(dogs, aes(x = longevity, y = lifetime_cost, shape = group, color = group)) +
  geom_jitter(alpha = 0.9,size = 2.5, width = 0.2, height = 0.2) +  # Added jitter with transparency and size  
  labs(title = "Dogs", 
       x = "Longevity (years)", 
       y = "Lifetime Cost") +
  scale_shape_manual(values = c(
    "herding" = "circle",      
    "hound" = "triangle",     
    "non-sporting" = "square",
    "sporting" = "plus",      
    "terrier" = "cross",     
    "toy" = "asterisk",       
    "working" = "diamond"     
  )) +
  scale_color_manual(values = c(
    "herding" = "orange",
    "hound" = "yellow",
    "non-sporting" = "green",
    "sporting" = "turquoise",
    "terrier" = "lightblue",
    "toy" = "purple",
    "working" = "grey"  
  )) +
  theme_minimal()  # changed theme
