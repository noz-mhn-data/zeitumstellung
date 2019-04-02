# Grafiken: Zeitumstellung
Skripte und Rohdaten zum Artikel "Ohne Zeitumstellung: Wann in Ihrer Region die Sonne auf- und untergehen würde"

In diesem Repository gibt es die Rohdaten und R-Skripte zu den Grafiken in folgenden Artikeln:
https://www.shz.de/regionales/schleswig-holstein/ohne-zeitumstellung-wann-in-ihrer-region-die-sonne-auf-und-untergehen-wuerde-id23128962.html
https://www.noz.de/lokales/osnabrueck/artikel/1680569/ohne-zeitumstellung-sommerzeit-oder-lieber-winterzeit
https://www.svz.de/regionales/mecklenburg-vorpommern/Ohne-Zeitumstellung-Sommerzeit-oder-lieber-Winterzeit-id23128987.html

## Erläuterung:

* Die Rohdaten wurden hier heruntergeladen und in Excel vorbearbeitet: https://www.sunearthtools.com/de/solar/sunrise-sunset-calendar.php

* Eine erste Version der Grafiken wurde mit den R-Skripten aus diesem Repository erstellt (Working Directory sowie Plotly-Username und -API-Key müssen entsprechend eingefügt werden)
* Die Grafiken wurden dann bei Plotly händlisch als .js-Datei heruntergeladen
* Aus der HTML-Vorlage in den js-Dateien wurde die finale HTML-Datei erstellt. Dabei wurden folgende Änderungen vorgenommen:
* Titel wurde händisch angepasst, z.B.: 
   `<h2 style="font-family: 'Open Sans', verdana, arial, sans-serif; font-size: 17px; fill: rgb(68, 68, 68); opacity: 1; font-weight: bold;text-align: center">Wenn in Schwerin immer Sommerzeit w&auml;re</h2>`
* Für eine möglichst geringe Dateigröße wurde diese Javascript-Basis-Library verwendet:
     ` <script src="https://cdn.plot.ly/plotly-basic-latest.min.js"></script>`
* Um die Monatsnamen auf Deutsch darzustellen wurde diese Bibliothek verwendet:
      `<script src="https://cdn.plot.ly/plotly-locale-de-latest.js"></script>`
* Am Ende des <script>-Teils wurden folgende Änderungen vorgenommen für die deutschen Spracheinstellungen und damit die Werkzeugleiste in den Plots nicht angezeigt wird:
`Plotly.setPlotConfig({locale: 'de'});
Plotly.plot('plotly-div', 
data, layout, {displayModeBar: false}
  );`


Die Idee für die Visualisierungen stammt aus diesem Artikel von Zeit Online:
https://www.zeit.de/wissen/2018-03/zeitumstellung-sonnenstunden-tageslaengen-sonnenaufgang-untergang-orte



