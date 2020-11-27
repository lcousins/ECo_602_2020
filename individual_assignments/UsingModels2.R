require(palmerpenguins)
head(penguins$species)
# The null hypothesis is that there is no difference between the true mean of flipper lengths and 0.
# This is not a sensible hypothesis because it would not make sense for a penguin to have a 0mm flipper.
t.test(subset(penguins, species == "Gentoo")$flipper_length_mm)

# The null hypothesis this time is that there is no difference between the true mean and 217.187.
# This time, there is not enough evidence to reject the null hypothesis because the p-vlaue is only 0.1669, but it is much better than the first one.
t.test(x = subset(penguins, species == "Gentoo")$flipper_length_mm,mu = 218)

# This time, there is much stronger evidence that we can reject the null hypothesis.
# The 95% confidence interval was negative infinity to 218.1561.
t.test(x = subset(penguins, species == "Gentoo")$flipper_length_mm,mu = 218,alternative = "less")

#You  could modify the code by adding a mu value and an alternative value.
t.test(flipper_length_mm ~ species, data = subset(penguins, species != "Chinstrap"))

#ANOVA
#I notice that the histogram is right skewed with a mode and mean around 3750
par(mfrow = c(1, 2))
hist(penguins$body_mass_g, breaks = 80, main = "histogram of body mass", xlab = "body mass (g)")
plot(density(penguins$body_mass_g, na.rm = TRUE), main = "density plot of body mass")


boxplot(body_mass_g ~ species, data = penguins)
dat_chinstrap = subset(penguins, species == "Chinstrap")
mean(dat_chinstrap$body_mass_g, na.rm = TRUE)
shapiro.test(dat_chinstrap$body_mass_g)
aggregate(body_mass_g ~ species, data = penguins, FUN = mean)
fit_species = lm(body_mass_g ~ species, data = penguins)
summary(fit_species)
anova(fit_species)
fit_species = lm(body_mass_g ~ species, data = penguins)
summary(fit_species)
anova(fit_species)

boxplot(body_mass_g ~ sex + species, data = penguins)
fit_both <- lm(formula = body_mass_g ~ sex + species, data = penguins)
summary(fit_both)


#Questions
#Based on the boxplots, it does in fact appear that males are significantly heavier than females across all species.
#If I observe the mean body masses on the boxplots, the males are always heavier than females, and even the 1st and 3rd quartile are larger too.

#Yes, I think adding sex to a model that already includes species will improve the fit.  This is because there seem to be significant differences 
#between the masses of the sexes in the boxplots, and including sex as a factor would make the model more accurate and not too much harder to understand.

fit_both2 <- lm(formula = body_mass_g ~ sex * species, data = penguins)
summary(fit_both2)
#The base case for the model is 3368.84 with a standard error of 36.21

#The names of the columsn I would need to calculate the average mass of the female Chinstrap penguins are the Estimate and the standard error.
#mean of female body mass = 3368.84