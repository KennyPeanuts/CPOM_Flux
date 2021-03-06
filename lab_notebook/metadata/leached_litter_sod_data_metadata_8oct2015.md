# Leached Litter Experiment Sediment Oxygen Demand Data

## 08 Oct 2015

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the Leached Litter Flux Experiment. Experiment setup notes can be found [Leached_Litter_Set-up](githuburl). Briefly, 100 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks that had been leached in DI water prior to being placed in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

File created on:  15 Oct 2015

Modified:

### Variables:

* bod = the identifying number of the BOD bottle
* vialT0 = the identifying number of the 10 ml vial initially used to collect water (before replacement water was added and the bod bottle sealed)
* vialTF = the identifying number of the 10 ml vial used to collect water at time T1 (after unsealing the bod bottle)
* temp = the incubation temperature (in degrees Celcius)
* pressure = the atmospheric pressure (in Hg)
* time0 = the time that replacement water was added and the bod bottle was sealed (y-m-d H:M)
* BeginBuretT0 = the buret reading prior to the titration at time 0, which is the time that the sample was collected from the BOD bottle prior to the replacement water being added. (ml)
* EndBuretT0 = the buret reading after the titration was complete on the time 0 sample. (ml)
* timeF = the time that the BOD bottle was sampled after the incubation (y-m-d H:M) -Sample collected after the replacement water was added and the bod bottle sealed
* BeginBuretTF = the buret reading prior to the titration of the TF sample (ml)
* EndBuretTF = the buret reading after the titration of the TF sample (ml)
* A = the area of the sediments in the BOD bottle (m2)
* Replvol = the volume of water added back in to the BOD bottle before it is sealed (L)

### Calculated Variables:

* RmeasT0 = the difference between EndBuretT0 and BeginBuretT0, which is the sample titration buret reading at "time 0" (ml) - This "time 0" refers to the sample that was collected from the bod bottle prior to replacement water being added
* RmeasTF = the difference between EndBuretTF and BeginBuretTF, which is the sample titration buret reading at time F (ml)

## R Code

    bod <- c(7, 2, 4, 9, 3, 12, 11, 8, 5, 6, 10, 1) 
    vialT0 <- c(1, 40, 27, 11, 18, 38, 28, 14, 4, 34, 29, 8)
    vialTF <- c(4, 40, 29, 34, 11, 38, 8, 27, 18, 1, 28, 14)
    temp <- rep(24.0, 12)
    # pressure was not recorded at the time of the sampling, so it was retrieved from the Wunderground climate archive
    pressure <- rep(30, 12) 
    time0 <- c("2015-10-08 09:27", "2015-10-08 09:31", "2015-10-08 09:36", "2015-10-08 09:41", "2015-10-08 09:45", "2015-10-08 09:49", "2015-10-08 09:54", "2015-10-08 09:57", "2015-10-08 10:01", "2015-10-08 10:05", "2015-10-08 10:11", "2015-10-08 10:15")  
    BeginBuretT0 <- c(1.80, 2.45, 3.15, 3.90, 4.60, 5.325, 6.00, 6.65, 7.2525, 7.85, 8.5, 9.125)
    EndBuretT0 <- c(2.45, 3.15, 3.90, 4.60, 5.325, 6.00, 6.65, 7.2525, 7.85, 8.5, 9.125, 9.85)
    timeF <- c("2015-10-08 16:12", "2015-10-08 16:16", "2015-10-08 16:20", "2015-10-08 16:22", "2015-10-08 16:24", "2015-10-08 16:26", "2015-10-08 16:28", "2015-10-08 16:30", "2015-10-08 16:32", "2015-10-08 16:34", "2015-10-08 16:36", "2015-10-08 16:38")  
    BeginBuretTF <- c(1.65, 2.40, 2.90, 3.65, 3.95, 5.10, 5.80, 6.70, 7.50, 8.05, 8.60, 9.30)
    EndBuretTF <- c(2.40, 2.90, 3.65, 3.95, 5.10, 5.80, 6.70, 7.50, 8.05, 8.60, 9.30, 9.95)
    A <- rep(0.0028, 12)
    Replvol <- c(36.0, 36.0, 38.0, 40.0, 36.0, 35.0, 35.0, 36.0, 42.0, 37.0, 36.0, 38.0)
    RmeasT0 <- EndBuretT0 - BeginBuretT0    
    RmeasTF <- EndBuretTF - BeginBuretTF
    # create data.frame
    sod <- data.frame(bod, vialT0, vialTF, temp, pressure, A, time0, timeF, RmeasT0, RmeasTF, Replvol)

## Output File 

    write.table(sod, "data/leached_litter_sod_08oct2015.csv", sep = ",", row.names = F, quote = F) 
