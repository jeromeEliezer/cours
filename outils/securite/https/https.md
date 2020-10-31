# Mise en oeuvre de HTTPS avec Spring Boot

## Génération du certificat avec keytool

Pour générer un certificat en développement on va utiliser `keytool` (un outil Java) qui va nous générer le certificat et va ranger la clé privée associée dans un même fichier.

Mettez vous à la racine de votre API Spring à sécuriser et tappez la commande suivante : `keytool -genkey -alias apikey -storetype PKCS12 -keyalg RSA -keysize 2048 -keystore keystore.p12 -validity 365`.

L'outil va vous demander des informations sur vous, voici un exemple pour tester (modifiez avec vos informations)

![Information Keytool](../ressource/https/keytool.png)

Vérifiez ensuite le contenu : `openssl pkcs12 -info -in keystore.p12`. Vous devriez voir la clé privée et le certificat dans la console.

## Modification de la configuration Spring Boot

Modifiez le fichier `application.properties` pour inclure les lignes suivantes :

```properties
server.port=8443
server.ssl.key-store=keystore.p12
server.ssl.key-store-password=<votre mot de passe de keystore>
server.ssl.keyStoreType=PKCS12
server.ssl.keyAlias=apikey
```

## Testez votre API dans votre navigateur

Si vous gardez le protocole **HTTP** vous devriez avoir ce genre de message d'erreur :

![TLS needed](../ressource/https/http-forbiden.png)

Si vous tentez d'utiliser **HTTPS** vous devriez avoir ceci :

![Invalid certificate](../ressource/https/invalid-certificate.png)

Mais vous pouvez contourner et autoriser les certificats auto signés (à utiliser avec précaution) !

![Autoriser les self signed certificates](../ressource/https/allow-self-cert.png)

Et vous devriez avoir enfin accès à votre API :

![TLS needed](../ressource/https/https-self-cert.png)
