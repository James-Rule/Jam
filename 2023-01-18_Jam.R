### Jame title ###

# Seals r cool
library(tidyverse)
library(dplyr)
taxa <- c("cool_seal","uncool_seal","bob","zorg")
glimpse(taxa)
coolness <- c(70,63,82,1)
sealdata <- data.frame(taxa,coolness,row.names = 1)
sealdata

##lets give the seals a phylogeny##
library(ape)
library(picante)
library(RRphylo)
library (geiger)
library(nlme)
library(paleotree)
library(phangorn)

species <- c("cool_seal","uncool_seal","bob","zorg")
species

orig_tree <- rtree(n = 4, tip.label = species) #make a tree with species
plot(orig_tree)

#match data frames#
sealplus <- treedata(orig_tree, sealdata) #matches data frame species to phylogeny
sealplus

sealfinalTree <- sealplus$phy
plot(sealfinalTree)
tiplabels()
nodelabels()
sealfinalData <- as.data.frame(sealplus$data)

#create ancestral state estimations
rate<-as.matrix(sealfinalData)[,1]
rate

fitEB<-anc.ML(sealfinalTree,rate,model="BM")
fitEB

#plot ancestral state estimations
fit.all<-contMap(sealfinalTree,rate)
fit.all
