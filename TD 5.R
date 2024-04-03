#TD5
#exercice 1
#Créer une graphique vide avec comme borne d'abscisse [-5,5] et d'ordonnées [0,1].
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 1), xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")

#Programmer une boucle for qui à chaque itération, ajoute une courbe densité issue d'une des 4 combinaisons de paramètres de loi normale suivant :
# Tracer la densité de probabilité pour chaque simulation
moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 1000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

# Ajouter une légende
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

#Simuler une loi normale N(μ=0, σ=1) de taille 10 000.
serie = rnorm(n = 1e4, mean = 0, sd = 1)

#Contruire l'histograme de la distribution de la série avec sa courbe densité.
hist(serie, main = "loi normal centrée-réduite",
     probability = TRUE)
lines(density(serie))

#Calculer la médiane de la série.
median(serie)

#Calculer les quartiles de la série.
quantile(serie)

#Calculer les centiles de la série. Quelle valeur de la série correspond au centile 0.95 ?
quantile(serie, 
         probs = seq(from = 0, 
                     to = 1, by = 0.01))

#Calculer la valeur théorique à l'aide de la fonction qnorm(). Vérifier cette valeur avec la fonction réciproque pnorm()
qnorm(0.95, mean = 0, sd = 1)
pnorm(q = 1.644854, mean = 0, sd = 1)

#Quelle est la valeur théorique pour P(X < x) = 0.975.
qnorm(p = 0.975, mean = 0, sd = 1)

#Quelle est la probabilité théorique pour P(X >= 1.96) = p
1 - pnorm(1.96, 0, 1)

#A l'aide de boucle for. Construire une vecteur avec les probabilités de la première colonne de la table de loi normale. On souhaite une précision avec uniquement 4 décimales.
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#on crée un vecteur vide pour ajouter les probas au fur et à mesure
all_probas = c()
#On parcourt les indices lignes
for (i in indices_lignes){
  proba = pnorm(q = i, mean = 0, sd = 1)
  #on ajoute la nouvelle proba au vecteur existant
  all_probas = c(all_probas,proba)
  all_probas = round(all_probas,digits = 4)}

#Modifier ce code pour construire la table de loi normale.
indices_colones = seq(from = 0.00, to = 0.09, by = 0.01)
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#On crée un objet résultat vide.
resultat = NULL
#On parcourt les indices colonnes
for (j in indices_colones) {
  #on crée un vecteur vide pour ajouter les probas au fur et à mesure
  all_probas = c()
  #On parcourt les indices lignes
  for (i in indices_lignes){
    quantile = i + j
    proba = pnorm(q = quantile, mean = 0, sd = 1)
    #on ajoute la nouvelle proba au vecteur existant
    all_probas = c(all_probas,proba)
    all_probas = round(all_probas,digits = 4)
  }
  #On ajoute une colonne au resultat
  resultat = cbind(resultat,all_probas)}

#Modifier le nom des lignes et colonnes
class(resultat)
table = data.frame(resultat)
colnames(table) = indices_colones
rownames(table) = indices_lignes
View(table)

#exercice 3
#Produire les tailles d'une population simulée de 10.000.000 de français répartis suivant une loi normale *N(171,9). Stocker ces tailles dans un vecteur population.
moyenne_pop<-171
sd_pop<-9
population<-rnorm(n = 1e7, 
                  mean=moyenne_pop, 
                  sd=sd_pop)

#Calculer la moyenne et l'écart-type de la population. Retrouvez-vous les valeurs attendues ?
mean(population)
sd(population)

#Etablir l'histogramme de la taille. Retrouvez-vous la forme bien connues ?
hist(population)

#Combien de personnes ont une taille inférieur à 190cm ? Combien devriez-vous en trouver théoriquement ?
#observé
pop190 = population[population < 190]
length(pop190)
length(pop190) / length(population)

#en théorie
pnorm(q = 190, mean=moyenne_pop, sd=sd_pop)*1e7

#Combien de personnes ont une taille supérieur à 200 cm ? Combien devriez-vous en trouver théoriquement ?.*
#observé
pop200 = population[population >= 200]
length(pop200)
length(pop200) / length(population)

#en théorie
#proba de P( X < 200cm)
proba_inf_200 = pnorm(q = 200, mean=moyenne_pop, sd=sd_pop)
#proba de P( X >= 200cm)
1 - proba_inf_200

#exercice 4
#Tirez un échantillon de taille 100 dans la population initiale, à l'aide de la fonction sample. Quelle est la taille moyenne dans l'échantillon ? Quelle est l'écart-type dans l'échantillon ? Ces deux valeurs sont-elles proches de celles de la population ?
taille_ech<-100
echantillon<-sample(x = population, 
                    size = taille_ech, 
                    replace = TRUE)
mean(echantillon)
sd(echantillon)

#A partir de l'écart-type estimé, calculez la largeur du demi-intervalle de confiance, puis les bornes inférieures et supérieures de l'intervalle de confiance (toujours à 95%). Pour rappel, la formule est disponible ici.
largeur<-qnorm(p = 0.975,mean=0,sd=1)*sd_pop/sqrt(taille_ech)
borne_inf<-moyenne_pop-largeur
borne_sup <-moyenne_pop+largeur

#A l'aide de la fonction replicate(), tirez 1000 échantillons de taille 100. Stockez dans un dataframe la moyenne et l'écart-type de chaque échantillon à l'aide de la fonction apply().
taille_ech<-100
nb_replicat<-1000
echantillons<-replicate(n = nb_replicat,
                        expr =  sample(population,
                                       taille_ech, 
                                       replace = TRUE))

moyennes<-apply(X = echantillons,
                MARGIN = 2,
                FUN = function(x) mean(x))
ecart_types<-apply(echantillons,
                   MARGIN = 2,
                   FUN = function(x) sd(x))

#Tracer l'histogramme des moyennes des échantillons. Retrouve-t-on une forme connue ?
hist(moyennes)

#Calculez la moyenne des moyennes des échantillons, ainsi que l'écart-type des moyennes des échantillons.
mean(moyennes)
sd(moyennes)

#Combien d'échantillons ont une moyenne supérieure à 172,8cm ? Quelle est le nombre théorique ?
#observé
moy172 = moyennes[moyennes > 172]
length(moy172)
length(moy172) / length(moyennes)

#en théorie
#proba de P( X < 172cm)
proba_inf_172 = pnorm(q = 172, 
                      mean=moyenne_pop, 
                      sd=sd_pop/sqrt(taille_ech))
#proba de P( X >= 172cm)
1 - proba_inf_172

#Pour chaque échantillon, calculez la largeur du demi-intervalle de confiance en utilisant l'estimation de l'écart-type calculée pour chaque échantillon, puis calculez les bornes inférieures et supérieures des intervalles de confiances (variables à rajouter dans votre dataframe)..
largeur<-apply(X = echantillons,
               MARGIN = 2,
               FUN = function(x) pnorm(0.975)*sd(x)/taille_ech)

borne_inf_IC<-moyennes-largeur
borne_sup_IC<-moyennes+largeur

#exercice 5
#Créer une fonction moyenne_echantillon() qui prend en entrée le vecteur V variable d'une population et une taille n d'échantillon et qui donne en sortie la moyenne d'un échantillon aléatoire de taille n tiré dans la population tels que : moyenne_echantillon <- function(V, n).
















