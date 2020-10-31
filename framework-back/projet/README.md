# Projet de la session 4

#### Description

> Le but est de valider vos connaissances sur hibernate.

![img](giphy.gif)

**Nous prévoyons un oral de 12 min : 7 min de présentation +5 min de question, le jeudi 23/01**

Comme les délais sont cours, nous vous proposons de travailler sur des exemples vus pendant la formation que vous êtes libres de choisir (vous pouvez prendre le fil-rouge s'il est pret jeudi).

Préparez cette présentation régulièrement jusqu'à jeudi, en avançant principalement sur le projet fil-rouge.


#### Compétences

- Choisir une appli one-to-many ou une many-to-many et les présenter (éventuellement avec diagramme) pour illustrer et expliquer le rôle d'hibernate dans un backend java/springboot

- lancer l'application et datagrip et illustrer la mise à jour de la base de données par hibernate

- être capable de faire une requête de jointure sql sur les données en exemple (par exemple sélectionner le nom de tous les poissons)

- connaître les principales annotations : oneToMany, manyToMany(+mappedBy),entity, table, id (+strategies), etc...

- repository : savoir nommer les requêtes du crud et décrire comment en ajouter de personnalisées

- savoir expliquer dans les grandes lignes (en détail pour les plus méticuleux) comment tester une application multicouche (en utilisant au moins un mot clé qui commence par m...)


#### Références

Vous pouvez vous inspirer des projets suivants (après avoir fait un pull si vous les aviez déjà, il y a des readme) :

<https://github.com/jtobelem-simplon/hibernate-one-to-many>   
<https://github.com/jtobelem-simplon/hibernate-many-to-many>


#### Conseils pour l'oral

- Commencez **en douceur** par un pitch (non technique) + use case pour s'échauffer
- Pour décrire un diagramme (MCD, use case, etc ...) essayez de lister (énumérer) les éléments principaux, cela permet à qqun qui découvre votre schéma pour la première fois de pouvoir rentrer dedans. Parlez aussi des relations entre les objets (multiplicité, héritage, ...)
- Ne passez jamais rapidement sur un schéma sans le décrire (ou alors ne le montrez pas)
- Lors du parcours du code, suivez une même fonctionnalité (par exemple geekControlller, geekRepo, geek)


#### Questions posées l'année dernière par le jury sur le back
et sentiment par rapport à cette question.

- Pourquoi avoir choisi MySQL ? Ras
- Quel est le moteur de MySql SGBDR ? Résultat : InnoDb. Je n'ai pas su répondre
- Qu'est ce qu'un index ? (la réponse préparée en groupe n'a pas convaincu)
- Comment créez vous votre base de données sans jMerise et sans Hibernate, quelle modélisation physique de la base ? (la deuxième partie de la question était nébuleuse)
- Comment sont créées les tables ? Rép: Via ORM (pas de difficulté)
- Quels types de valeurs pour les nombres entiers et les nombres à virgule ? Combien d'octet pour chaque type ?
- Qu'est-ce qu'une clef primaire, clef étrangère ? (j'ai bien répondu) et on m'a dit de faire une requête SQL (récupérez tous les utilisateurs qui ont tel rôle).
- Si vous aviez un prix à stocker, quel type dans MySQL ? (j'ai dit FLOAT, mais il voulait que je dise DECIMAL je crois) et il m'a demandé la taille que prend en mémoire les différents types d'entiers (TINYINT, SMALLINT, INT, BIGINT).
- Faire une requête SQL avec jointure entre deux tables
- Pourquoi ce choix de structure pour la bdd : 2 tables se ressemblant, quand une aurait suffi... (N'ayant pas créé les tables, je n'avais pas de réponse...)
- Quel est le fondateur de la modélisation ? Rep : Claude Rochet (difficulté : oui)
- Sur votre mcd, avez-vous des points d'amélioration à ajouter? ( Dans les tables de jointure )
- MCD/mld/mpd, c'est quoi la différence ?
- Que représente le MCD ? (j'ai dis les tables de la BDD... mais c'est faux).
- requête sql native vs requête signature avec jpa
- Les valeurs du formulaire sont-elles vérifiées côté back ?
- "Pourquoi avez-vous mis static ?" Et oui, cette question m'a mis en grande difficulté (apparemment on ne fait pas "new" avec static)
