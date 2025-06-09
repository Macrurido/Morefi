## Botete.rda
# Read my data
mydata <- read.table("./inst/extdata/Botete_231002.csv", header =TRUE, sep =",")
# Delete all rows that contain any null value
tmp <- na.omit(mydata)
# Converting measurements from mm to cm.
tmp[,c(1,2,3)] <- tmp[,c(1,2,3)]/10

set.seed(123)
tmp <- tmp[sample(nrow(tmp)), ]

# We established key guidelines for data handling
tmp <- tmp[tmp$WT >= tmp$WB & tmp$WT >= tmp$Wfi & tmp$WB != tmp$Wfi,]  # The rule

# Variable 7 as factor
tmp[,7] <- as.factor(tmp[,7])

Botete <- tmp
#usethis::use_data(Botete, internal = TRUE,overwrite= TRUE)
# Save as rda file

save(Botete, file="./data/Botete.rda")

#use_data(Botete, compress= "bzip2", overwrite= TRUE)
#usethis::use_data(Botete, internal = TRUE,
#                  compress= "xz", overwrite= TRUE)

## Botete_land.rda
# Read my data
mydata <- read.table("./inst/extdata/Botete_catch.csv", header =TRUE, sep =",")
# Delete all rows that contain any null value
tmp <- na.omit(mydata) # Delete all rows that contain any null value

Botete_land <- tmp
save(Botete_land, file="./data/Botete_land.rda")
#use_data(Botete_land, compress= "bzip2", overwrite= TRUE)
#save(tmp, file = "./data/Botete_land.RData")
#library(usethis)

#usethis::use_data(Botete_land, internal = TRUE,
#                  compress= "xz", overwrite= TRUE)
#use_data(Botete, compress= "bzip2", overwrite= TRUE)

#usethis::use_data(Botete, Botete_land, internal = TRUE,
#                  compress= "xz", overwrite= TRUE)

