library(minfi)
library(SummarizedExperiment)
library(pryr)
library(devtools)
load("data/minfi_1.25.1/rgSet_matrix.rda")
getManifest(rgSet)
gc()

gc()
system.time( {
    mSet <- preprocessRaw(rgSet)
})
gc()
object_size(mSet)

gc()
system.time( {
    mSet <- preprocessIllumina(rgSet)
})
gc()
object_size(mSet)

gc()
system.time( {
    mSet <- preprocessSwan(rgSet)
})
gc()
object_size(mSet)

gc()
system.time( {
    mSet <- preprocessNoob(rgSet)
})
gc()
object_size(mSet)

gc()
system.time( {
    mSet <- preprocessQuantile(rgSet)
})
gc()
object_size(mSet)

gc()
system.time( {
    mSet <- preprocessFunnorm(rgSet)
})
gc()
object_size(mSet)

sessionInfo()
