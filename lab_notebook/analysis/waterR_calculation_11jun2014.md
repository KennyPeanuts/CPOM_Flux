# Calculation of sediment oxygen demand for the CPOM Flux Exp

## Date of Run 

11 June 2014

## Metadata

### Collected by:

KP

### Created on:

24 June 2014

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of water oxygen demand from the winkler titration data from the CPOM Flux Experiment

## R Code

### Import Data

    sod <- read.delim("./data/cpom_flux_sod_10jun2014.csv", header = T, sep = ",")
    sod.calc <- read.delim("./data/sod_calculation_10jun2014.csv", header = T, sep = ",")
    water <- read.delim("./data/cpom_flux_waterR_11jun2014.csv", header = T, sep = ",")
    std <- read.delim("./data/winkler_standardization_11jun2014.csv", header = T,  sep = ",")
    vial <- read.delim("./data/vial_volume_summer_2014.csv", header = T,  sep = ",")

###Calculations

    # DO Calculations
    ## Add vial vial volumes to the sod data.dframe for T1
    waterTF <- merge(water, vial, by.x = "vial", by.y = "vial")
    ## Calculation of [DO] of TF water samples
    DOvol.TF <- (((waterTF$RmeasTF - std$Rblk) * std$Vstd * std$Nstd * std$E) / ((std$Rstd - std$Rblk) * (waterTF$vol - std$Vreg))) - std$DOreg
    ## Convert from ml/L to mmol/L
    R <- 0.08205746 # ideal gas constant in (L atm)/(mol K)
    T <- water$temp + 273.15 # convert C to K
    P <- water$pressure * 0.03342 # convert in Hg to atm
    DOmmol.TF <- (P * DOvol.TF) / (R * T)
    ## Calculate the change in concentration
    dDO <- sod.calc$DOpre - DOmmol.TF
    ## Convert times to POSIXlt standard
    t0 <- as.POSIXlt(sod$time0)
    tF <- as.POSIXlt(water$timeF)
    ## Calculate the incubation hours
    incubation.h <- tF - t0
    incubation.h <- as.numeric(incubation.h)
    ## Normalize by hours of incubation
    dDO.h <- dDO / incubation.h
    ## Make data frame of relevant variables
    waterR <- data.frame(waterTF$bod, waterTF$CPOM, waterTF$Nutrient, waterTF$temp, sod.calc$DOpre, DOmmol.TF, dDO, dDO.h)
    names(waterR) <- c("bod", "CPOM", "nutrient", "temp", "DO.T0", "DO.TF", "dDO", "waterR")

    ## Make Data Table
    write.table(waterR, "./data/waterR_calculation_11jun2014.csv", quote = F, row.names = F, sep = ",")
    
