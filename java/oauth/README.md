## backend

https://spring.io/guides/tutorials/spring-boot-oauth2/

    If you stay logged in to GitHub, you won’t have to re-authenticate with this local app, even if you open it in a fresh browser with no cookies and no cached data. (That’s what Single Sign-On means.)


#### What Just Happened?

The app you just wrote, in OAuth 2.0 terms, is a Client Application, and it uses the authorization code grant to obtain an access token from GitHub (the Authorization Server).

It then uses the access token to ask GitHub for some personal details (only what you permitted it to do), including your login ID and your name. In this phase, GitHub is acting as a Resource Server, decoding the token that you send and checking if it gives the app permission to access the user’s details. If that process is successful, the app inserts the user details into the Spring Security context so that you are authenticated.

If you look in the browser tools (F12 on Chrome or Firefox) and follow the network traffic for all the hops, you will see the redirects back and forth with GitHub, and finally you’ll land back on the home page with a new Set-Cookie header. This cookie (JSESSIONID by default) is a token for your authentication details for Spring (or any servlet-based) applications.

So we have a secure application, in the sense that to see any content a user has to authenticate with an external provider (GitHub).

We wouldn’t want to use that for an internet banking website. But for basic identification purposes, and to segregate content between different users of your site, it’s an excellent starting point. That’s why this kind of authentication is very popular these days.

In the next section, we are going to add some basic features to the application. We’ll also make it a bit more obvious to users what is going on when they get that initial redirect to GitHub.

#### a clarifier

Many JavaScript frameworks have built in support for CSRF (e.g. in Angular they call it XSRF), but it is often implemented in a slightly different way than the out-of-the box behaviour of Spring Security. For instance, in Angular, the front end would like the server to send it a cookie called "XSRF-TOKEN" and if it sees that, it will send the value back as a header named "X-XSRF-TOKEN". We can implement the same behaviour with our simple jQuery client, and then the server-side changes will work with other front end implementations with no or very few changes. To teach Spring Security about this we need to add a filter that creates the cookie.

#### personnaliser son `user`

How to Add a Local User Database
Many applications need to hold data about their users locally, even if authentication is delegated to an external provider. We don’t show the code here, but it is easy to do in two steps.

Choose a backend for your database, and set up some repositories (using Spring Data, say) for a custom User object that suits your needs and can be populated, fully or partially, from external authentication.

Implement and expose OAuth2UserService to call the Authorization Server as well as your database. Your implementation can delegate to the default implementation, which will do the heavy lifting of calling the Authorization Server. Your implementation should return something that extends your custom User object and implements OAuth2User.

Hint: add a field in the User object to link to a unique identifier in the external provider (not the user’s name, but something that’s unique to the account in the external provider).

#### Remarques

- application.properties ou application.yml : https://javatechnolgyupdate.blogspot.com/2019/01/applicationproperties-vs-applicationyml.html
- utiliser des webjars dans votre application : https://svene.github.io/adocblog/html/2015_05_09_webjars_in_webapplications.html
- et pourquoi utiliser des webjars : https://www.baeldung.com/maven-webjars
- CSRF, pronounced "sea surf"

> Remember if you use versions of the samples in your own servers to register with GitHub (or similar) and get client credentials for your own host addresses. And remember not to put those credentials in source control!
