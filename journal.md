# Journal de bord du projet encadré 

# Le journal existe déja dans le dépot git 

## Travail sur git et les manipulations des fichiers
# en suivant les exercices demandés dans cette feuille,on peut apprendre les notions de base de github

#En premier lieu j'ai appris comment créer un dépot sur github et comment le cloner localement avec la commande git clone
# Apprendre le role de certaines commande:
# git status: pour vérifer l'etat du dépot local s'il est à jour ou non
# git pull: qui permet de récupérer les dernières modifications( synchronisation du dépot local) 
# Ainsi que les commandes (git add, git commit, git push) qui sont nécessaires pour préparer, enregistrer et envoyer les modifications qui acommpagnet notre travail

#J'ai appris à créer un journal et comprendre son utilité pour renseigner les étapes suivis lors  d'un projet 
# j'ai appris aussi à faire la différence entre un dépot distant et dépot local et comment gérer les conflits 



###### 
## La semaine du 12 au 16 Octobre:
# Explication du code:

# !/ usr / bin / bash: cette ligne montre que le script ci dessous doit etre exécuté avec bash
# if [ $ # - ne 1 ]:  pour vérifier le nombre d'argument donné en ligne de commande, dans cet esemple on attend qu'un seul argument 

# echo:" ce programme demande un argument ": En cas d'erreur ce message s'affiche pour aider l'utilisateur
# exit: dans le cas ou l'utilisateur se trompe dans le nombre d'argument, on quitte le programme avec les message d'erreur vu en haut 

# fi: la condition
#FICHIER_URLS = $1 : cette ligne sert à stocker l'argument dans une variable 

#while read -r LINE ; ici commence une boucle qui lit le contenu ligne par ligne 
# -r: pour ne pas interpreter les slash (\) 
# if [[ $LINE =∼ ^ https ?:// ]]: cette ligne vérifie si la ligne lue ressemble à une url
# OK = $ ( expr $OK + 1): on incrémente le compteur, à chaque url validée on incrémente ok, si elle est fausse NOK 
## done < $FICHIER_URLS la fin de la boucle while, une fois on finit la lecture de toutes les urls on sort de la boucle 


##" la semaine du 22 au 27 octobre

# Q1 dans cet exemple donné l'utilisation de cat est fortement déconseillée, cat permet de lire le fichier d'un seul coup alors que dans notre exemple on fait face à des urls, il vaut mieux utiliser read qui se caractérise par le fait de pouvoir lire le contenu du fichier ligne par ligne ce qui la rend plus efficace que cat

## Q2: Pour transformer "urls/fr.txt" en paramètre du script il faut le passer en argument tout en utilisant $1 qui représente l'argument fourni au script 
## le $1 peut rendre le script flexible dans le sens ou il peut accepter n'importe quel fichier 
## Q2.1:Pour s'assurer qu'on donne bien un argument au script, on doit rajouter la ligne ci dessous au code qui permet de verifier si l'argument est fourni ou non sinon le script s'arrete et ne s'execute pas  

## if [ -z "$1" ]; then
## echo "Erreur : vous devez donner un fichier en argument."
## echo "Usage : ./miniprojet.sh urls/fr.txt"
## exit 1

## Q3:  Afin d'afficher le numéro de laigne à chaque url, il faut ajouter un compteur et l'incrémnter à chaque itération 


 
 
########## la semaine du 6 à 11 novembre:

## Aprés la correction que nous avons faite au cours, je me suis familiarisé avec certains éléments qui me permettent d'eviter certaines erreurs mais aussi de rendre mon code plus fluide t plus flexible 
## Dans la semaine passée nous avons travailler sur un code qui génère un tableau.tsv et cette semaine nous devons produire un tableau html,malgré  mon premier code fonctionne bien mais j'ai du opter pour
## certains changements notamment par rapport aux arguments qu'on donne au script, au téléchargement du contenu avec  curl et lynx, le comptage des mots ainsi que l'encodage.
## Dans le nouveau script et contrairement au premier j'ai du rajouter un autre argument qui est le fichier de sortie afin de donner plus de flexibilité à mon script 
## par rapport au téléchargement du contenu html avec curl, cette fois ci j'ai utilisé un fichier txt temporaire afin de sauvegarder le contenu 
##Ensuite on a utilisé la commande suivante : NB_MOTS=$(cat "tmp.txt" | lynx -dump -stdin -nolist | wc -w) afin de lire le contenu brut et éviter les métadonnées qui peuvent poser problèmes dans le comptage.
## Aprés avoir sauvegardé le contenu html dans le fichier tmp.txt on utilise dump pour afficher le texte brut sans html 
## stdin qui permet à lynx de lire le contenu depuis l'entrée standard 
## nolist qui supprime la liste des liens à la fin de la page 
## Aprés avoir nettoyé le contenu on peut utiliser wc -w pour compter le nombre de mots exacte 


##### Miniprojet3######

## Dans un premier temps, tout en respectant les consignes je teste mes fichier localement avent faire le push vers le dépot distan, j'ai trouvé cela trés utile car dans le premier fichier index.html (version simple) j'ai oublié le boutton qui mène au tableau avant rectifier l'erreur toujours sur le depot local avant le pusher.


## Aprés avoir testé la page avec la version simple de l'index.html sur github, j'ai opté pour la modification de ce dernier tout en se référant à la librairie Bulma que j'ai trouvé trés riche en termes de fonctionalités. Aprés plusieurs tentative d'adaptation ce des différentes fonctionnalités disponibles sur Bulma j'ai fini par avoir une version final de index.html ( j'avoue que j'ai pas réussi à utiliser toutes les propositions de Bulma tellement c'est riche)

## l'étape suivante était la modification de mon script de base "miniprojet.sh" c'est là ou j'ai essayé de garder certaine cohérence entre les classes utilisées en index.html et dans le script miniprojet.sh notamment en ce qui concere la couleur de fond.

## j'ai utilisé aussi la classe de Bulma qui permet que la page s'affiche correctement sur tous les types d'écrans.

## Aprés avoir fait des recherches et la documentation sur la librairie de Bulma j'ai découvert une autre "bootstrap" qui partage presque les memes fonctionalités, une question alors m'est venu à l'esprit: Pourquoi Bulma et non pas une autre ? et quelles sont les différences entre les deux ?  
