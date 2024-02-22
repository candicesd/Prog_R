#exercice 1 
#Afficher le jeu de données iris puis afficher la classe de l'objet iris
iris 
class(iris)

#Afficher le jeu de données iris dans une vue avec la fonction View()
View(iris)

#Afficher le nombre de lignes avec la fonction nrow()
nrow(iris)

#Afficher le nombre de colonne avec la fonction ncol()
ncol(iris)

#Afficher le nom des colonnes avec la fonction colnames()
colnames(iris)

#Afficher un résumé du dataframe avec la fonction summary()
summary(iris)

#Afficher uniquement les colonnes Sepal.Length et Species
iris[ , c("Sepal.Length", "Species")]

#Afficher uniquement la ligne 100,103 et 105
iris[c(100, 103, 105) , ]

#Afficher uniquement les lignes 50 à 100
iris[50 : 100 , ]

#Calculer la moyenne de la variable Sepal.Length
mean(iris$Sepal.Length)

#Calculer la médiane de la variable Sepal.Width
median(iris$Sepal.Width)

#Calculer l'écart-type de la variable Petal.Length
sd(iris$Petal.Length)

#Calculer les déciles de la variable Petal.Width
quantile(iris$Petal.Width, probs = seq(from = 0.1, to = 0.9, by =0.1))

#Exercice2
#Importer le jeu de données manga.csv dans un objet appelé dfManga et le jeu de données anime.csv dans un objet appelé dfAnime. Puis afficher la classe des deux objets pour vérifier que la classe est data.frame
dfManga = read.csv("L:/BUT/SD/Promo 2023/cdemaugebost/TP R/manga.csv", header = TRUE, sep = ",", dec = ".")
dfAnime = read.csv("L:/BUT/SD/Promo 2023/cdemaugebost/TP R/anime.csv", header = TRUE, sep = ",", dec = ".")
class(dfManga)
class(dfAnime)

#Afficher les jeux de données dans des vues pour les visualiser
View(dfManga)
View(dfAnime)

#Afficher le nombre de lignes et colonnes avec la fonction dim()
dim(dfAnime)
dim(dfManga)

#Calculer la moyenne de la variable Score pour les deux dataframe. Quelle est la moyenne la plus élevée ?
mean(dfAnime$Score)
mean(dfManga$Score)
#la plus haute est celle de dfAnime

#Calculer le nombre total de votes de la variable Vote pour les deux dataframe. Ou y a t-il le plus de votes ?
sum(dfAnime$Vote)
sum(dfManga$Vote)
#le plus hau est encore dfManga

#Calculer l'écart-type des notes de la variable Score pour les deux dataframe. Ou est l'échantillon le plus homogènes au niveau des Score ?
sd(dfAnime$Score)
sd(dfManga$Score)
#l'échantillon de le plus homogène est dfManga

#Combien de Manga ont une note strictement supérieure à 9/10 ?
note = subset(dfManga, Score > 9)
nrow(note)

#Combien de Manga ont 200000 votes ou plus ?
votes = subset(dfManga, Vote > 200000)
nrow(votes)

#Calculer les effectifs de la variable Rating(). Combien de modalité de la variable existe-t-il ? Calculer ensuite les effectifs en pourcentage
effectifRating = table(dfAnime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating)

#Combien d'Anime sont concernés par le Rating : R - 17+ (violence & profanity) ?
ratingg = subset(dfAnime, Rating == "R - 17+ (violence & profanity)")
nrow(ratingg)












