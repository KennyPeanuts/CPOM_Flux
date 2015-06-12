# Calculation of sediment oxygen demand for the CPOM Flux Exp

## Date of Run 

INSERT DATE HERE

## Metadata

### Collected by:

AG, KP

### Created on:

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of sediment oxygen demand from the winkler titration data from the CPOM Flux Experiment

## R Code

### Import Data

    sod <- read.delim("./data/cpom_flux_sod_DATE.csv", header = T, stringsAsFactors = F, sep = ",")
    std <- read.delim("./data/winker_standardization_DATE.csv", header = T)
    repl <- read.delim("./data/repl_water_DATE.csv", header = T)
    vial <- read.delim("./data/vial_volume_summer_2014.csv", header = T)

###Calculations

    # DO Calculations
    ## Add vial vial volumes to the sod data.dframe for T1
    sodT0 <- merge(sod, vial, by.x = "vialT0", by.y = "vial")
    ## Calculation of [DO] of T0 samples
    DOvol.T0 <- (((sod$RmeasT0 - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (sodT0$volume - std$Vreg)) - std$DOreg
    ## Add vial vial volumes to the sod data.dframe for T1
    sodTF <- merge(sod, vial, by.x = "vialTF", by.y = "vial")
    ## Calculation of [DO] of TF samples
    DOvol.TF <- (((sod$RmeasTF - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (sodTF$volume - std$Vreg)) - std$DOreg
    ## Add vial vial volumes to the sod data.dframe for T1
    repl <- merge(repl, vial, by.x = "vial", by.y = "vial")
    ## Calculation of replacement water [DO] no nutrients
    replDOvol0 <- (((repl$Rmeas[repl$Nutrients == "no"] - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (repl$volume[repl$Nutrients == "no" - std$Vreg)) - std$DOreg
    ## Calculation of the replacement water [DO] nutrients
    replDOvolN <- (((repl$Rmeas[repl$Nutrients == "yes"] - std$Rblk) std$Vstd * std$Nstd * std$E)/(std$Rstd - std$Rblk) * (repl$volume[repl$Nutrients == "yes" - std$Vreg)) - std$DOreg
    ## Convert from ml/L to mmol/L
    R <- 0.08205746 # ideal gas constant in (L atm)/(mol K)
    T <- sod$temp + 273.15 # convert C to K
    P <- sod$pressure * 0.03342 # convert in Hg to atm
    DOmmol.T0 <- (P * DOvol.T0) / (R * T)
    DOmmol.TF <- (P * DOvol.TF) / (R * T)
    replDOmmol0 <- (P * replDOvol0) / (R * T)
    replDOmmolN <- (P * replDOvolN) / (R * T)
    # SOD Calculations
    ## Calculation of T0 DO concentration
    DO.T0.0 <- (DOmmol.T0[sod$Nutrient == "no"] * (1 - (Replvol[sod$Nutrient == "no"] / BODwatervol[sod$Nutrient == "no"]))) + (replDOmmol0 * (Replvol[sod$Nutrient == "no"] / BODwatervol[sod$Nutrient == "no"]))
    DO.T0.N <- (DOmmol.T0[sod$Nutrient == "yes"] * (1 - (Replvol[sod$Nutrient == "yes"] / BODwatervol[sod$Nutrient == "yes"]))) + (replDOmmolN * (Replvol[sod$Nutrient == "yes"] / BODwatervol[sod$Nutrient == "yes"]))
    DO.T0 <- c(DO.T0.0, DO.T0.N)
    ## Calculation of mmols of oxygen in the bottles
    DOmmol.bot.T0 <- DO.T0 * sod$BODwatervol
    DOmmol.bot.TF <- DOmmol.TF * sod$BODwatervol
    ## Calculation of change in mmol DO during incubation
    dDO <- DOmmol.bot.T0 - DOmmol.bot.TF
    ## Normalize by sediment area --> convert to per m2
    mmolO2.m2 <- dDO / sod$A
    ## Convert times to POSIXlt standard
    t0 <- as.POSIXlt(time0)
    tF <- as.POSIXlt(timeF)
    ## Calculate the incubation hours
    incubation.h <- t0 - tF
    incubation.h <- as.numeric(incubation.h)
    ## Normalize by hours of incubation
    mmolO2.m2.h <- mmol.m2 / incubation.h
    ## Make data frame of relevant variables
    flux <- data.frame(sod$bod, sod$CPOM, sod$Nutrient, sod.temp, DO.mmol.T0, DO.mmol.TF, DO.T0, mmolO2.m2.h)
    names(flux) <- c("bod", "CPOM", "nutrient", "temp", "DOpre", "DOpost", "DO.T0", "SOD")

    ## Make Data Table
    write.table(flux, "./data/cpom_flux_sod_calc_DATE.csv", quote = F, row,names = F, sep = ",")
    
