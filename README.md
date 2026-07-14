# Multiple lineare Regression: Arbeitsumfeld und Unternehmensbewertung

Portfolio-Projekt: vollständige Regressionsanalyse in R – von der 
Voraussetzungsprüfung bis zur Interpretation.

## Fragestellung
Welche Aspekte des Arbeitsumfelds (Umgang mit Beschwerden, Sonderrechte, 
Lernmöglichkeiten, Gehaltserhöhungen, Kritikverhalten, Aufstiegschancen) 
sagen die Gesamtbewertung eines Unternehmens durch die Mitarbeitenden vorher?

## Daten
R-interner Beispieldatensatz `attitude` (n = 30 Mitarbeitende, 
Chatterjee & Price) im Skript direkt verfügbar, kein Download nötig.

## Methoden
- Prüfung der Regressionsvoraussetzungen: Linearität, Normalverteilung 
  der Residuen (Q-Q-Plot), Homoskedastizität (Residuenplot, Breusch-Pagan-Test), 
  Multikollinearität (VIF), einflussreiche Fälle (Cook's Distance)
- Multiple lineare Regression mit sechs Prädiktoren

## Zentrale Ergebnisse
Das Modell ist signifikant, F(6, 23) = 10.50, p < .001, R² = .733 
(adj. R² = .663). Einziger signifikanter Prädiktor ist der Umgang mit 
Mitarbeiterbeschwerden (b = 0.61, p < .001).

## Dateien
- `Regressionsanalyse.R` – vollständiges, reproduzierbares Analyseskript
- `Regressionsanalyse.pdf` – Ergebnisbericht (APA-orientiert)
