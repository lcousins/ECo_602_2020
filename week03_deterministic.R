# install.packages("here")
require(here)
here()
getwd()
read.csv(here("data", "my_data.csv"))
# file.exists(here("data", "data_sets", "my_data.csv"))
file.exists(here("data", "my_data.csv"))
dat_habitat <-  read.csv(here("data", "hab.sta.csv"))
head(dat_habitat)
plot(dat_habitat$elev, dat_habitat$slope, main="Scatterplot of sampling site elevation vs slope", xlab="elevation", ylab="slope")            

hist(dat_habitat$elev, main="Elevation", xlab="elevation")
hist(dat_habitat$aspect, main="Aspect", xlab="aspect")
hist(dat_habitat$slope, main='Slope', xlab="slope")

plot(dat_habitat$elev, dat_habitat$ba.tot, main="Elevation", xlab="elevation", ylab="basal area")
# abline(lm(dat_habitat$ba.tot - dat_habitat$elev))

plot(dat_habitat$aspect, dat_habitat$ba.tot, main="Aspect", xlab="aspect", ylab="basal area")
# abline(lm(dat_habitat$ba.tot - dat_habitat$aspect))

plot(dat_habitat$slope, dat_habitat$ba.tot, main="Slope", xlab="slope", ylab="basal area")
# abline(lm(dat_habitat$ba.tot - dat_habitat$aspect))