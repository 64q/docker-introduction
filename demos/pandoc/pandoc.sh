#!/bin/bash

# demo docker pandoc

# construction du conteneur
docker build -t docker-demo/pandoc .

# lancement de la compilation
docker run -v $PWD/tmp:/output -it docker-demo/pandoc

# vérification des slides
cat tmp/slides.html
