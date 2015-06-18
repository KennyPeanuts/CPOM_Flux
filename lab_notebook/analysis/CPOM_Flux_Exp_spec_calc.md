# Calculation of the ratio of DOM absorbance at 254nm and 336nm from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to calculate the ratio of the absorbance of the DOM at 254nm and 336nm the spec scan data from the treatments with and without CPOM and/or nutrients

Analysis methods taken from:

> Helms, J. R. A. Stubbins, J. D. Ritchie, E. C. Minor, D. J. Kieber, K. Mopper. 2008. Absorption spectral slopes and slope ratios as indicators of molecular weight, source, and photobleaching of chromophoric dissolved organic matter. Limnology and Oceanography 53:955-969.

## Import data

    spec10 <- read.table("./data/cpom_flux_spec_10jun2014.csv", header = T, sep = ",")
    spec12 <- read.table("./data/cpom_flux_spec_12jun2014.csv", header = T, sep = ",")
    spec17 <- read.table("./data/cpom_flux_spec_17jun2014.csv", header = T, sep = ",")
    spec24 <- read.table("./data/cpom_flux_spec_24jun2014.csv", header = T, sep = ",")
    spec01 <- read.table("./data/cpom_flux_spec_1jul2014.csv", header = T, sep = ",")
    sod10 <- read.table("./data/cpom_flux_sod_10jun2014.csv", header = T, sep = ",") # imported to get treatment assignments to bod IDs

## Combine dates

    spec.all <- rbind(spec10, spec12, spec17, spec24, spec01)
    ## make date list
    day <- c(rep("2014-06-10", length(spec10$bod)), rep("2014-06-12", length(spec12$bod)), rep("2014-06-17", length(spec17$bod)), rep("2014-06-24", length(spec24$bod)), rep("2014-07-01", length(spec01$bod)))
    spec.tot <- data.frame(day, spec.all)

### Merge with treatments

    treat <- sod10[, c(1, 4, 5)] # selects for the relevant colums from the sod data.frame
    spec <- merge(treat, spec.tot, by.x = "bod", by.y = "bod")

## Data Analysis

### Calculate 254:365

    ratio254.abs <- spec$abs[spec$wl == 254] / spec$abs[spec$wl == 365]
    bod254 <- spec$bod[spec$wl == 254]
    CPOM254 <- spec$CPOM[spec$wl == 254]
    Nutrient254 <- spec$Nutrient[spec$wl == 254]
    day254 <- spec$day[spec$wl == 254]
    ratio254 <- data.frame(bod254, day254, CPOM254, Nutrient254, ratio254.abs)
    names(ratio254) <- c("bod", "day", "CPOM", "nutrient", "ratio254")

    elapsed10 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-10"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed12 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-12"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed17 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-17"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed24 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-06-24"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed01 <- as.numeric(difftime(ratio254$day[ratio254$day == "2014-07-01"], ratio254$day[ratio254$day == "2014-06-10"], units = "days"))
    elapsed.d <- c(elapsed10, elapsed12, elapsed17, elapsed24, elapsed01)

#### Make Data Frame of ratio254 with elapsed time

    # the order stmnt is to sort ratio254 so that it matches the sort of elapsed.d
    r254.t <- data.frame(ratio254[order(as.Date(ratio254$day)), ], elapsed.d)

#### Make Data File for the Calculated Data

    write.table(r254.t, "./data/CPOM_Flux_r254.csv", quote = F, row.names = F, sep = ",")

