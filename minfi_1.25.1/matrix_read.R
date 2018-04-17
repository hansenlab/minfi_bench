library(minfi)
library(SummarizedExperiment)
library(pryr)
library(devtools)

idat.files <- list.files("data/GSE110544",
                         pattern = "_Grn.idat.gz",
                         full.names = TRUE)

gc()
system.time({
    rgSet <- read.metharray(idat.files, verbose = TRUE)
})
gc()
object_size(rgSet)

save(rgSet, file = "data/minfi_1.25.1/rgSet_matrix.rda")
sessionInfo()
