#!/bin/bash

path="/root/"
imagesPath="/generated/"
outputPath="/root/ShapesVideos/"
todayDate=$(date +%Y.%m.%d)

twitterAPI="/root/Noise/twitter.py"

cd $path
echo "Création des images"
xvfb-run processing-3.5.4/processing-java --sketch=/root/Noise/ --run

echo "Création de la vidéo"
media="${outputPath}shapes-${todayDate}.mp4"
ffmpeg -framerate 60 -i $imagesPath%03d.png -vf scale=600x600 -c:v libx264 -r 30 -pix_fmt yuv420p -y $media

echo "Suppression des Images"
rm $imagesPath*

echo "Envoi sur Twitter"
humanDate=$(date +%d.%m.%Y)
python3 $twitterAPI "Génération du $humanDate" $media

echo "Terminé !"
