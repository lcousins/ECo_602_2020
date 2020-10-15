dat_birds <- data.frame(read.csv('data/bird.sta.csv')) 
dat_habitat <- data.frame(read.csv('data/hab.sta.csv')) 

pairs(dat_habitat[, c('ba.ratio', 'ba.tot', 'snag.dc1', 'ba.con')])
hist(dat_birds$GCKI, xlab='Number of Birds Counted',  ylab='Frequency', main='Histogram of Golden Crowned Kinglet', breaks = 0:5 - 0.5)

