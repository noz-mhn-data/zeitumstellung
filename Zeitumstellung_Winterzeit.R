
library(plotly)
library(ggplot2)
library(htmlwidgets)

#Hier das Working Directory setzen:
setwd("/PFAD")

#Das Folgende wäre als Schleife schöner - hatte keine Zeit, es umzuschreiben, daher nun für alle drei Orte einzeln:

#OSNABRÜCK
datasetname = read.csv("Winterzeit_Osnabrück.csv", header = TRUE, sep = "\t", quote = "\"",
         dec = ".")

Nacht1 = as.numeric(substr(datasetname[,2],1,2))+as.numeric(substr(datasetname[,2],4,5))/60+as.numeric(substr(datasetname[,2],7,8))/3600

Tag = as.numeric(substr(datasetname[,3],1,2))+as.numeric(substr(datasetname[,3],4,5))/60+as.numeric(substr(datasetname[,3],7,8))/3600

Nacht2 = as.numeric(substr(datasetname[,4],1,2))+as.numeric(substr(datasetname[,4],4,5))/60+as.numeric(substr(datasetname[,4],7,8))/3600


Daytime <- datasetname[,7]

data <- data.frame(Daytime, Nacht1, Tag, Nacht2)

hline <- function(y = 0, color = "white") {
  list(
    type = "line", 
    x0 = 0, 
    x1 = 1, 
    xref = "paper",
    y0 = y, 
    y1 = y, 
    line = list(color = color)
  )
}


Winterzeit_osna <- plot_ly(data, x = ~Nacht1, y = ~Daytime, type = 'bar', marker = list(color = "#1f2b3f"),
             name = 'Nacht1', orientation = "h", hoverinfo = "text", 
             text = ~paste("Datum: ", datasetname[,1], "<br>Sonnenaufgang: ", datasetname[,5], 
                           "<br>Sonnenuntergang: ", datasetname[,6],"<br>Helle Stunden: ",datasetname[,3])) %>%
  add_trace(x = ~Tag, name = 'Tag', orientation = "h",marker = list(color = "#ffef11")) %>%
  add_trace(x = ~Nacht2, name = 'Nacht2', orientation = "h",marker = list(color = "#1f2b3f")) %>%
  layout(
    yaxis = list(autotick = FALSE,showticklabels =TRUE, title = FALSE,dtick='M1',type='date', fixedrange = TRUE, autorange="reversed"),
     xaxis = list(title = "Uhrzeit",fixedrange = TRUE,autotick = FALSE,tick0 = 0, dtick = 2),
    barmode = 'stack', 
    showlegend=FALSE,
    shapes = list(hline("2019-02-01"),hline("2019-03-01"),hline("2019-04-01"),hline("2019-05-01"),hline("2019-06-01"),hline("2019-07-01"),hline("2019-08-01"),hline("2019-09-01"),hline("2019-10-01"),hline("2019-11-01"),hline("2019-12-01"))) %>%
  config(displayModeBar = F)
print(Winterzeit_osna)
# Konvertieren in plotly html-Widget
#Kann man vermutlich auch weglassen. Hatte das zunächst versucht, um die Größe der Output-Datei zu reduzieren
plot_neu <- ggplotly(Winterzeit_osna, width = 700, height = 1050)
print(plot_neu)
# Export als html-Widget
saveWidget(plot_neu, "plot_Winterzeit_osna.html")
Sys.setenv("plotly_username"="USERNAME")
Sys.setenv("plotly_api_key"="API_KEY")
chart_link = api_create(plot_neu, filename = "winterzeit_osna")
chart_link


# ##################################FLENSBURG
datasetname = read.csv("Winterzeit_Flensburg.csv", header = TRUE, sep = "\t", quote = "\"",
                       dec = ".")


Daytime <- datasetname[,7]
Nacht1 = as.numeric(substr(datasetname[,2],1,2))+as.numeric(substr(datasetname[,2],4,5))/60+as.numeric(substr(datasetname[,2],7,8))/3600

Tag = as.numeric(substr(datasetname[,3],1,2))+as.numeric(substr(datasetname[,3],4,5))/60+as.numeric(substr(datasetname[,3],7,8))/3600

Nacht2 = as.numeric(substr(datasetname[,4],1,2))+as.numeric(substr(datasetname[,4],4,5))/60+as.numeric(substr(datasetname[,4],7,8))/3600

data <- data.frame(Daytime, Nacht1, Tag, Nacht2)

hline <- function(y = 0, color = "white") {
  list(
    type = "line",
    x0 = 0,
    x1 = 1,
    xref = "paper",
    y0 = y,
    y1 = y,
    line = list(color = color)
  )
}


