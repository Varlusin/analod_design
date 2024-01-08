library(plotly) 
library(ggplot2)

df <- read.csv(url("https://github.com/Varlusin/analod_design/raw/main/sp_data/cs_dcAnalys.csv"))

pal <- c("green", "blue", "magenta", "red", "goldenrod", "darkorange", "purple4", "indianred","yellow","plum", "gray")
pal <- setNames(pal, unique(df$rez))
l <- list(
  font = list(
    family = "sans-serif",
    size = 10,
    color = "#000"),
  bgcolor = "#E2E2E2",
  bordercolor = "#FFFFFF",
  borderwidth = 2, orientation = 'h')

fig1 <- plot_ly()%>%
  add_trace(data = df , x = ~Vin, y= ~Vout , color = ~rez,
            type ='scatter',  mode = 'lines', text = ~ rez,
            hovertemplate = paste('<br><b>Vout</b>:%{y:.3f}<br>', 
                                  '<i>Vin</i>: %{x}'), 
            colors = pal,
            line = list( width = 3), legendgroup = ~rez
            )%>%
  
  add_trace(x= ~c(0.5 ,2.3), y= ~c(0, 1.8),
            type ='scatter',  mode = 'lines',
            name = 'Vout = Vin - Vth',  #showlegend = F,
            line = list(color = 'rgb(128, 128, 128)', width = 2, dash = 'dot'))%>%
  
  layout(
          legend=l,
          plot_bgcolor='#e5ecf6', 
          xaxis = list( 
            #zerolinecolor = '#ffff', 
            #zerolinewidth = 2, 
            #gridcolor = 'ffff'
          ), 
          yaxis = list( 
            #zerolinecolor = '#ffff'
            #zerolinewidth = 2, 
            #gridcolor = 'ffff',
            #bargap = 1
          ))

fig2 <- plot_ly()%>%
  add_trace(data = df , x = ~Vin, 
            y= ~gain , color = ~rez,
            type ='scatter',  mode = 'lines', 
            orientation = 'h', text = ~ rez,
            hovertemplate = paste('<br><b>Gain</b>:%{y:.3f}<br>',  
                                  '<i>Vin</i>: %{x}'), 
            colors = pal, showlegend = F,
            line = list( width = 3), legendgroup = ~rez)%>%
  layout(
          legend=list(title=list(text='Rdr')),
          plot_bgcolor='#e5ecf6', 
          xaxis = list( 
            #zerolinecolor = '#ffff', 
            #zerolinewidth = 2, 
            #gridcolor = 'ffff'
          ), 
          yaxis = list( 
            #zerolinecolor = '#ffff', 
            #zerolinewidth = 2, 
            #gridcolor = 'ffff'),
            #bargap = 1
          ))

fig <- subplot( fig1, fig2, nrows = 2, margin = 0,  shareX = T, titleY = FALSE, titleX = FALSE)

fig


#library(htmlwidgets)

#saveWidget(fig, "p1.html", selfcontained = F, libdir = "lib")






