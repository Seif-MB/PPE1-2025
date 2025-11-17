#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Erreur : ce programme demande deux arguments :"
  echo "Usage : ./miniprojet.sh <fichier_urls> <fichier_sortie>"
  exit 1
fi

FICHIER_URLS=$1
FICHIER_SORTIE=$2

if [ ! -f "$FICHIER_URLS" ]; then
  echo "Erreur : le fichier '$FICHIER_URLS' n'existe pas."
  exit 1
fi

DOSSIER_SORTIE=$(dirname "$FICHIER_SORTIE")
mkdir -p "$DOSSIER_SORTIE"

echo "<!DOCTYPE html>" > "$FICHIER_SORTIE"
echo "<html lang=\"fr\">" >> "$FICHIER_SORTIE"
echo "  <head>" >> "$FICHIER_SORTIE"
echo "    <meta charset=\"UTF-8\"/>" >> "$FICHIER_SORTIE"
echo "    <title>Tableau des résultats</title>" >> "$FICHIER_SORTIE"
echo "    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/versions/bulma-no-dark-mode.min.css\">" >> "$FICHIER_SORTIE"
echo "  </head>" >> "$FICHIER_SORTIE"
echo "  <body class=\"has-background-link\">" >> "$FICHIER_SORTIE"
echo "    <section class=\"section\">" >> "$FICHIER_SORTIE"
echo "      <div class=\"container\">" >> "$FICHIER_SORTIE"
echo "        <div class=\"hero\">" >> "$FICHIER_SORTIE"
echo "          <div class=\"hero-body has-text-centered\">" >> "$FICHIER_SORTIE"
echo "            <h1 class=\"title is-2 has-text-white\">Tableau des résultats</h1>" >> "$FICHIER_SORTIE"
echo "          </div>" >> "$FICHIER_SORTIE"
echo "        </div>" >> "$FICHIER_SORTIE"
echo "        <div class=\"columns is-centered\">" >> "$FICHIER_SORTIE"
echo "          <div class=\"column is-three-quarters\">" >> "$FICHIER_SORTIE"
echo "            <div class=\"block content\">" >> "$FICHIER_SORTIE"
echo "              <table class=\"table is-bordered is-striped is-hoverable is-fullwidth has-text-centered\">" >> "$FICHIER_SORTIE"
echo "                <thead>" >> "$FICHIER_SORTIE"
echo "                  <tr><th>Ligne</th><th>URL</th><th>Code HTTP</th><th>Encodage UTF-8 ?</th><th>Nombre de mots</th></tr>" >> "$FICHIER_SORTIE"
echo "                </thead>" >> "$FICHIER_SORTIE"
echo "                <tbody>" >> "$FICHIER_SORTIE"

NB_LIGNE=0
while read -r URL; do
  [ -z "$URL" ] && continue

  if [[ ! "$URL" =~ ^https?:// ]]; then
    URL="https://$URL"
  fi

  echo "Analyse de l'URL : $URL"

  CODE_ET_ENCODAGE=$(curl -s -L -i -o "tmp.txt" -w "%{http_code}\n%{content_type}" "$URL")
  CODE=$(echo "$CODE_ET_ENCODAGE" | head -n 1)
  ENCODAGE=$(echo "$CODE_ET_ENCODAGE" | grep -E -o "charset=.*")

  if [ "$CODE" -eq 0 ]; then
    echo "                  <tr><td>$(($NB_LIGNE + 1))</td><td>$URL</td><td>ERREUR</td><td>ERREUR</td><td>ERREUR</td></tr>" >> "$FICHIER_SORTIE"
    continue
  fi

  if [[ "$ENCODAGE" =~ [Uu][Tt][Ff]-8 ]]; then
    ENCODAGE_UTF8="OUI"
  else
    ENCODAGE_UTF8="NON"
  fi

  NB_MOTS=$(cat "tmp.txt" | lynx -dump -stdin -nolist | wc -w)

  NB_LIGNE=$((NB_LIGNE + 1))

  echo "                  <tr><td>$NB_LIGNE</td><td>$URL</td><td>$CODE</td><td>$ENCODAGE_UTF8</td><td>$NB_MOTS</td></tr>" >> "$FICHIER_SORTIE"

  rm -f "tmp.txt"

done < "$FICHIER_URLS"

echo "                </tbody>" >> "$FICHIER_SORTIE"
echo "              </table>" >> "$FICHIER_SORTIE"
echo "            </div>" >> "$FICHIER_SORTIE"
echo "          </div>" >> "$FICHIER_SORTIE"
echo "        </div>" >> "$FICHIER_SORTIE"
echo "      </div>" >> "$FICHIER_SORTIE"
echo "    </section>" >> "$FICHIER_SORTIE"
echo "  </body>" >> "$FICHIER_SORTIE"
echo "</html>" >> "$FICHIER_SORTIE"

echo "Fichier HTML créé : $FICHIER_SORTIE"

