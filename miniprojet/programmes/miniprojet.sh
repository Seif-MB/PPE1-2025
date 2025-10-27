#!/bin/bash



if [ -z "$1" ]; then
  echo "Erreur : vous devez donner un fichier en argument."
  echo "Usage : ./miniprojet.sh urls/fr.txt"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Erreur : le fichier '$1' n'existe pas."
  exit 1
fi

#  Lecture du fichier et traitement de chaque URL
n=1
while read -r line; do
  # ignorer les lignes vides
  if [ -z "$line" ]; then
    continue
  fi

  url="$line"

  # --- Récupérer le code HTTP ---
  # -s : silencieux
  # -L : suit les redirections
  # -o /dev/null : on ignore le contenu
  # -w "%{http_code}" : affiche seulement le code HTTP
  code=$(curl -s -L -o /dev/null -w "%{http_code}" "$url")

  # Récupérer l’encodage 
  encoding=$(curl -s -I -L "$url" | grep -i "content-type" | grep -oE "charset=[^[:space:];]*" | cut -d= -f2)
  if [ -z "$encoding" ]; then
    encoding="inconnu"
  fi

  # Pour récupérer le nombre de mots 
  nb_mots=$(curl -s -L "$url" | sed 's/<[^>]*>/ /g' | wc -w)

  echo -e "${n}\t${url}\t${code}\t${encoding}\t${nb_mots}"

  n=$((n+1))
done < "$1"
