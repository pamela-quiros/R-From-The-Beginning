#-----------------Importing Data-------------------------------------
read.csv()

#Method 1: Select the file manually
stats <- read.csv(file.choose(), stringsAsFactors = T)
stats

#Method 2: Set WD and read data
getwd()
#Windows
setwd("C:\\Users\\ml515pv\\Desktop\\Otros\\Courses\\R")
#Mac:
#setwd("/Users/ml515pv/Desktop/Otros/Courses/R")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv", stringsAsFactors = T) #add levels
stats

#-----------------Exploring Data-------------------------------------
stats
nrow(stats)
#Imported 195 rows
ncol(stats)
head(stats, n=10) #top six rows
tail(stats, n=8) #button six rows
str(stats) #str() #runif()
summary(stats)

#-----------------Using $ sign---------------------------------------
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
#stats["Angola",3] #rows have numbers not names
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)

#-----------------Basic Operations with DF---------------------------
stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]
#Remember how the [] work:
is.data.frame(stats[1,]) #no need for drop=F
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])
#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
#add column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
stats
#test of knowledge
stats$xyz <- 1:4
head(stats, n=12)
#remove a column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)

#-----------------Filtering Data Frames----------------------------
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]

#-----------------Introduction to qplot()----------------------------
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

#-----------------Creating Data Frames-------------------------------
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), color=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(5), color=Income.Group)

#-----------------Visualizing what we need---------------------------
mydf <- data.frame(Codes_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")
#head(mydf)
rm(mydf)
mydf <- data.frame(Country=Codes_2012_Dataset, Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#-----------------Merging Data Frames------------------------------
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)

#-----------------Visualizing with new Split------------------------------
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color=Region)
#1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color=Region,size=I(5), shape=I(23))
#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color=Region,size=I(5), shape=I(19),
      alpha=I(0.6))
#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color=Region,size=I(5), shape=I(19),
      alpha=I(0.6), main="Birth Rate vs Internet Users")
