#Catastrophe Rate Data
catrate<-read.csv("/Users/lrcousins//Documents/UMass Fall2020/Environmental Data/ECo_602_2020/data/catrate.csv")
head(catrate)

#Numerical and Graphical exploration
#Q1
summary(catrate)
hist(catrate$cat.rate, main='Histogram Catastrophe Rates', xlab='Catastrophe rate')

#Check for Normality
#Q2 Q3
#null hypothesis is that the frequency is normally distributed based on cat.rate
#there is strong evidence to reject the null hyptohesis and say that it is not normally distributed
shapiro.test(catrate$cat.rate)

#Parametric One-Sample Test: The t-test
#Q4 
#null hypothesis is that there is no difference between the true mean and the hypothesized value
#Q5 pvalue = 1, 95% CI = 0.3526250 0.7261295 does not include 0. There is enough evidence to  reject the null hypothesis because the true mean is not equal to .539
t.test(x=catrate$cat.rate, mu=mean(catrate$cat.rate))

#One-sided Alternative Hypothesis
#Q5 p value = .5
t.test(x=catrate$cat.rate, mu = mean(catrate$cat.rate), alternative = "greater")

#Non-Parametric One-Sample Test: The Wilcoxon Rank Sum Test
#Q6 Q7 p-value is .006275. The low p-value indicates  that we can reject the null hypothesis and accept the alternative hypothesis.  The catastrophic rate is, in fact, different from the pond late-filling rate.
wilcox.test(catrate$cat.rate, mu = 2 / 7)       

#Q8 The Wilcoxon test is probably better because it compares two groups against each other as equals, as opposed to one against the other.
#From these two test,  I can conclude that it is appropriate to reject the null hypothesis.


#Comparing two sample means
require(palmerpenguins)
penguin_dat = droplevels(subset(penguins, species != "Gentoo"))

#Numerical/Graphical Exploration
#Q9 The flipper lengths do appear to be normally distributed
summary(penguin_dat)
boxplot(flipper_length_mm ~ species, data = penguin_dat)

#Testing for normality
# Extract the Adelie penguin data
dat_adelie = subset(penguin_dat, species == "Adelie")
shapiro.test(dat_adelie$flipper_length_mm)
# Extract the Chinstrap penguin data
dat_chinstrap = subset(penguin_dat, species == "Chinstrap")
shapiro.test(dat_chinstrap$flipper_length_mm)

#Q10
par(mfrow=c(1,2))
hist(dat_adelie$flipper_length_mm, xlab='Flipper Length', main='Adelie')
hist(dat_chinstrap$flipper_length_mm, xlab='Flipper Length', main='Chinstrap')


#Parametric and Nonparametric Tests
#Q11 alternative hypothesis is that there is a difference between flipper length of chinstrap and adelie penguins
t.test(flipper_length_mm ~ species, data = penguin_dat)
wilcox.test(flipper_length_mm ~ species, data = penguin_dat)
