#Importer le jeu de données fao.csv avec la fonction read.csv() uniquement dans un objet appelé df. Vérifier le type des colonnes pour vérifier que les colonnes aient le bon type.

setwd("L:/BUT/SD/Promo 2023/cdemaugebost/TP R")
df = read.csv("fao.csv", header = TRUE, dec = ",", sep = ";")
View(df)

#Combien de pays sont présents dans ce dataset ?
nrow(df)

#Affichez un résumé des données avec la fonction adaptée. Il semble que ce jeu de données présente quelques valeurs manquantes.
summary(df)

#Quelle est la disponibilité alimentaire moyenne mondiale en Kcal/personne/jour ?
mean(df$Dispo_alim)

#Quelle est le nombre d’habitant dans le monde ?
sum(df$Population, na.rm = TRUE)

#Quelle est l’écart-type du volume des exportations et importations de viande.
sd(df$Export_viande, na.rm = TRUE)
sd(df$Import_viande)

#Quelle est la médiane du volume de production de viande ?
median(df$Prod_viande, na.rm = TRUE)

#Calculez les quartiles du nombre de Kcal de disponibilité alimentaire.
quantile(df$Dispo_alim, probs = c(0.25,0.75), na.rm = TRUE)

#Calculez les centiles du volume d’importation de viande.
quantile(df$Import_viande, probs = seq(0, 1, 0.01))

#Construire une requête pour extraire les lignes du dataset avec les 5 pays les moins peuplés.









