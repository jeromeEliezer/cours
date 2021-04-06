# Découverte des modèles NoSQL

>Depuis quelques années, le volume de données à traiter sur le Web a mis à rude épreuve les SGBD relationnels qui ont été jugés non adaptés à de nombreuses montées en charge.

Les grands acteurs du **Big Data** comme **Google**, **Amazon**, **LinkedIn** ou **Facebook** ont été amenés à créer leurs propres systèmes de stockage et de traitement de l’information (**BigTable**, **Dynamo** et **Cassandra**).

>Des implémentations d’architectures *open source* comme **Hadoop** et la modélisation des bases de données SGBD comme **HBase**, **Redis**, **Riak**, **MongoDB** ou encore **CouchDB** ont permis de démocratiser ce nouveau domaine de l’informatique répartie.

On distingue plusieurs modèles de données parmi les SGBD de type **NoSQL** du moment :

- Clé-valeurs
- Orienté colonnes
- Documents
- Graphes

Plus le modèle est complexe, moins le système est apte à évoluer rapidement en raison de la montée en charge.

## Modèles de données du NoSQL

### Clé-valeurs

Le mode de stockage du modèle clé-valeurs (key-value) s’apparente à une table de **hachage persistante** qui associe une clé à une valeur (de toute nature et de type divers. La clé 1 pouvant référencer un nom, la clé 2 une date, etc...).

C’est à l’application cliente de comprendre la structure de ce blob. L’intérêt de ces systèmes est de pouvoir mutualiser cette table sur un ou plusieurs serveurs.

>Les SGBD les plus connus sont Memcached,CouchBase, Redis et Volde-mort (LinkedIn).

### Orienté colonnes

Le modèle orienté colonnes ressemble à une **table dénormalisée** (sans la présence de NULL, toutefois) dont la structure est dynamique.

>Les SGBD les plus connus sont HBase (implémentation du BigTable de Google) et Cassandra (projet Apache qui reprend à la fois l’architecture de Dynamo d’Amazon et BigTable).

### Orienté documents

Le modèle orienté documents est toujours basé sur une **association clé-valeur dans laquelle la valeur est un document** (JSON généralement ou XML).

>Les implémentations les plus populaires sont CouchDB (Apache), RavenDB, Riak et MongoDB.

### Orienté graphes

Le modèle de données orienté graphes se base sur les **nœuds et les arcs orientés et éventuellement valués**.

Ce modèle est très bien _adapté au traitement des données des réseaux sociaux où on recherche les relations entre individus de proche en proche_.

>Les principales solutions du marché sont Neo4j (Java) et FlockDB (Twitter).

## Sources sur le web