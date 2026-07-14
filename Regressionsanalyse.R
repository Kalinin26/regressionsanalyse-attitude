# Regressionsanalyse
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

# Output-Ordner fuer Abbildungen und Konsolen-Output anlegen
dir.create("output", showWarnings = FALSE)

# Regressions-Modell rechnen (Für die Vorraussetzungen wird erst das Modell benötigt)
reg_mod <- lm(rating ~ complaints+privileges+learning+raises+critical+advance, data=data)

# Voraussetzungen 
# Linearität der AV mit den UVs
png("output/01_linearitaet_complaints.png", width = 900, height = 700, res = 120)
plot(data$complaints, data$rating)
abline(lm(rating ~ complaints, data = data), col = "red")
dev.off()
png("output/02_linearitaet_privileges.png", width = 900, height = 700, res = 120)
plot(data$privileges, data$rating)
abline(lm(rating ~ privileges, data = data), col = "red")
dev.off()
png("output/03_linearitaet_learning.png", width = 900, height = 700, res = 120)
plot(data$learning, data$rating)
abline(lm(rating ~ learning, data = data), col = "red")
dev.off()
png("output/04_linearitaet_raises.png", width = 900, height = 700, res = 120)
plot(data$raises, data$rating)
abline(lm(rating ~ raises, data = data), col = "red")
dev.off()
png("output/05_linearitaet_critical.png", width = 900, height = 700, res = 120)
plot(data$critical, data$rating)
abline(lm(rating ~ critical, data = data), col = "red")
dev.off()
png("output/06_linearitaet_advance.png", width = 900, height = 700, res = 120)
plot(data$advance, data$rating)
abline(lm(rating ~ advance, data = data), col = "red")
dev.off()

# Normalverteilung der Residuen 
png("output/07_qq_plot_residuen.png", width = 900, height = 700, res = 120)
plot(reg_mod, 2)
dev.off()

# Homoskedastizität (Plot)
png("output/08_residuals_vs_fitted.png", width = 900, height = 700, res = 120)
plot(reg_mod, 1)
dev.off()

# Einflussreiche Beobachtungen untersuchen
png("output/09_cooks_distance.png", width = 900, height = 700, res = 120)
plot(reg_mod, 4)
dev.off()

# Konsolen-Output in Textdatei umleiten
sink("output/10_konsolen_output.txt")

# Homoskedastizität (Breusch-Pagan-Test)
cat("Breusch-Pagan-Test\n")
print(bptest(reg_mod))

# Multikollinearität
cat("\nVarianzinflationsfaktoren (VIF)\n")
print(vif(reg_mod))

# Interpretation 
cat("\nRegressionsmodell (summary)\n")
print(summary(reg_mod))

# standardisierte Koeffizienten berechnen 
cat("\nStandardisierte Koeffizienten (lm.beta)\n")
print(lm.beta(reg_mod))

# Umleitung beenden
sink()