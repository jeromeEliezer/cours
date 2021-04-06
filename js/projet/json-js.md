# Json avec js

## Ressoucres

https://www.w3schools.com/js/js_json_intro.asp

https://developer.mozilla.org/fr/docs/Learn/JavaScript/Objects/JSON


## Avec XMLHttpRequest (natif)

https://developer.mozilla.org/fr/docs/Learn/JavaScript/Objects/JSON

> remarque : pour ouvrir un fichier local, on ne peut pas directement ouvrir file://... sinon cross origin erreur. On peut soit uploader les ressources pour qu'elles aient une adresse http, ou bien faire :

```
sudo npm install -g http-server
```

Et ensuite dans le dossier qui contient les pages :

```
http-server
```

> attention : il faut effacer les données de navigation à chaque changement du json

## Avec jquery

https://jquery.com/

```js
$.getJSON("test.json", function(json) {
    console.log(json); // this will show the info it in firebug console
});
```

## Application : liste superheros avec bootstrap (ou materialize)

Afficher la liste des superheros dans une table avec uniquement le nom et l'indice dans la table.

Cliquer sur une ligne permet d'afficher une carte avec les détails du superhero.
