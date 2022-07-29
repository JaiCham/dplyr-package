#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
HairEyeColor
hair_eye_colour <- HairEyeColor

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(hair_eye_colour, 1)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library("dplyr")


#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
hair_eye_colour <- as.data.frame(hair_eye_colour)
is.data.frame(hair_eye_colour)
select(hair_eye_colour, c(Hair,Sex))

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name
new_hair_sex <- hair_eye_colour[, c("Hair", "Sex")]


#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
is.data.frame(new_hair_sex)
select(new_hair_sex, -c(Sex))

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
rename(new_hair_sex, gender=Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
Hair_Gender <- rename(new_hair_sex, gender=Sex)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
filter(Hair_Gender, gender == "Male")

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
group_by(Hair_Gender,gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here:32 observations with 5 variables with a total frequency of 592___

total=mutate(hair_eye_colour, total=cumsum(Freq))
View(total)

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
Hair_Female <- filter(Hair_Gender, gender == "Female")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
Hair_Male <- filter(Hair_Gender, gender == "Male")
union(Hair_Female,Hair_Male)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
eyefreq<-select(hair_eye_colour, Eye, Freq)
blue<-filter(eyefreq, Eye=="Blue")
arrange(blue, Freq)
