---
layout: post
title:  "50 nuances de git"
date:   2019-09-20 10:59:53 +0200
categories: code
---

Il y a fort fort longtemps, on avait à peu près le choix de l'outil pour gérer son code. Enfin, j'ai surtout connu l'époque où on avait le choix entre CVS et SVN (avec une préférence pour SVN). Git est arrivé comme un bulldozer et est aujourd'hui très souvent le choix par défaut. SQL ressort souvent comme LA techno qui vous servira tout au long de votre carrière de développeur. Peut-être que Git prend le même chemin.  
Même si des interfaces graphiques existent ([GitKraken](https://www.gitkraken.com/)), le mieux reste à mon sens d'utiliser la ligne de commande directement afin de savoir vraiment ce qu'on fait. La plupart du temps, vous allez vous créer un schéma mental avec les commandes que vous utilisez systématiquement + celles dont vous avez besoin en cas d'urgence. Notamment parce que ça reste un outil conçu pour travailler à plusieurs et que c'est précisément dans ce cas que ça peut partir en vrille très vite.  
L'idée ici va être de vous proposer plein de liens pour apprendre Git. Plein de liens parce que ça dépend beaucoup de ce avec quoi vous êtes le plus à l'aise pour apprendre mais aussi d'où vous en êtes pour dompter cet outil.  
On finira avec quelques outils et astuces pour se faciliter la vie.

## Dompter Git
### Les bases
* [En bref et en français](http://rogerdudler.github.io/git-guide/index.fr.html)
* [Enseigner Git](https://rachelcarmena.github.io/2018/12/12/how-to-teach-git.html)
* [Comprendre les concepts](https://dev.to/unseenwizzard/learn-git-concepts-not-commands-4gjc)
* [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/)
* [A Hacker's Guide to Git](https://wildlyinaccurate.com/a-hackers-guide-to-git/)
* [Video : concepts et architecture](https://www.youtube.com/watch?index=4&list=PLEIPSRdn5KEoLbRZJuS4bLlldQ4wiA5Nf&v=ihKRRWBVn5k)
* [Git for beginners](https://blog.prototypr.io/git-for-beginners-12-commands-you-need-to-know-e084cce9cc94)

### Les tutos
* [Tutos chez Github](https://lab.github.com/)
* [Tuto interactif sur les branches](https://learngitbranching.js.org/)
* [Tuto openclassrooms](https://openclassrooms.com/en/courses/2342361-gerez-votre-code-avec-git-et-github)

### Bonnes pratiques
* [Adopte un git](http://adopteungit.fr/methodologie/2016/08/16/les-bonnes-pratiques.html)
* [Astuces et bonnes pratiques](https://guillaumebriday.fr/comment-jutilise-git-mes-astuces-et-bonnes-pratiques)
* [Le mode d'emploi qu'on attendait tous](https://github.com/k88hudson/git-flight-rules)
* [GitFlow](http://datasift.github.io/gitflow/IntroducingGitFlow.html)
* [GitFlow : la cheat sheet](https://danielkummer.github.io/git-flow-cheatsheet/index.html)
* [Collection de tips](https://github.com/git-tips/tips)
* [Une façon de gérer ses branches](https://nvie.com/posts/a-successful-git-branching-model/)


### Rattraper ses erreurs
(parce que personne n'est parfait, surtout avec git)
* [Oh shit, git!](https://jvns.ca/blog/2018/10/27/new-zine--oh-shit--git-/)
* [Dangit, git!](http://dangitgit.com/)
* [Git.WTF](https://git.wtf/)


### Plus en détails
* [Explorer les commandes Git](https://gitexplorer.com/)
* [Git rebase, pour modifier l'historique](https://git-rebase.io/)
* [Construire son propre Git en python](https://wyag.thb.lt/)
* [Décortiquer Git + une version de Git codée en JS](https://maryrosecook.com/blog/post/git-from-the-inside-out)
* [Collection de ressources](https://try.github.io/)
* [Explorer le dossier .git](https://www.freecodecamp.org/news/understanding-git-for-real-by-exploring-the-git-directory-1e079c15b807/)

### Outils
C'est bien beau, tout ça, mais se pose aussi le choix de l'endroit où déposer tous vos beaux repos. Le choix de base est souvent [Github](https://github.com/). Pourtant, [Gitlab](https://gitlab.com/) semble plus complet (en plus de ses engagements éthiques, jusque dans l'énergie qui alimente ses serveurs... ce qui n'est pas négligeable quand on pense à la quantité de données hébergées)(promis, je migre ce site dès que j'ai 2 min). Sans oublier [Bitbucket](https://bitbucket.org/). Rien ne vous empêche non plus d'héberger vous-même avec [Gogs](https://gogs.io/) ou [Gitea](https://gitea.io/en-us/) pour aller directement à l'essentiel.  
Au passage, notez qu'un outil vous permet de générer directement votre portfolio depuis votre compte Github : [Gitfolio](https://github.com/imfunniee/gitfolio).  
Et qu'un autre facilite la suppression de vos repos github (c'est qu'on en entasse rapidement, des trucs) : [Reporemover](https://reporemover.xyz/).  
  
### Note
Si vous voulez partager votre compte github/gitlab/etc pour trouver du boulot, supprimez les repos qui ne servent à rien. Et plus généralement, pensez à supprimer tout ce qui ne vous sert plus (repo, site en ligne, kanban sur Trello, documents dans le cloud, etc).


### La bonne astuce pour la fin : l'autocomplétion
Parce que c'est quand même bien pratique. Je sais pas vous mais je fais régulièrement des coquilles sur mes commandes git. 


```
cd ~  

curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash   
```

Puis ajoutez ces lignes dans votre ~/.bashrc :

```

if [ -f ~/.git-completion.bash ]; then

   . ~/.git-completion.bash

fi

```

Vous pouvez maintenant appuyer sur Tab pour utiliser l'autocomplétion lorsque vous tapez des commandes git dans la ligne de commande.

## Conclusion
Ca fait beaucoup de lecture mais ça prend un peu de temps pour commencer à utiliser Git et beaucoup plus pour comprendre ce qu'on fait et espérer le maîtriser un jour.   
Dans tous les cas, mettez en place l'auto-complétion (et la clé SSH si vous utiliser Github et Gitlab), ça vous facilitera déjà grandement la vie. Et jetez un oeil à Gitflow pour un bon workflow d'équipe. 

