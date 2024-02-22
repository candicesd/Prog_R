#Afficher le répertoire courant par défaut de votre session RStudio avec la fonction getwd().

getwd()

#Changer le répertoire courant par défaut de votre session RStudio avec la fonction setwd() pour pointer sur le dossier avec vos datasets. Puis vérifier le bon changement du répertoire avec la fonction getwd().

setwd(dir = "L://BUT/SD/Promo 2023/cdemaugebost/Dataset")
getwd()

#Importer les datasets avec la fonction read.csv().

bodies_karts = read.csv(file = "bodies_karts.csv", header = TRUE, sep = ";", dec = ",")
tires = read.csv(file = "tires.csv", header = TRUE, sep = "\t", dec = ",")
gliders = read.csv(file = "gliders.csv", header = TRUE, sep = "|", dec = ".")
drivers = read.csv(file = "drivers.csv", header = TRUE, sep = ";", dec = ",")

#Pour chaque dataset, afficher la dimension (ligne/colonne) du dataframe.

dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)

#Pour chaque dataset, effectuer un résumé des données avec la fonction adaptée.

summary(bodies_karts)
summary(tires)
summary(gliders)
summary(drivers)

#Représenter graphiquement dans un nuage de points le lien entre les statistiques des drivers sur Weight et Acceleration. Commenter le lien entre ces deux variables ? Pourquoi il n'y a pas autant de points que de drivers ?

plot(x = drivers$Weight,
     y = drivers$Acceleration, 
     main = "Drivers : Weight / Acceleration")
#Il semble que les deux variables soient corrélées négativement
#Il y a autant de points mais ils sont superposés car certains drivers ont les mêmes statistiques

#Calculer le coefficient de corrélation de cette relation avec la fonction cor().

cor(x = drivers$Weight, y = drivers$Acceleration)

#Vérifier ce résultat en calculant vous même le coéfficient de corrélation.

covXY = cov(x = drivers$Weight,
            y = drivers$Acceleration)
sX = sd(drivers$Weight)
sY = sd(drivers$Acceleration)
print(covXY / (sX*sY))

#Construire la matrice des corrélations des variables quantitatives de statistiques des drivers avec la fonction cor(). Afficher cette matrice dans une vue et arrondisser les valeurs avec deux décimales uniquements. Qu'observez vous ?

matriceCor = cor(drivers[ , - 1])
matriceCor = round(matriceCor , 2)
View(matriceCor)
#Toutes les variables semblent fortement corrélées entre elles.

#commande à executer qu'une seule fois
install.packages("corrplot")

#Construire une Corrélogramme avec la fonction corrplot()

library(corrplot) #je charge mon package pour pouvoir utiliser ses fonctionalités
corrplot(matriceCor, method="circle")

#Construire une Corrélogramme pour les 3 autres datasets. Pour chaque dataset, quelle est la relation avec le lien le plus fort ? le lien le moins fort ?

matriceCor = round(cor(tires[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

matriceCor = round(cor(bodies_karts[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

matriceCor = round(cor(gliders[ , - 1]),1)
corrplot(matriceCor, method="color",    
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

#Créer un object resultat avec uniquement le nom du Driver et son Weight.

resultat = drivers[ , c("Driver" , "Weight")]
View(resultat)

#Créer un object resultat avec uniquement le nom du Driver et son Acceleration sur les 10 premières lignes.

resultat = drivers[ 1:10 , c("Driver" , "Acceleration")]
View(resultat)

#Créer un object resultat sans les colonnes 5, 7 et 9.

resultat = drivers[ , -c(5,7,9)]
View(resultat)

#Créer un object resultat avec uniquement les colonnes Driver, Acceleration et Weight dans cet ordre. Que remarquez-vous 

resultat = drivers[ , c("Driver", "Acceleration", "Weight")]
View(resultat)
#Les colonnes sont dans l'ordre défini par le vecteur.

#Créer un object resultat avec uniquement les Driver 3 , 12 et 32 dans cet ordre.

resultat = drivers[ c(3,12,32) , ]
View(resultat)








