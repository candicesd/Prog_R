#Créer un objet a avec la valeur 10 et un objet b avec la valeur 5
a = 10
b = 5

#Multiplier les deux objets et stocker le résultat dans un objet resultat. Afficher cet objet avec la fonction print()
resultat = a * b 
print(resultat)

#Créer un objet A avec la valeur 7.2 et un objet B avec la valeur 10.1. Que remarquons-nous avec les deux premiers objets ?
A = 7.2
B = 10.1
#on remarque que "a" et "A" et "b" et "B" est différent pour R

#Additionner les deux objets A et B puis stocker le résultat dans un objet resultat. Que remarquons-nous avec le précédent objet resultat ?
resultat = A * B
print(resultat)
#le précédent resultat est supprimé

#Supprimer l'ensemble des objets des questions précédentes avec la fonction rm()
rm(a,b,A,B,resultat)

#Exercice 2 
#Créer un vecteur numérique de nombres de 1 à 5 et afficher sa classe. Afficher le troisième élément du vecteur.
vecteur = c(1,2,3,4,5)
class(vecteur)
vecteur[3]

#Créer un vecteur v1 avec les nombres de 1 à 5
v1 = 1:5

#Ensuite, créer un vecteur v2 en ajoutant 3 à chaque élément de v1
v2 = v1 + 3

#Créer un vecteur v3 avec les nombres de 1 à 6
v3 = 1:6

#Ensuite, créer un vecteur v4 avec les carrés de chaque élément de v3
v4 = v3^2

#Ensuite, créer un vecteur v5 en divisant chaque élément de v4 par 2
v5 = v4/2

#Créer un vecteur caractère avec les jours de la semaine et afficher sa classe. Afficher le 2ème et 7ème éléments du vecteur
vecteur = c("lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche")
class(vecteur)
vecteur[c(2,7)]

#Créer un vecteur avec des valeurs booléennes et afficher sa classe
vecteur = c(TRUE, FALSE)
class(vecteur)

#Créer un vecteur numérique contenant des nombres décimaux et afficher sa classe. Afficher tous les éléments sauf le 3ème
vecteur = c(1.1,2.2,3.3,4.4,5.5,6.6)
class(vecteur)
vecteur[-3]

#Créer un vecteur caractère avec le nom des mois et afficher sa classe. Afficher les mois du premier trimestre
vecteur = c("janvier","fevrier","mars","avril","mai","juin","juillet","aout","septembre","octobre","novembre","decembre")
class(vecteur)
vecteur[c(1,2,3)]

#Créer un vecteur numérique avec des nombres négatifs et afficher sa classe. Afficher le dernier et premier éléments du vecteur
vecteur = c(-1,-2,-3,-4)
class(vecteur)
vecteur[c(1,4)]

#Créer un vecteur caractère contenant des noms de fruits et afficher sa classe. Afficher tous les éléments sauf les deux premiers
vecteur = c("ananas","papaye","fruit du dragon", "noix de coco")
class(vecteur)
vecteur[-c(1,2)]

#Créer un vecteur numérique avec des valeurs manquantes (NA) et afficher sa classe
vecteur = c(1,2,3,NA,5)
class(vecteur)

#Créer une séquence de nombres de 1 à 10 puis calculer la longueur du vecteur
ma_sequence <- seq(from = 1, to = 10)
length(ma_sequence)

#Générer une séquence de nombres pairs de 2 à 20 puis calculer la longueur du vecteur
sequence = seq(from = 2,to = 20,by = 2)
length(sequence)

#Créer une séquence décroissante de 0 à -5 puis calculer la longueur du vecteur
sequence = seq(from = 0, to = -5)
length(sequence)

#Générer une séquence de nombres de 5 à 50 avec un pas de 5 puis calculer la longueur du vecteur
sequence = seq(from = 5, to = 50, by = 5)
length(sequence)

#Créer une séquence de 10 à 1 en ordre décroissant puis calculer la longueur du vecteur
sequence = seq(from= 10, to = 1)
length(sequence)

#Générer une séquence de nombres de 0 à 1 avec un pas de 0.1 puis calculer la longueur du vecteur
sequence = seq(from = 0, to = 1, by = 0.1)
length(sequence)

#Répéter le nombre 3 cinq fois et stocker le résultat dans un vecteur
vecteur = rep(3, times = 5)

#Répéter la séquence de nombres de 1 à 3 trois fois et stocker le résultat dans un vecteur
vecteur = rep(1:3,times = 3)

#Créer un vecteur répétant les valeurs TRUE et FALSE quatre fois chacune
vecteur = rep(c(TRUE,FALSE), times = 4)

#Execrice 3 
#Générez un vecteur de 5 nombres aléatoires compris entre 0 et 1 en utilisant la fonction runif()
vecteur = runif(n = 5, min = 0, max= 1)
vecteur #comme print(vecteur)
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)

#Générez un échantillon de 100 nombres aléatoires suivant une distribution uniforme entre 10 et 20 avec runif()
vecteur = runif(n = 100, min = 10, max = 20)
vecteur #comme print(vecteur)
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)

#Générez un échantillon de 20 nombres aléatoires suivant une distribution normale avec une moyenne de -2 et un écart-type de 3. Calculez la moyenne et l'écart-type de cet échantillon
echantillon = rnorm(n= 20, mean = -2, sd = 3 )
moyenne <- mean(echantillon)
ecart_type <- sd(echantillon)
print(paste("Moyenne : ", moyenne))
print(paste("Écart-type : ", ecart_type))
hist(echantillon)
















