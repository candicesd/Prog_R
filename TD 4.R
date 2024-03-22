setwd("L:/BUT/SD/Promo 2023/cdemaugebost/TP R")
df = read.csv( file = "velov.csv", header = TRUE, dec = ",", sep = ";" )
summary(df)
class(df$status)
class(df$CodePostal)
summary(df)
df$status = as.factor(df$status)
df$CodePostal = as.factor(df$CodePostal)
df$bornes = ifelse(df$capacity != (df$bikes + df$stands), "KO" , "OK")
table(df$bornes)

Exercice 2

hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations")
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     breaks = 6)
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     breaks = 6,
     col = "red")
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     breaks = 6,
     col = "red",
     xlab = "Capacity")
abline(h = 100, col = "blue", lty = 2)
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "red",
     probability = TRUE,
     xlab = "Capacity")
lines(density(df$capacity),
      lty = 1,
      col = "blue",
      lwd = 4)
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "red",
     probability = TRUE,
     xlab = "Capacity",
     ylim = c(0,0.08))

lines(density(df$capacity),
      lty = 1,
      col = "blue",
      lwd = 2)

Exercice 3:
  
boxplot(x = df$capacity, main = "Boxplot de \n la capacité des stations")
boxplot(x = df$capacity, 
        main = "Boxplot de \n la capacité des stations",
        horizontal = TRUE)
boxplot(x = df$capacity, 
        main = "Boxplot de \n la capacité des stations",
        horizontal = FALSE,
        outline = FALSE)
points(mean(df$capacity), col = "red", pch = 16, cex = 2)

par(mfrow=c(1,2)) #fenêtre sur 1 ligne et 2 colonnes
#7ème
df7 = subset(df, CodePostal == "69007")
boxplot(x = df7$bikes, 
        main = "Boxplot nb vélos \n 69007",
        ylim = c(0,40))
#8ème
df8 = subset(df, CodePostal == "69008")
boxplot(x = df8$bikes, 
        main = "Boxplot nb vélos \n 69008",
        ylim = c(0,40))

par(mfrow=c(1,1)) #fenêtre sur 1 ligne et 1 colonne
# Tracer le graphique boxplot
boxplot(formula = bikes ~ bonus,
        data = df, 
        main = "Dispo vélos vs Stations Bonus")

# Calculer les moyennes de chaque groupe
means <- tapply(X = df$bikes, 
                INDEX = df$bonus, 
                FUN = function(X) mean(X))
print(means)
# Ajouter les moyennes de chaque groupe au graphique
points(means, col = "red", pch = 19)