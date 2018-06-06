library(minfi)
library(SummarizedExperiment)
library(HDF5Array)
library(pryr)


idat.files <- list.files("data/GSE110544", pattern = "_Grn.idat.gz", full.names = TRUE)
rgSet <- read.metharray(idat.files, verbose = TRUE)
save(rgSet, file = "data/rgSet_memory_matrix.rda")

assays(rgSet) <- endoapply(assays(rgSet), DelayedArray)
save(rgSet, file = "data/rgSet_memory_DelayedMatrix.rda")

assays(rgSet) <- endoapply(assays(rgSet), as, "HDF5Array")
saveHDF5SummarizedExperiment(rgSet, dir = "data/rgSet_hdf5", replace = TRUE, verbose = TRUE)

saveHDF5SummarizedExperiment(rgSet, dir = "data/rgSet_hdf5_c100000x25", replace = TRUE,
                             verbose = TRUE, chunkdim = c(100000,25))

