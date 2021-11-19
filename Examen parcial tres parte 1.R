library(BiocGenerics)
library(parallel)
library(S4Vectors)
library(stats4)
library(IRanges)
library(XVector)
library(GenomeInfoDb)
library(Biostrings)
library(rtracklayer)
library(msa)
library(seqinr)
library(ape)
library(phytools)
library(maps)
library(EBImage)
library(ggtree)
library(ggimage)
library(ggplot2)
BiocManager::install("phytools")
BiocManager::install("maps")
BiocManager::install("EBImage")
BiocManager::install("ggtree")
BiocManager::install("ggimage")

##1. lineammientos

insulinas <- readAAStringSet ("Insulinas.fasta")
names(insulinas) <- c("Homo Sapiens", "Pan troglodytes", "Rattus norvegicus", "Canis lupus familiaris", "Mus musculus", "Oryctolagus cuniculus", "Sus scrofa", "Gallus gallus", "Bos taurus", "INS_SHEEP", "Loxodonta africana", "INS_PHYMC", "Cavia porcellus", "sp|P01330.1") 
insulinas ###Leer el archivo fasta

alCO <- msaClustalOmega(insulinas) 
alCO
alCW <- msaClustalW(insulinas)
alM <- msaMuscle(insulinas)

### matriz de distancias
# 1. convierto mi archivo para poder tener mi matriz de distancia con el paquete seqinr
alCOm <- msaConvert(alCO, type =  "seqinr::alignment")
alCWm <- msaConvert(alCW, type =  "seqinr::alignment")
alMm <-  msaConvert(alM, type =  "seqinr::alignment")
# 2. obtengo mi matriz de distancia
disCO <- dist.alignment(alCOm, "identity")
disCO
disCW <- dist.alignment(alCWm, "identity")
disM <- dist.alignment(alMm, "identity")

arbol1 <- nj (disCO) #Hacemos la distancia del arbol por el metodo nj
arbol1 <- ggtree(arbol1, layout="slanted") #usamos el paquete ggtree y le indicamos a R que haga el arbol con el metodo deseado
plot(arbol1) #en este caso slated y así en cada arbo e imprimimos el plot
arbol2 <- nj (disCW)
arbol2 <- ggtree(arbol2, layout="radial") 
plot(arbol2)
arbol3 <- nj (disM)
arbol3 <- ggtree(arbol3, layout="radial") 
plot(arbol3)

### Para que aparezca unicamente el nombre de la especie
#Cambiamos los nombres en el archivo de las insulinas al nombre de la especie eso esta en el paso 1
#hacemos el arbol

arbolbonis <- ggtree(arbol1, aes(color=branch.length)) + xlim(0, 90) + geom_tiplab(size=2,color="plum1") + geom_label2(aes(subset=!isTip, label=node), size=2, color="darkred", alpha=0.5) + theme_tree2("black") +theme(legend.position="bottom")
plot(arbolbonis)
#geom_trilab es la función con la que se agregan los nombre, #color branch es la escala etc



