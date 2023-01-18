### Jame title ###

# Seals r cool
library(tidyverse)
library(dplyr)
seals <- c("cool_seal","uncool_seal","bob","zorg")
glimpse(seals)
coolness <- c(70,63,82,1)
sealdata <- data.frame(seals,coolness, row.names = NULL)
sealdata
