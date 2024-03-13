library(ggplot2)
path <- '/Users/gabekrishnadasan/Desktop/2024S/COMP352/Material/Assignment4/custdata.tsv'
myData <- read.table(file=path, header=TRUE, sep='\t')

d <- density(myData$age)
plot(d)
