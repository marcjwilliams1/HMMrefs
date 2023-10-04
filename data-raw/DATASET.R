## code to prepare `DATASET` dataset goes here

library(rtracklayer)
library(glue)
library(tidyverse)
options(scipen = 999)
mydir_37 <- "/juno/work/shah/users/william1/projects/smallprojects/hmmcopybins/wigfiles/grch37"
#binsizes <- paste(c(100, 200, 500, 1000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000, 2000000, 5000000))

binsizes <- paste(c(10000, 20000, 50000, 100000, 200000, 500000, 1000000, 2000000, 5000000))


grch37 <- list()
for (bs in binsizes){
  print(bs)
  map <- import(glue(paste0(mydir_37, "/GRCh37-lite.map.ws_{bs}.wig"))) %>%
    as.data.frame() %>%
    dplyr::rename(chr = seqnames, mappability = score) %>%
    dplyr::select(chr, start, end, mappability)

  gc <- import(glue(paste0(mydir_37, "/GRCh37-lite.gc.ws_{bs}.wig"))) %>%
    as.data.frame() %>%
    dplyr::rename(chr = seqnames, gc = score) %>%
    dplyr::select(chr, start, end, gc)

  df <- inner_join(map, gc)
  grch37[[bs]] <- df
}

mydir_38 <- "/juno/work/shah/users/william1/projects/smallprojects/hmmcopybins/wigfiles/grch38"
grch38 <- list()
for (bs in binsizes){
  print(bs)
  map <- import(glue(paste0(mydir_38, "/GRCh38.map.ws_{bs}.wig"))) %>%
    as.data.frame() %>%
    dplyr::rename(chr = seqnames, mappability = score) %>%
    dplyr::select(chr, start, end, mappability)

  gc <- import(glue(paste0(mydir_38, "/GRCh38.gc.ws_{bs}.wig"))) %>%
    as.data.frame() %>%
    dplyr::rename(chr = seqnames, gc = score) %>%
    dplyr::select(chr, start, end, gc)

  df <- inner_join(map, gc)
  grch38[[bs]] <- df
}

references <- list("hg19" = grch37,
                   "hg38" = grch38)

usethis::use_data(references, overwrite = TRUE)
