# Calculation of sediment oxygen demand for the CPOM Flux Exp

## Date of Run 

17 June 2014

## Metadata

### Collected by:

KP 

### Created on:

20 June 2014

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of sediment oxygen demand from the winkler titration data from the CPOM Flux Experiment

## Variable Descriptions

### Data Frames

* sod = data frame with the raw winkler data (variable descriptions in "sod_data_metadata_DATE.md")

* std = data frame with the variables for the winkler standardization (variable descriptions in "winkler_standardization_DATE.md")

* repl = the data frame with the raw winkler data for the replacement water (variable descriptions in "repl_water_DO_DATE.md")

* vial = the data frame with the vial volumes

* sodT0 = the data frame the merges sod with vial to match the vial volumes with the specific samples at the T0 sampling

* sodTF = the data frame the merges sod with vial to match the vial volumes with the specific samples at the TF sampling

* repl = the data frame the merges repl with vial to match the vial volumes with the specific replacement water samples

* flux = the data frame of relevant objects from the calculations

    * DOpre = the [DO] in the BOD bottle before the replacement water is added (mmol/L)

    * DOpost = the [DO] in the BOD bottle at the conclusion of the incubation (mmol/L)

    * incubation.h = the duration of the incubation (h)

    * SOD = the sediment oxygen demand (mmol/m^2/h)

### R Objects

* DOvol.T0 = the [DO] in the overlying water at T0 (ml/L)

* DOvol.T0 = the [DO] in the overlying water at TF (ml/L)

* replDOvol0 = the [DO] in the replacement water without added nutrients (ml/L)

* replDOvolN = the [DO] in the replacement water with added nutrients (ml/L)

* R = the ideal gas constant [(L atm)/(mol K)]

* T = the incubation temperature (K)

* P = the incubation atmospheric pressure (atm)

* DOmmol.T0 = the [DO] of the T0 sample (mmol/L)

* DOmmol.TF = the [DO] of the TF sample (mmol/L)

* replDOmmol0 = the [DO] of the replacement water without added nutrients (mmol/L)

* replDOmmolN = the [DO] of the replacement water with added nutrients (mmol/L)

* DO.T0.0 = the [DO] of the BOD bottle once the replacement water was added to the bottle in the no-nutrient treatments (mmol/L)

* DO.T0.N = the [DO] of the BOD bottle once the replacement water was added to the bottle in the added nutrient treatments (mmol/L)

* DO.T0 = the [DO] of the BOD bottle once the replacement water was added to the bottles (mmol/L)

* DOmmol.bot.T0 = the mmol of DO in the overlying water in the BOD bottles at T0 (mmol)

* DOmmol.bot.TF = the mmol of DO in the overlying water in the BOD bottles at TF (mmol)

* dDO = the change in mmol DO in the bottle during the incubation (mmol)

* mmolO2.m2 = the change in mmol DO normalized to the area of the sediments in the bottle (mmol/m^2)

* t0 = the time the bottle was sealed at the beginning of the incubation (YYYY-MM-DD HH:MM)

* tF = the time the bottle was unsealed at the end of the incubation (YYYY-MM-DD HH:MM)

* incubation.h = the duration of the incbation (h)

* mmolO2.m2.h = the change in oxygen in the bottle during the incubation normalized to area and time (mmol/m^2/h)

## R Code

### Import Data

    sod <- read.delim("./data/cpom_flux_sod_17jun2014.csv", header = T, sep = ",")
    std <- read.delim("./data/winkler_standardization_17jun2014.csv", header = T,  sep = ",")
    repl <- read.delim("./data/repl_water_17jun2014.csv", header = T,  sep = ",")
    vial <- read.delim("./data/vial_volume_summer_2014.csv", header = T,  sep = ",")

