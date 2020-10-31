# tester le backend d'une application multicouche avec junit


## Liens

référence pour une appli SpringBoot mysql : https://spring.io/guides/gs/accessing-data-mysql/

tester controller, repo, integration : https://dzone.com/articles/unit-and-integration-tests-in-spring-boot

## Chargement de la bdd
https://docs.spring.io/spring-boot/docs/current/reference/html/howto.html#howto-initialize-a-database-using-hibernate

et pas :

https://docs.spring.io/spring-boot/docs/current/reference/html/howto.html#howto-initialize-a-database-using-spring-jdbc

## Mapping nom de table hibernate
https://docs.jboss.org/hibernate/annotations/3.4/reference/fr/html_single/#d0e200

## Utilisation d'un logger
```java
    private static final Logger LOG = LoggerFactory.getLogger(HeroController.class);

```

## D'autres annotations

```java
    @PostMapping(consumes = "application/json", produces = "application/json")
    @ResponseStatus(HttpStatus.CREATED)
    @ApiOperation(value = "Create a hero resource.",
                    notes = "Create hero returning the new Hero")
    public Hero createHero(@RequestBody Hero hero,
            HttpServletRequest request, HttpServletResponse response) {
        LOG.debug("createHero: {}", hero.getName());
        Hero createdHero = heroRepository.save(hero);
        response.setHeader("Location", request
                .getRequestURL()
                .append("/")
                .append(createdHero.getId()).toString());
        LOG.debug("Created hero {} with id {}",
                createdHero.getName(), createdHero.getId());
        return createdHero;
    }
```
