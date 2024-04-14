#Question 1:
#1.1
path <- "/Users/gabekrishnadasan/Desktop/2024S/COMP352/Material/Assignment4/custdata.tsv"
custData <- read.table(file=path, header=TRUE, row.names=1, sep="\t")

d = density(custData$income)
plot(d)
polygon(d, col = "blue")

#1.2
#It appears that most people make under 100K, but this plot has a long tail and has some outliers
#above the 100K mark.

#Question 2:
#2.1
library(ggplot2)
library(dplyr)

noNa <- subset(custData, !is.na(custData$housing.type) & !is.na(custData$income))

ggplot(noNa, aes(x = housing.type, y = income)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(
    title = "Median Income by Housing Type",
    x = "Housing Type",
    y = "Income (USD)"
  )

#Question 3:
#3.1:
custData <- read.table(file=path, header=TRUE, row.names=1, sep="\t")
marriedHighIncome <- subset(custData, custData$marital.stat == "Married" & custData$income > 50000)

#3.2:
percent <- mean(marriedHighIncome$health.ins == TRUE) * 100
print(percent)
#96.2963%

#3.3:
percentWhole <- mean(custData$health.ins == TRUE) * 100
print(percentWhole)
#84.1%

#The difference in health insurance percent is considerable between high income and married (96%)
#and the rest (84%)

#Question 4:
#4.1:
custData <- read.table(file=path, header=TRUE, row.names=1, sep="\t")
withoutOutliers <- subset(custData, age <= 100)

ggplot(withoutOutliers, aes(x = age, y = income, color = num.vehicles)) +
  geom_point(size = 2) +
  labs(
    title = "Scatterplot with Color",
    x = "Age",
    y = "Income",
    color = "Number of Vehicles"
  ) + 
  scale_y_continuous(labels = scales::comma) +
  scale_color_gradient(low = "red", high = "blue")  # Blue to red color scale

#It does seem like there is some correlation between age and income, positive correlation.
#As well as a positive correlation between income and number of cars.
#So possible positive correlation between all three, as age increases, income and num cars generally does

#4.2:
noNa <- subset(custData, !is.na(income) & !is.na(housing.type))

incomeVehicleCor <- cor(noNa$income, noNa$num.vehicles)
vehicleAgeCor <- cor(noNa$num.vehicles, noNa$age)

print(incomeVehicleCor)
#0.139198
print(vehicleAgeCor)
#-0.06366646
