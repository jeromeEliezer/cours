# Expressions Régulières

## Différents types

Caractère | recherche |
- |:-: | :-: |
`\d` | **tous nombres** |
`\w` | **tous caractères** |
`\s` | **tous les espaces** |
`\D` | **tous sauf les nombres** |
`\W` | **tous sauf les caractères** |
`\S` | **tous sauf les espaces** |

## Quantifieurs

Quantifieur | recherche |
- |:-: | :-: |
`\*` | zéro ou plusieurs occurences du pattern. |
`+` | une ou plusieurs occurences du pattern. |
`?` | zéro ou plusieurs occurences du pattern. |
`{n}` | exactly n occurrences. |
`{n,}` | at least n occurrences. |
`{n,m}`| between n and m (inclusive) occurrences. |

## Exemple d'écriture en java

java.util.regex supports the metacharacters and metasequences

Regular Expression Classes and Interfaces
Regular expression functions are contained in two main classes,
java.util.regex.Pattern and java.util.regex.Matcher; a n
exception, java.util.regex.PatternSyntaxException; and an
interface, CharSequence. Additionally, the String class implements
the CharSequence interface to provide basic patternmatching
methods. Pattern objects are compiled regular
expressions that can be applied to any CharSequence. A
Matcher is a stateful object that scans for one or more occurrences
of a Pattern applied in a string (or any object
implementing CharSequence).
Backslashes in regular expression String literals need to be
escaped. So, \n (newline) becomes \\n when used in aJa va
String literal that is to be used as a regular expression.


sur les dates :

```java
// Match dates formatted like MM/DD/YYYY, MM-DD-YY,...
import java.util.regex.*;
public class MatchTest {
public static void main(String[] args) throws Exception {
String date = "12/30/1969";
Pattern p =
Pattern.compile("^(\\d\\d)[-/](\\d\\d)[-/](\\d\\d(?:\\d\
\d)?)$");
Matcher m = p.matcher(date);
if (m.find( )) {
String month = m.group(1);
String day = m.group(2);
String year = m.group(3);
System.out.printf("Found %s-%s-%s\n", year, month, day);
}
}
}
```
Autres exemple :

```java
Example 7. Simple substitution
// Example -. Simple substitution
// Convert <br> to <br /> for XHTML compliance
import java.util.regex.*;
public class SimpleSubstitutionTest {
public static void main(String[] args) {
String text = "Hello world. <br>";
Pattern p = Pattern.compile("<br>", Pattern.CASE_
INSENSITIVE);
Matcher m = p.matcher(text);
String result = m.replaceAll("<br />");
System.out.println(result);
}
}

```

autre exemple :

```java
Example 8. Harder substitution
// urlify - turn URLs into HTML links
import java.util.regex.*;
public class Urlify {
public static void main (String[ ] args) throws Exception {
String text = "Check the web site, http://www.oreilly.com/
catalog/regexppr.";
String regex =
"\\b # start at word\n"
+ " # boundary\n"
+ "( # capture to $1\n"
+ "(https?|telnet|gopher|file|wais|ftp) : \n"
+ " # resource and colon\n"
+ "[\\w/\\#~:.?+=&%@!\\-] +? # one or more valid\n"
+ " # characters\n"
+ " # but take as little\n"
+ " # as possible\n"
+ ")\n"
+ "(?= # lookahead\n"
+ "[.:?\\-] * # for possible punc\n"
+ "(?: [^\\w/\\#~:.?+=&%@!\\-] # invalid character\n"
+ "| $ ) # or end of string\n"
+ ")";
Pattern p = Pattern.compile(regex,
Pattern.CASE_INSENSITIVE + Pattern.COMMENTS);
Matcher m = p.matcher(text);
String result = m.replaceAll("<a href=\"$1\">$1</a>");
System.out.println(result);
}
}

```


voir page 631