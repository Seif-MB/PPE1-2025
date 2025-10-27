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
