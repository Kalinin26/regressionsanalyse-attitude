# 3_Regressionsanalyse
# Autor: Vakhtang Kalinin
# Datum: 14.07.2026


# Installieren bzw. Laden der benötigten Pakete

#install.packages("lmtest")
#install.packages("car")
#install.packages("lm.beta")

library(lmtest)
library(car)
library(lm.beta)


# Datensatz einlesen (Verwendung des attitude-Datensatzes aus R)
data(attitude)

data <- attitude

# Regressions-Modell rechnen (Für die Vorraussetzungen wird erst das Modell benötigt)

reg_mod <- lm(rating ~ complaints+privileges+learning+raises+critical+advance, data=data)


### Voraussetzungen ###

# Linearität der AV mit den UVs

plot(data$complaints, data$rating)
abline(lm(rating ~ complaints, data = data), col = "red")

plot(data$privileges, data$rating)
abline(lm(rating ~ privileges, data = data), col = "red")

plot(data$learning, data$rating)
abline(lm(rating ~ learning, data = data), col = "red")

plot(data$raises, data$rating)
abline(lm(rating ~ raises, data = data), col = "red")

plot(data$critical, data$rating)
abline(lm(rating ~ critical, data = data), col = "red")

plot(data$advance, data$rating)
abline(lm(rating ~ advance, data = data), col = "red")


# Normalverteilung der Residuen 

plot(reg_mod, 2)


# Homoskedastizität 

plot(reg_mod, 1)

bptest(reg_mod)

# Multikollinearität

vif(reg_mod)

# Einflussreiche Beobachtungen untersuchen

plot(reg_mod, 4)


### Interpretation ###

summary(reg_mod)


# standardisierte Koeffizienten berechnen 

lm.beta(reg_mod)
