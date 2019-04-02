
library(plotly)
library(ggplot2)
library(htmlwidgets)

#Working Directory setzen
setwd("/PFAD")


dateiname = c("Osnabrück_Zeiten_2019.csv","Daten_Flensburg.csv","Daten_Schwerin.csv")
stadt = c("Osnabrück","Flensburg","Schwerin")
stadtkurz = c("osna","flensburg","schwerin")
pname = c("p_osna","p_flensburg","p_schwerin")

for(i in 1:3){
datasetname = read.csv(dateiname[i], header = TRUE, sep = "\t", quote = "\"",
         dec = ".")
Daytime <- datasetname[,8]
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

p = 0
p <- plot_ly(data, x = ~Nacht1, y = ~Daytime, type = 'bar', marker = list(color = "#1f2b3f"),
             name = 'Nacht1', orientation = "h", hoverinfo = "text", 
             text = ~paste("Datum: ", datasetname[,1], "<br>Sonnenaufgang: ", substr(datasetname[,5],1,5), 
                           "<br>Sonnenuntergang: ", substr(datasetname[,6],1,5),"<br>Helle Stunden: ",substr(datasetname[,3],1,5))) %>%
  add_trace(x = ~Tag, name = 'Tag', orientation = "h",marker = list(color = "#ffef11")) %>%
  add_trace(x = ~Nacht2, name = 'Nacht2', orientation = "h",marker = list(color = "#1f2b3f")) %>%
  layout(
     yaxis = list(autotick = FALSE,showticklabels =TRUE, title = FALSE,dtick='M1',type='date', fixedrange = TRUE, autorange="reversed"),
     xaxis = list(title = "Uhrzeit",fixedrange = TRUE,autotick = FALSE,tick0 = 0, dtick = 2),
    barmode = 'stack', 
    showlegend=FALSE,
  #  title = paste("Sonnenaufgang und -untergang in", stadt[i]),
    shapes = list(hline("2019-02-01"),hline("2019-03-01"),hline("2019-04-01"),hline("2019-05-01"),hline("2019-06-01"),hline("2019-07-01"),hline("2019-08-01"),hline("2019-09-01"),hline("2019-10-01"),hline("2019-11-01"),hline("2019-12-01"))) %>%
  config(displayModeBar = F) %>%
  add_annotations(x = c(7,8.1),
                  y = c("2019-03-31","2019-10-27"),
                  text = c("Zeitumstellung<br>31.3.","Zeitumstellung<br>27.10."),
                  xref = "x",
                  yref = "y",
                  showarrow = TRUE,
                  arrowhead = 4,
                  arrowsize = .5,
                  xanchor = "left",
                  yanchor = "middle",
                  ax = 10,
                  ay = -5)
# Konvertieren in plotly html-Widget
#Kann man vermutlich auch weglassen. Hatte das zunächst versucht, um die Größe der Output-Datei zu reduzieren
plot_neu <- ggplotly(p, width = 700, height = 1050)
# Export als html-Widget
saveWidget(plot_neu, paste("plot",stadtkurz[i],".html",sep=""))
#Hier Plotly-Username und API-Key eintragen
Sys.setenv("plotly_username"="USERNAME")
Sys.setenv("plotly_api_key"="API-KEY")
chart_link = api_create(plot_neu, filename = paste("zeitumstellung_",stadt[i],sep=""))
chart_link
}

