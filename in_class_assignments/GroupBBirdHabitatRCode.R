#Read in both CSV files and put them in named dataframes
dat_birds <- read.csv("https://michaelfrancenelson.github.io/eco_602_634_2020/data/bird.sta.csv")
dat_habitat <- read.csv("https://michaelfrancenelson.github.io/eco_602_634_2020/data/hab.sta.csv")

#Look at the top of the habitat data file to see column names
head(dat_habitat)

#Create some pair plots using subsets of columns in dat_habitat
pairs(dat_habitat[, c("elev", "slope", "aspect")])

pairs(dat_habitat[, c("ba.con","ba.hard", "elev")])

                  
#Create some histograms of bird count data
hist(dat_birds$GCKI, xlab = "Number of birds counted", breaks = 0:5 - 0.5, main = "Histogram of Golden Crested Kinglet")
     