Winterzeit_flens <- plot_ly(data, x = ~Nacht1, y = ~Daytime, type = 'bar', marker = list(color = "#1f2b3f"),
                  name = 'Nacht1', orientation = "h", hoverinfo = "text",
                  text = ~paste("Datum: ", datasetname[,1], "<br>Sonnenaufgang: ", datasetname[,5],
                                "<br>Sonnenuntergang: ", datasetname[,6],"<br>Helle Stunden: ",datasetname[,3])) %>%
  add_trace(x = ~Tag, name = 'Tag', orientation = "h",marker = list(color = "#ffef11")) %>%
  add_trace(x = ~Nacht2, name = 'Nacht2', orientation = "h",marker = list(color = "#1f2b3f")) %>%
  layout(
    yaxis = list(autotick = FALSE,showticklabels =TRUE, title = FALSE,dtick='M1',type='date', fixedrange = TRUE, autorange="reversed"),
    xaxis = list(title = "Uhrzeit",fixedrange = TRUE,autotick = FALSE,tick0 = 0, dtick = 2),
    barmode = 'stack',
    showlegend=FALSE,
#    title = "Wenn in Flensburg immer Winterzeit wäre",
    shapes = list(hline("2019-02-01"),hline("2019-03-01"),hline("2019-04-01"),hline("2019-05-01"),hline("2019-06-01"),hline("2019-07-01"),hline("2019-08-01"),hline("2019-09-01"),hline("2019-10-01"),hline("2019-11-01"),hline("2019-12-01"))) %>%
  config(displayModeBar = F)
print(Winterzeit_flens)
# Konvertieren in plotly html-Widget
plot_neu <- ggplotly(Winterzeit_flens, width = 700, height = 1050)
# Export als html-Widget
#saveWidget(plot_neu, "plot_Winterzeit_flensburg.html")
chart_link = api_create(plot_neu, filename = "winterzeit_flensburg")
chart_link



##################################SCHWERIN
datasetname = read.csv("Winterzeit_Schwerin.csv", header = TRUE, sep = "\t", quote = "\"",
                       dec = ".")


Daytime <- datasetname[,7]
Nacht1 = as.numeric(substr(datasetname[,2],1,2))+as.numeric(substr(datasetname[,2],4,5))/60+as.numeric(substr(datasetname[,2],7,8))/3600

Tag = as.numeric(substr(datasetname[,3],1,2))+as.numeric(substr(datasetname[,3],4,5))/60+as.numeric(substr(datasetname[,3],7,8))/3600

Nacht2 = as.numeric(substr(datasetname[,4],1,2))+as.numeric(substr(datasetname[,4],4,5))/60+as.numeric(substr(datasetname[,4],7,8))/3600

data <- data.frame(Daytime, Nacht1, Tag, Nacht2)

hline <- function(y = 0, color = "white") {
  list(
    type = "line",
    x0 = 0,
    x1 = 1,
    xref = "paper",
    y0 = y,
    y1 = y,
    line = list(color = color)
  )
}


Winterzeit_schwerin <- plot_ly(data, x = ~Nacht1, y = ~Daytime, type = 'bar', marker = list(color = "#1f2b3f"),
                   name = 'Nacht1', orientation = "h", hoverinfo = "text",
                   text = ~paste("Datum: ", datasetname[,1], "<br>Sonnenaufgang: ", datasetname[,5],
                                 "<br>Sonnenuntergang: ", datasetname[,6],"<br>Helle Stunden: ",datasetname[,3])) %>%
  add_trace(x = ~Tag, name = 'Tag', orientation = "h",marker = list(color = "#ffef11")) %>%
  add_trace(x = ~Nacht2, name = 'Nacht2', orientation = "h",marker = list(color = "#1f2b3f")) %>%
  layout(
    yaxis = list(autotick = FALSE,showticklabels =TRUE, title = FALSE,dtick='M1',type='date', fixedrange = TRUE, autorange="reversed"),
    xaxis = list(title = "Uhrzeit",fixedrange = TRUE,autotick = FALSE,tick0 = 0, dtick = 2),
    barmode = 'stack',
    showlegend=FALSE,
    shapes = list(hline("2019-02-01"),hline("2019-03-01"),hline("2019-04-01"),hline("2019-05-01"),hline("2019-06-01"),hline("2019-07-01"),hline("2019-08-01"),hline("2019-09-01"),hline("2019-10-01"),hline("2019-11-01"),hline("2019-12-01"))) %>%
  config(displayModeBar = F)
print(Winterzeit_schwerin)
# Konvertieren in plotly html-Widget
plot_neu <- ggplotly(Winterzeit_schwerin, width = 700, height = 1050)
# Export als html-Widget
saveWidget(plot_neu, "plot_Winterzeit_schwerin.html")
chart_link = api_create(plot_neu, filename = "winterzeit_schwerin")
chart_link