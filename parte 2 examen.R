 proteina <- function(X) {
   A <- 71.03711
   C <- 103.00919
   D <- 115.02694
   E <- 129.04259
   F <- 147.06841
   G <- 57.02146
   H <- 137.05891
   Yo <- 113.08406
   K <- 128.09496
   L <- 113.08406
   M <- 131.04049
   N <- 114.04293
   P <- 97.05276
   Q <- 128.05858
   R <- 156.10111
   S <- 87.03203
   T <- 101.04768
   V <- 99.06841
   W <- 186.07931
   Y <- 163.06333 
   
   for (X in aa) {
     
   }
   }
  ###En mi función indico el peso de cada aminoacido 
 ## el peso es igual a la suma de cada aminoacido
proteina()

library(BiocGenerics)
library(parallel)
library(S4Vectors)
library(stats4)
library(IRanges)
library(XVector)
library(GenomeInfoDb)
library(Biostrings)
library(rtracklayer)
virus <- readDNAStringSet("https://ftp.ncbi.nlm.nih.gov/genomes/Viruses/abaca_bunchy_top_virus_uid28697/NC_010314.fna")
virus 
proteina(virus)

#no termine pero tengo que hacer un vector con el peso de los aminoacidos e indicar en el ciclo for que vaya sumando el peso de cada aminoacido cada que aparezca en la secuencia
#mi x sería la secuencia de aa que agregue
