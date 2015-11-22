#!/bin/sh

set -e

# locale

export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8

# constantes

REVEALJS_CONFIG="-V slideNumber=\"c/t\" -V theme=black -V controls=true -V history=true -V width=\"100%\" -V height=\"100%\""
CURRENT_DATE=`date "+%A %d %B %Y"`

# fonctions

var_replace()
{
  # gestion de la date (pattern __DATE__)
  cat $1 | sed -e "s/__DATE__/$CURRENT_DATE/g" > tmp/$1.vr
}

# install reveal.js

if ! [[ -d "reveal.js" ]]; then
  echo "installation de reval.js 3.0.0..."

  wget https://github.com/hakimel/reveal.js/archive/3.0.0.zip \
  && unzip 3.0.0.zip \
  && mv reveal.js-3.0.0 reveal.js \
  && rm 3.0.0.zip

fi

# nettoyage

rm -f slides.html
rm -rf tmp/ && mkdir tmp/

# remplacement des variables dans les présentations

var_replace slides.md

# construction des slides du techlunch 1

pandoc -t revealjs $REVEALJS_CONFIG -s tmp/slides.md.vr -o slides.html
