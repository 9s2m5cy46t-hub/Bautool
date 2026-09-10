# Wilde Schalung

Rechner für senkrechte Holz-Brettschalung aus zwei Brettbreiten – ein Werkzeug,
keine Bibliothek. Öffne `index.html` im Browser, fertig; es lädt nichts nach
außer den Schriften und rechnet vollständig lokal.

## Wofür

Eine „wilde" Fassade mischt breite und schmale Bretter in unregelmäßiger Folge.
Damit das aufgeht, müssen pro Wand zwei ganze Zahlen gefunden werden, die mit
einer Fuge aus dem erlaubten Bereich genau die Wandlänge füllen – und zwar mit
**derselben Fuge auf allen Wänden**, weil ein Fugenunterschied an der Hausecke
sofort sichtbar wird.

## Rechenmodell

Jedes Brett belegt seine sichtbare Breite plus eine Fuge (Rapport). Für eine Wand,
die mit einem Brett beginnt und endet (N Bretter, N−1 Fugen):

```
n_breit · (B + f)  +  n_schmal · (S + f)  =  L + f
```

Beginnt und endet die Wand mit einer Fuge (N+1 Fugen), steht rechts `L − f`.

Zu jeder Kombination lässt sich die Fuge exakt ausrechnen, statt einen Rest zu
verteilen:

```
f = (L − n_breit·B − n_schmal·S) / (N − c)      c = +1 bzw. −1 je Randmodell
```

Das Werkzeug zählt alle Kombinationen mit `f` im erlaubten Bereich auf und sucht
dann die eine Fuge, bei der jede Wand innerhalb der eingestellten Toleranz
aufgeht. Genau daran scheitert eine Rechnung pro Einzelwand.

## Was es ausgibt

* Gemeinsame Fugenbreite und maximale Abweichung zwischen den Wänden
* Stückzahlen breit/schmal je Wand und gesamt
* Wildes Muster über eine Muster-Nr. reproduzierbar – gleiche Nummer, gleiche
  Brettfolge; höchstens *n* gleiche Bretter in Folge
* Anrissliste je Wand: kumulierte Maße ab linker Wandkante, druckbar
* Alternative Aufteilungen mit derselben Fuge, per Klick übernehmbar

## Grenzen

Fensteröffnungen sind nicht modelliert – Wandstücke links und rechts davon als
getrennte Abschnitte eintragen. Eckausbildung, Schwindmaß und Verschnitt sind
Sache der Eingabe; Hinweise dazu stehen unten auf der Seite.

## Prüfung des Rechenkerns

Die Enumeration wurde gegen Brute Force auf Vollständigkeit geprüft, die
Rückwärtsprobe (bekannte Aufteilung → exakte Fuge) und der Musterschluss
(Anriss endet exakt auf Wandlänge) laufen fehlerfrei.
