
rm(list=ls(all=TRUE))
options(encoding = "UTF-8")  
library(sp)
library(RColorBrewer)
library(ggplot2)
library(maptools)
library(scales)
setwd("/Users/ivanmendivelso/Desktop/COL_adm")
ohsCol2 <- readShapeSpatial("COL_adm1.shp")
ohsColI2 <- fortify(ohsCol2)
grupo2 <- data.frame(id = unique(ohsColI2[ , c("id")]))
deptos <- read.csv('datos departamentos.csv', sep = ';')

dim(deptos)




grupo2[ , "Porcentaje"] <- deptos
rownames(grupo2) <- c('Antioquia',
                   'Atlántico',
                   'Bolívar',
                   'Boyacá',
                   'Caldas',
                   'CAQUETÁ',
                   'Cauca',
                   'Cesar',
                   'Córdoba',
                   'Cundinamarca',
                   'Chocó',
                   'Huila',
                   'La Guajira',
                   'Magdalena',
                   'Meta',
                   'NARIÑO',
                   'Norte de Santander',
                   'Quindío',
                   'Risaralda',
                   'Santander',
                   'Sucre',
                   'Tolima',
                   'Valle del Cauca',
                   'Arauca',
                   'Casanare',
                   'Putumayo',
                   'San Andrés',
                   'Amazonas',
                   'Guainía',
                   'Guaviare',
                   'Vaupés',
                   'Vichada')
        
ohsColI2 <- merge(ohsColI2, grupo2, by = "id")
mapColDep <- ggplot() + geom_polygon(data=ohsColI2, aes(x=long, y=lat, group = group, fill = Porcentaje), colour ="white", size = 0.3) + labs(title = "Colombia", fill = "") + labs(x="",y="",title="EXPOSITORES POR DEPARTAMENTO") + scale_x_continuous(limits=c(-80,-65)) + scale_y_continuous(limits=c(-5,13))
mapColDep

ggsave(mapColDep, file = "Rural.png", width = 5, height = 4.5, type = "cairo-png")
getwd
ls()



