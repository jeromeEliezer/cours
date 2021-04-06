# Ouvrir un json depuis js (et utiliser une carte pour les afficher)

https://stackoverflow.com/questions/6237295/how-can-i-update-nodejs-and-npm-to-the-next-versions : mettre a jour npm
```
sudo npm update npm -g
```

https://github.com/nvm-sh/nvm : install node et change de version
```
nvm install node
nvm ls
nvm use node
```

### Milieu d'un point
https://stackoverflow.com/questions/4656802/midpoint-between-two-latitude-and-longitude

### Afficher des données sur une carte
https://openlayers.org/download/ : Includes a full build of the library (ol.js), a source map (ol.js.map), and library CSS (ol.css with source map ol.css.map).

#### Ressources

https://openlayers.org : overview

https://openlayers.org/en/latest/apidoc/ : api

https://openlayers.org/workshop/fr/ : workshop en français


https://www.coordonnees-gps.fr/conversion-coordonnees-gps : les coordonnées gps décimales d'une adresse


> Les sources de données utilisées par ol :

https://www.openstreetmap.org/#map=6/46.449/2.210 : map tile service de cartographie

https://developers.google.com/kml : format de données vector data
https://geojson.org/ : format de données vector data

https://www.opengeospatial.org/standards/wms : format de source OGC
https://www.opengeospatial.org/standards/wmts : format de source OGC


### Application : où est-ce qu'on sort

Chaque utilisateur possède un nom et une position. On cherche le point central de tous les points.

La liste des utilisateurs est chargée depuis un fichier json. On peut ajouter sur la page de nouvelles lignes (elles ne seront pas enregistrées dans le json).

Bonus :
- on utilise une api pour retrouver la position des utilisateurs à partir de leur adresse
- on utilise une api (lafourchette ou tripadvisor) pour conseiller les restau dans un rayon de x mètres autour du point central


### Application : mes endroits préférés

Chaque utilisateur possède une liste d'endroits. Un endroits possède un nom, une position et une description.

Dans un menu déroulant, on voit la liste des utilisateurs. Lorsqu'on sélectionne un utilisateur, on voit un tableau avec les endroits préférés et leurs positions sur une carte.
