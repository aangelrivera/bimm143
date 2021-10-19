#' ---
#' title: "Class 05 Data Analysis and Visualization"
#' author: "Angelita Rivera (PID: A15522236)"
#' date: "October 12th, 2021"
#' ---

# Let's start with a scatterplot

# Need to load it up first 
library(ggplot2)

# Every ggplot has a data + aes + geoms

# Select data set
ggplot(data = cars)

#Add aes (gives parameters)
ggplot(data = cars) + aes(x = speed, y=dist)

#Add geoms (adds points)
ggplot(data = cars) + aes(x = speed, y=dist) + geom_point()

#Add another layer (ex. add a line on top)
ggplot(data = cars) + aes(x = speed, y=dist) + geom_point() + geom_line()

#Show a trend line to the scatter plot
ggplot(data = cars) + aes(x = speed, y=dist) + geom_point() + geom_smooth()

#Change to a linear model
ggplot(data = cars) + aes(x = speed, y=dist) + geom_point() + geom_smooth(method="lm")

#Save as p 
p <- ggplot(data = cars) + aes(x = speed, y=dist) + geom_point() + geom_smooth(method="lm")

#Call p
p

#Add title of plot
p + labs(title="My nice plot")

#Change x and y labels
p + labs(title="My nice plot", x="Speed (MPH)", y="Distance (Miles)")

#Base graphics is shorter 
plot(cars)
#But you can change every aspect of ggplots buy just adding another layer

#Different titles
p + labs(title="Speed and Stopping Distance of Cars", x="Speed (MPH)", y="Stopping Distance (ft)")

#Adding subtitle and caption
p + labs(title="Speed and Stopping Distance of Cars", x="Speed (MPH)", y="Stopping Distance (ft)", subtitle = "Your informative subtitle text here", caption= "Dataset: 'cars'") 

#Adding se=FALSE) + theme_bw
ggplot(data = cars) + aes(x = speed, y=dist) + geom_point() + geom_smooth(method="lm", se=FALSE)+ labs(title="Speed and Stopping Distance of Cars", x="Speed (MPH)", y="Stopping Distance (ft)", subtitle = "Your informative subtitle text here", caption= "Dataset: 'cars'") + theme_bw()
#Save as p 
p <- p <- ggplot(data = cars) + aes(x = speed, y=dist) + geom_point() + geom_smooth(method="lm", se=FALSE)+ labs(title="Speed and Stopping Distance of Cars", x="Speed (MPH)", y="Stopping Distance (ft)", subtitle = "Your informative subtitle text here", caption= "Dataset: 'cars'") + theme_bw()

#New GENE dataset
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

#Count how many rows
nrow(genes)
#What are the column names?
colnames(genes)
#How many columns are there? 
ncol(genes)

#Summary table of one column --> in this case "State"
table(genes$State)

#Answering the question: what fraction of total genes is up-regulated in this date set? 
round(table(genes$State)/nrow(genes)*100,2)
#Step 1: Recognize "State" column tells you whether it's down, up or unchanging 
#Create a SUMMARY column of "State"
table(genes$State)
#^Summarizes how many up, down, unchanging
#Step 2: Know you want to divide SUMMARY of up-regulated genes by TOTAL number of genes
table(genes$State) / nrow(genes)
#Gives you 0.0 numbers, we want percentage! 
#AND WE WANT TWO SIGNIFICANT FIGURES 
#To get two significant figures: 
round(table(genes$State) / nrow(genes), 2)
#Still need percentage, so have to multiply by 100
round(table(genes$State) / nrow(genes) *100,2)
#Now we get percentage, rounded to 2 significant figures! (:

#Launch ggplot
library(ggplot2)

#Make a scatterplot of Gene
ggplot(genes) + aes(x=Condition1, y=Condition2) + geom_point()

#Add column=State, so the plot can show which genes are down, up, and unchanging
ggplot(genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point()
#Save as p
p <- ggplot(genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point()
#DON'T FORGET TO LAUNCH p so R knows
p 

#Add more layers
#Change color scheme
p + scale_color_manual (values=c("blue","gray","red"))
#You can change to any colors!
p + scale_color_manual (values=c("pink","green","cyan"))

#To update p with new changes: 
p <- p + scale_color_manual (values=c("blue","gray","red"))
#Launch p
p 

#Add title, x labels, y labels
p + labs(title="Gene Expression Changes Upon Drug Treatment", x="Control (no drug)", y= "Drug Treatment")

#Save new changes
p <- p + labs(title="Gene Expression Changes Upon Drug Treatment", x="Control (no drug)", y= "Drug Treatment")
#Launch p 
p 