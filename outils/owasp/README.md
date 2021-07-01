# OWASP

**Open Web Application Security Project**

![owasp-ten.png](owasp-ten.png)

Voici le lien officiel : [https://www.owasp.org](https://www.owasp.org)

[Document pour les tests de 224 pages à lire le soir pour s'endormir](https://www.owasp.org/images/1/19/OTGv4.pdf)

[liens vers les outils pour la mise en pratique de l'OWASP](https://www.linkedin.com/pulse/les-3-outils-owasp-indispensables-aux-d%C3%A9veloppeurs-pour-azziz-errime)

Utilisez le `Code Review Guide` : [Ici](https://www.owasp.org/index.php/File:OWASP_Code_Review_Guide_v2.pdf)

## Schéma des 10 attaques et de quelques solutions  

![synthèse](owasp-synthèse-philippe-bouget.png)

idem : lien vers ce Schéma réalisé avec MindMup qui résume les attaques et solutions (non exhaustives) :

[lien vers la carte](https://atlas.mindmup.com/2020/03/be1e1b2061f411eaac2127beb7bef55d/owasp_top_10_des_attaques_/index.html)

## Outils pour tester la vulnérabilité d'un site

Utilisez le **scanner de vulnérabilité** : [OWASP ZAP](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)

Un petit topo ici sur les [3 outils connus](https://astuces-informatique.com/outils-teste-injection-sql/)

L’outil `OWASP SKF` [OWASP Security Knowledge Framework](https://www.owasp.org/index.php/OWASP_Security_Knowledge_Framework) propose des exemples de code sécurisé pour les langages les plus connus, ce qui peut représenter une bonne source d’inspiration lors de la phase de développement.


Un petit site qui montre quelques exemples : [Ici](http://igm.univ-mlv.fr/~dr/XPOSE2012/OWASP_WebGoat/examples.html#sql)

Lien vers des [outils de Hack](https://www.journaldunet.com/solutions/dsi/1100767-10-outils-de-hacking-pour-les-experts/)

## Autres articles

[Cross-site request forgery (CSRF ou XSRF)](https://blog.clever-age.com/fr/2014/06/25/owasp-cross-site-request-forgery-csrf-ou-xsrf/)

[Injections SQL (iSQL)](http://blog.clever-age.com/fr/2013/09/18/securite-owasp-injection-sql/)

[Cross-Site Scripting (XSS)](http://blog.clever-age.com/fr/2014/02/10/owasp-xss-cross-site-scripting/)

[Local-Remote File Inclusion (LFI / RFI)](http://blog.clever-age.com/fr/2014/10/21/owasp-local-remote-file-inclusion-lfi-rfi/)


## Comprendre les injections SQL

‌[Injection sql exemple]( http://www.codingame.com/playgrounds/154/sql-injection-demo/sql-injection‌)

>Définition : Une attaque par **Injection SQL** consiste en l'insertion ou *injection* d'une requête SQL partielle ou complète via les données entrées ou transmises par le client (navigateur) vers l'application web.

Une attaque par **injection SQL réussie** peut accéder aux données sensibles d'une BD et permettre d'effectuer les actions suivantes :

* Modifier des données (avec insert, update et delete)
* Exécuter des opérations d'administration sur la base de données (comme stopper le serveur)
* Récupérer le contenu d'un fichier depuis le système de fichier du SGBD
* Ecrire un fichier sur le système
* Envoyer des commandes au système d'exploitation.

>La cause est due à un mauvais filtrage des requêtes SQL lors de l'échange entre le client et le serveur. La conséquence est l’obtention d’un accès complet aux données vulnérables (pour effacement des données, exécution de code arbitraire, exfiltration de données, compromission du SI, etc...).

**All user input is evil until proven otherwise**

> Traduction : **Toutes les entrées de l'utilisateur sont mauvaises jusqu'à preuve du contraire**

Exemples de code d'injection SQL :

```sql
username: admin
password: unknown' or '1'='1
query: SELECT name FROM user where username = 'admin' and password = 'unknown' or '1'='1'
```

```sql
SELECT uid FROM Users WHERE name = 'Dupont' AND password = '' or 1 --';
```

```sql
SELECT * FROM Users WHERE ((Username='1' or '1' = '1'))/*') AND (Password=MD5('$password')))
```

```sql
SELECT boumboum FROM blabla WHERE badparam=-1 UNION SELECT IF(substr(passwd,0,1) >
char(97), 1, benchmark(200000,md5(char(97)))) FROM admins WHERE id=1;
```

Remédiation & Mitigation

Les injections SQL sont vu comme de l’artisanat car elles peuvent être créées d'innombrables manières, et de ce fait il n'existe pas de système de base de données plus sûr qu’un autre.

Il existe de nombreux logiciels permettant de trouver les injections SQL, comme par exemple celui-ci, [SQLmap](https://sqlmap.org/) et utilisation [https://net-security.fr/security/injection-sql-avec-sqlmap/](https://net-security.fr/security/injection-sql-avec-sqlmap/).

Solutions préconisées :

* Utiliser des requêtes préparées.
* Utiliser des procédures stockées.
* Quand cela est possible mettre les utilisateurs consulte la base en **Read-only**
* Utiliser la fonction *mysqli_real_escape_string* qui filtre les caractères en php

METTRE UN [WAF](https://fr.wikipedia.org/wiki/Web_application_firewall) (Suricata - SELKS) : **Web Application Firewall**

Pour aller plus loin :[ https://www.owasp.org/index.php/SQL_Injection_Prevention_Cheat_Sheet](https://www.owasp.org/index.php/SQL_Injection_Prevention_Cheat_Sheet)


A visiter :

[http://www.codingame.com/playgrounds/154/sql-injection-demo/sql-injection‌](http://www.codingame.com/playgrounds/154/sql-injection-demo/sql-injection‌)

[https://thehackerish.com/sql-injection-examples-for-practice/](https://thehackerish.com/sql-injection-examples-for-practice/)

[https://kinsta.com/fr/blog/injections-sql/](https://kinsta.com/fr/blog/injections-sql/)

## Liste de sites pour la mise en pratique

[https://www.web-eau.net/blog/10-outils-en-ligne-pour-tester-la-securite-de-votre-site](https://www.web-eau.net/blog/10-outils-en-ligne-pour-tester-la-securite-de-votre-site)

[https://www.httpcs.com/fr/cartographie-complete-site-web](https://www.httpcs.com/fr/cartographie-complete-site-web)

## Mise en pratique

Testez l'outil **OWASP ZAP** sur votre projet fil rouge ou tout autre projet web !
Proposez des solutions si vous découvrez une faille !

Voici le lien vers la mise en place d'un site web avec des failles et des aides d'OWASP pour apprendre à détecter les failles et les éviter.

[https://github.com/WebGoat/WebGoat](https://github.com/WebGoat/WebGoat)

Vous devez vous déconnecter d'internet pour lancer cette application de démo.