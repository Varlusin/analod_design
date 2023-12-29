library(plotly) 
library(ggplot2)
df <- read.csv('./sp_data/nvab3d.csv')
df<-df[2: 62]
Vds <- seq(from = 0, to = 1.8, by = 0.03)
Vgs<- seq(0, 1.8, 0.03)
I <- data.matrix(df, rownames.force = NA)


fig <- plot_ly(
  x = ~Vgs,
  y = ~Vds,
  z = ~I)%>% add_surface()

fig


fig <- fig %>% layout(
  scene = list(
    xaxis = list(nticks = 20),
    zaxis = list(nticks = 4),
    camera = list(eye = list(x = 0, y = -1, z = 0.5)),
    aspectratio = list(x = .9, y = .8, z = 0.2)))

fig





unicv <- unique(df$Vds)
unicv

fig <-plot_ly()

for(i in unicv) {
  fig <- fig %>%add_trace(data = df[df$Vgs == i,], x = ~vin,  y = ~ -Iddrane, 
                          type = 'scatter', mode = 'lines',
                          colar = ~satdrane
                          
                          )
  
}

fig <- fig %>%add_trace(data = df[df$Vgs == "1.2(Վ)",], x = ~vin,  y = ~ -Idgate, 
                        type = 'scatter', mode = 'lines',
                        colar = ~satdrane,
                        legendgroup = ~satdrane
)

fig









pal <- c( "red", "blue","orange", "green",  "magenta")
pal <- setNames(pal, unique(df$Vds))

fig <- plot_ly(df, color =  ~satdrane, legendgroup = ~satdrane , type ='scatter', mode = 'lines')

fig <- fig%>%
  add_trace(
    y= ~ -Iddrane , x= ~vin, color = ~satdrane,
    #orientation = 'h',  #text = ~ rez,
    #hovertemplate = paste('<br><b>Vout</b>:%{y:.3f}<br>', 
    #                     '<i>Vin</i>: %{x}'), 
    transforms = list(
      list(
        type = 'groupby',
        groups = df$Vgs
        #styles = list(
         # list(target = 4, value = list(marker =list(color = 'blue'))),
          #list(target = 6, value = list(marker =list(color = 'red'))),
          #list(target = 8, value = list(marker =list(color = 'black')))
        #)
      )
    )
    
    
    
    )

fig <- fig%>%
  layout( title = "ՆՄՕԿ։", legend=list(title=list(text='Vgs', x = 1, y = 1)),
          xaxis = list( 
            title = 'ԸՄԲԻՉ ԱԿՈՒՆՔ ԼԱՐՈՒՄԸ։'
            #zerolinecolor = '#ffff', 
            #zerolinewidth = 2, 
            #gridcolor = 'ffff'
          ), 
          yaxis = list( 
            title = 'ԸՄԲԻՉԻ ՀՈՍԱՆՔԸ։'
            #zerolinecolor = '#ffff', 
            #zerolinewidth = 2, 
            #gridcolor = 'ffff'),
            #bargap = 1
          ))
fig


