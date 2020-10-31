# Exercices sur les api rest

![force](force.webp)

**_"Utiliser les api rest, c'est donner la force à vos applications"_**

## 1. Utilisons l'api de github


Github propose une api pour faire des requetes sur les repos, les utilisateurs, etc...

On peut consulter un guide de cette api :   
[https://developer.github.com/v3/search/](https://developer.github.com/v3/search/)

Nous allons utiliser les librairies **java-json** et **apache commons-io** pour interroger cette api et traiter le json obtenu en résultat.

#### Clone du projet github-api

- Dans le répertoire de votre workspace eclipse, faites un clone de mon projet github-api :
```
git clone https://github.com/jtobelem-simplon/github-api
```

- Puis importez ce projet gradle depuis eclipse.

- Cliquez droit sur le projet depuis le package explorer pour faire un gradle update, cela va télécharger les dépendances **java-json** et **apache commons-io** dont nous avons besoin. Ces dépendances sont spécifiées dans le fichier build.gradle :

```
dependencies {
    // Use JUnit test framework
    testImplementation 'junit:junit:4.12'

    // https://mvnrepository.com/artifact/org.json/json
	compile group: 'org.json', name: 'json', version: '20180813'

	// https://mvnrepository.com/artifact/commons-io/commons-io
	compile group: 'commons-io', name: 'commons-io', version: '2.5'
}
```

- Lancez le projet (main de la classe App.java) et vérifiez qu'il s’exécute sans exception.
- Un fichier **sample.json** a du être crée à la racine du projet; ouvrez ce fichier dans eclipse (ctrl+f pour le mettre en forme)


#### Travail en individuel ou en binôme

- réalisez les TODO de la méthode findInfluentUsers()
- réalisez les TODO de la méthode findStarProjects()

## 2. Utilisons l'api de openweathermap

- Créez un compte sur [https://home.openweathermap.org](https://home.openweathermap.org) afin d'obtenir une clé de recherche gratuite.

#### Clone du projet weather-api

- Dans le répertoire de votre workspace eclipse, faites un clone de mon projet weather-api :
```
git clone https://github.com/jtobelem-simplon/weather-api
```

- Puis importez ce projet gradle depuis eclipse.
- Remplacez ma clé par la votre au début du fichier App.java.
- Lancez le projet (main de la classe App.java) et vérifiez qu'il s’exécute sans exception.
- Un fichier **sample.json** a du être crée à la racine du projet; ouvrez ce fichier dans eclipse (ctrl+f pour le mettre en forme)

#### Travail en individuel ou en binôme

- réalisez le TODO1 de la méthode consumeWeather() de App.java
- réalisez les TODO de la classe Meteo.java
- réalisez le TODO2 de la méthode consumeWeather()
