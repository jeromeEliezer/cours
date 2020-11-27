# Algorithmes sur des partitions

## Qu'est-ce qu'une partition ?

De façon la plus générale, on a une partition selon un prédicat P, c-à-d `P(x)` peut être vrai ou faux, lorsque `P(x)` vrai implique `P(y)` vrai pour tout y &gt; x.

Concrètement, on utilise le plus souvent le prédicat "est supérieur ou égal à T" sur un ensemble de valeurs croissantes (resp. inférieur et décroissantes).

Mais on peut utiliser tout type de prédicat, par exemple `x² ≥ 2` .

On peut aussi avoir une partition sur un intervalle d'indices de cases d'un tableau.

``` {.example}
names={"Alfred", "Bernard", "Francesca", "Marc", "Maria", "Pierre", "Thierry", "Thomas"}
```

Si le tableau est trié par ordre alphabétique, un prédicat comme `≥ Olivier` correspond à une partition des indices du tableau.

## Recherche du point de partition

Lorsqu'on a une partition, la plus petite valeur pour laquelle P(x) est vrai est le *point de partition*. Par exemple, pour le prédicat `x² ≥ 2`, le point de partition est la valeur de `√2`.

Pour le tableau donné en exemple précédemment, le point du partition du prédicat `≥ Maria` est `4` : la valeur de l'indice de la case qui contient "Maria".

On peut faire un algorithme récursif efficace pour trouver (encadrer) le point de partition à partir d'un intervalle `[begin, end[`. Il suffit de tester `P` au milieu `m` de l'intervalle :

-   si `P(m)` est vrai, alors il suffit de continuer à chercher dans
    `[begin, m[`, puisqu'on sait que `P` sera forcément vrai sur
    `[m, end[`, par propriété de la partition.
-   sinon, il suffit de continuer à chercher dans `[m, end[`, puisqu'on
    sait que `P` sera forcément faux sur `[begin, end[` par propriété de
    la partition.

L'intervalle réduit de moitié chaque étape. Lorsqu'il est suffisamment réduit (i.e. vide dans le cas des valeurs entières d'indices de tableau), on a notre point de partition.

### Calcul de racine

Implémenter cet algorithme pour calculer `√2`. Généraliser à la racine n-ième d'un nombre quelconque.

### Recherche de valeur

Implémenter cet algorithme pour trouver, si elle est présente, l'indice d'un nom dans le tableau donné en exemple.

## Partitionnement d'un tableau

Lorsqu'on a un tableau pour lequel les valeurs sont dans un ordre quelconque, on peut vouloir le partitionner selon un prédicat donné. Par exemple, `est pair`, afin d'avoir toutes les valeurs pour lesquelles le prédicat est faux en début de tableau, et toutes celles pour lesquelles le prédicat est vrai en fin de tableau. À la fin de l'algorithme, on aura comme résultat non seulement le tableau réordonné selon une partition, mais aussi le point de partition, indice de la première valeur pour laquelle le prédicat est vrai (ou la taille du tableau, si le prédicat n'était vrai pour aucune des valeurs).

Proposez un algorithme pour réaliser la partition selon le prédicat `≥5` du tableau suivant :

``` {.example}
values={-1, 1, 10, 5, 3, 7, 5, 2, 1}
```
