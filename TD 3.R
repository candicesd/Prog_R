#EXO 1 
#Importer le jeu de données pokemon.xlsx à l’aide du package readxl.
install.packages("readxl")
library(readxl)
pokemon = read_excel(path = "L:/BUT/SD/Promo 2023/cdemaugebost/TP R/pokemon.xlsx",sheet = "pokemon")

#Combien de lignes, colonnes sont présentes dans ce dataset (utilisez les fonctions adaptées) ?
dim(pokemon)

#Affichez un résumé des données avec la fonction adaptée. On remarque peut-être que les variables qualitatives n'ont pas de statistique. En R, il est important que les variables qualitatives soit de type factor.
summary(pokemon)

#On souhaite analyser les variables generation, is_legendary, et type en tant que variables qualitatives. Modifier le type de ces variables pour les transformer en type factor (plus d'infos sur le type factor
pokemon$is_legendary <-as.factor(pokemon$is_legendary)
pokemon$generation <-as.factor(pokemon$generation)
pokemon$type <-as.factor(pokemon$type)

#Affichez un nouveau résumé des données avec la fonction adaptée.
summary(pokemon)

#EXO 2
#Créer une colonne attack_group avec la valeur attack+ si la valeur d'attack est supérieure ou égale à la médiane, sinon attack-. Convertir cette variable en factor puis effectuer un résumé de cette colonne avec la fonction summary()
med = median(pokemon$attack)
pokemon$attack_group = ifelse(pokemon$attack >= med, "attack+","attack-")
pokemon$attack_group <-as.factor(pokemon$attack_group)
summary(pokemon$attack_group)

#Créer une colonne best avec la valeur yes si la valeur d'attack fait parti du troisième quartile et si la valeur de defense fait parti du troisième quartile et si la valeur de speed fait parti du troisième quartile, sinon renseigner la valeur no. Convertir cette variable en factor puis effectuer un résumé de cette colonne avec la fonction summary()
q3_attack = quantile(pokemon$attack, probs = 0.75)
q3_defense = quantile(pokemon$defense, probs = 0.75)
q3_speed = quantile(pokemon$speed, probs = 0.75)
pokemon$best = ifelse(pokemon$attack > q3_attack &
                        pokemon$defense > q3_defense &
                        pokemon$speed > q3_speed , "yes","no")
pokemon$best <-as.factor(pokemon$best)
summary(pokemon$best)

#Filtrer les données dans un objet nommé requete avec les pokemons ayant des valeurs manquantes sur la colonne weight_kg.