###Calculations

    # DO Calculations
    ## Add vial vial volumes to the sod data.dframe for T1
    sodT0 <- merge(sod, vial, by.x = "vialT0", by.y = "vial")
    ## Calculation of [DO] of T0 samples
    DOvol.T0 <- (((sod$RmeasT0 - std$Rblk) * std$Vstd * std$Nstd * std$E) / ((std$Rstd - std$Rblk) * (sodT0$vol - std$Vreg))) - std$DOreg
    ## Add vial vial volumes to the sod data.dframe for T1
    sodTF <- merge(sod, vial, by.x = "vialTF", by.y = "vial")
    ## Calculation of [DO] of TF samples
    DOvol.TF <- (((sod$RmeasTF - std$Rblk) * std$Vstd * std$Nstd * std$E) / ((std$Rstd - std$Rblk) * (sodTF$vol - std$Vreg))) - std$DOreg
    ## Add vial vial volumes to the sod data.dframe for T1
    repl <- merge(repl, vial, by.x = "vial", by.y = "vial")
    ## Calculation of replacement water [DO] no nutrients
    replDOvol0 <- (((repl$Rmeas[repl$Nutrient == "no"] - std$Rblk) * std$Vstd * std$Nstd * std$E) / ((std$Rstd - std$Rblk) * (repl$vol[repl$Nutrient == "no"] - std$Vreg))) - std$DOreg
    ## Calculation of the replacement water [DO] nutrients
    replDOvolN <- (((repl$Rmeas[repl$Nutrient == "yes"] - std$Rblk) * std$Vstd * std$Nstd * std$E) / ((std$Rstd - std$Rblk) * (repl$vol[repl$Nutrient == "yes"] - std$Vreg))) - std$DOreg
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
    DO.T0.0 <- (DOmmol.T0[sod$Nutrient == "no"] * (1 - (sod$Replvol[sod$Nutrient == "no"] / sod$BODwatervol[sod$Nutrient == "no"]))) + (replDOmmol0[sod$Nutrient == "no"] * (sod$Replvol[sod$Nutrient == "no"] / sod$BODwatervol[sod$Nutrient == "no"]))
    DO.T0.N <- (DOmmol.T0[sod$Nutrient == "yes"] * (1 - (sod$Replvol[sod$Nutrient == "yes"] / sod$BODwatervol[sod$Nutrient == "yes"]))) + (replDOmmol0[sod$Nutrient == "yes"] * (sod$Replvol[sod$Nutrient == "yes"] / sod$BODwatervol[sod$Nutrient == "yes"]))
    DO.T0 <- c(DO.T0.0, DO.T0.N)
    ## Calculation of mmols of oxygen in the bottles
    DOmmol.bot.T0 <- DO.T0 * (sod$BODwatervol / 1000) # converting bottle volume from ml to L
    DOmmol.bot.TF <- DOmmol.TF * (sod$BODwatervol / 1000) # converting bottle volume from ml to L
    ## Calculation of change in mmol DO during incubation
    dDO <- DOmmol.bot.T0 - DOmmol.bot.TF
    ## Normalize by sediment area --> convert to per m2
    mmolO2.m2 <- dDO / sod$A
    ## Convert times to POSIXlt standard
    t0 <- as.POSIXlt(sod$time0)
    tF <- as.POSIXlt(sod$timeF)
    ## Calculate the incubation hours
    incubation.h <- tF - t0
    incubation.h <- as.numeric(incubation.h)
    ## Normalize by hours of incubation
    mmolO2.m2.h <- mmolO2.m2 / incubation.h
    ## Make data frame of relevant variables
    flux <- data.frame(sod$bod, sod$CPOM, sod$Nutrient, sod$temp, dDO, DOmmol.T0, DOmmol.TF, DO.T0, incubation.h, mmolO2.m2.h)
    names(flux) <- c("bod", "CPOM", "nutrient", "temp", "dDO", "DOpre", "DOpost", "DO.T0", "incubation.h", "SOD")

    ## Make Data Table
    write.table(flux, "./data/sod_calculation_17jun2014.csv", quote = F, row.names = F, sep = ",")
    
