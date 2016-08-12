# Leached Litter Experiment Sediment Oxygen Demand Data

## 24 Sept 2015

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the Leached Litter Flux Experiment. Experiment setup notes can be found [Leached_Litter_Set-up](githuburl). Briefly, 100 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks that had been leached in DI water prior to being placed in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

File created on:  12 Oct 2015

Modified:

* 12 Aug 2016 - KF - completed data entry begun on 12 Oct 2015!!! because I am a hot mess!

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

    bod <- c(11, 6, 8, 3, 7, 2, 9, 5, 10, 4, 12, 1) 
    vialT0 <- c(37, 6, 7, 20, 36, 15, 21, 10, 18, 39, 40, 12)
    vialTF <- c(19, 29, 26, 33, 32, 3, 24, 31, 2, 4, 11, 13)
    temp <- rep(24.5, 12)
    # pressure was not recorded at the time of the sampling, so it was retrieved from the Wunderground climate archive
    pressure <- rep(767, 12) 
    time0 <- c("2015-09-24 09:22", "2015-09-24 09:24", "2015-09-24 09:40", "2015-09-24 09:44", "2015-09-24 09:52", "2015-09-24 09:59", "2015-09-24 10:02", "2015-09-24 10:11", "2015-09-24 10:20", "2015-09-24 10:25", "2015-09-24 10:32", "2015-09-24 10:38")  
    BeginBuretT0 <- c(1.40, 2.10, 2.80, 3.45, 4.15, 4.80, 5.45, 6.10, 6.75, 7.35, 8.05, 8.75)
    EndBuretT0 <- c(2.10, 2.80, 3.45, 4.15, 4.80, 5.45, 6.10, 6.75, 7.35, 8.05, 8.75, 9.45)
    timeF <- c("2015-09-22 16:15", "2015-09-22 16:17", "2015-09-22 16:19", "2015-09-22 16:20", "2015-09-22 16:24", "2015-09-22 16:26", "2015-09-22 16:28", "2015-09-22 16:29", "2015-09-22 16:32", "2015-09-22 16:33", "2015-09-22 16:35", "2015-09-22 16:38")  
    BeginBuretTF <- c(1.50, 2.20, 3.00, 3.60, 4.40, 5.15, 6.025, 6.25, 7.625, 8.35, 6.50, 7.20)
    EndBuretTF <- c(2.20, 3.00, 3.60, 4.40, 5.15, 6.025, 6.25, 7.625, 8.35, 9.10, 7.20, 8.05)
    A <- rep(0.0028, 12)
    Replvol <- c(39, 54, 36, 37, 37, 36, 35, 37, 36, 37, 37, 37)
    RmeasT0 <- EndBuretT0 - BeginBuretT0    
    RmeasTF <- EndBuretTF - BeginBuretTF
    # create data.frame
    sod <- data.frame(bod, vialT0, vialTF, temp, pressure, A, time0, timeF, RmeasT0, RmeasTF, Replvol)

## Output File 

    write.table(sod, "data/leached_litter_sod_24sept2015.csv", sep = ",", row.names = F, quote = F) 
