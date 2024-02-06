age = [25,18,9,13,34,15,22,17,12,37,15]
notInHSCount = 0

for i in range(len(age)):
    if age[i] >= 14 and age[i] <= 18:
        print("Index ", i, " is in High School")
    else:
        print("Index ", i, " is not in High School")
        notInHSCount += 1

print("The percentage of people not in High School is: ", notInHSCount / len(age))