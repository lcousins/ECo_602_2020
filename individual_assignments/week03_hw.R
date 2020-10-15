install.packages("here")
require(here)
dat_habitat <- read.csv(here('data', 'hab.sta.csv'))

hist(dat_habitat$elev, main="Histogram of sampling site elevation", ylab='Frequency', xlab='Elevation')
hist(dat_habitat$aspect, main="Histogram of sampling site aspect", ylab='Frequency', xlab='Aspect')
hist(dat_habitat$slope, main="Histogram of sampling site slope", ylab='Frequency', xlab='Slope')

plot(dat_habitat$elev, dat_habitat$ba.tot, main="Scatterplot of total basal area vs elevation", ylab='Total Basal Area', xlab='Elevation')
plot(dat_habitat$aspect, dat_habitat$ba.tot, main="Scatterplot of total basal area vs aspect", ylab='Total Basal Area', xlab='Aspect')
plot(dat_habitat$slope, dat_habitat$ba.tot, main="Scatterplot of total basal area vs slope", ylab='Total Basal Area', xlab='Slope')
