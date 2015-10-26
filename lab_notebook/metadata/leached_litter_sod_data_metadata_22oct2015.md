# Leached Litter Experiment Sediment Oxygen Demand Data

## 22 Oct 2015

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the Leached Litter Flux Experiment. Experiment setup notes can be found [Leached_Litter_Set-up](githuburl). Briefly, 100 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks that had been leached in DI water prior to being placed in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

File created on:  26 Oct 2015

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

    bod <- c(3, 4, 7, 12, 9, 2, 8, 6, 11, 1, 5, 10) 
    vialT0 <- c(4, 10, 19, 28, 1, 34, 3, 24, 18, 21, 14, 23)
    vialTF <- c(36, 30, 39, 37, 15, 12, 25, 26, 9, 33, 13, 5)
    temp <- rep(23.5, 12)
    pressure <- rep(30.29, 12) 
    time0 <- c("2015-10-22 09:36", "2015-10-22 09:42", "2015-10-22 09:46", "2015-10-22 09:55", "2015-10-22 09:58", "2015-10-22 10:00", "2015-10-22 10:07", "2015-10-22 10:12", "2015-10-22 10:15", "2015-10-22 10:20", "2015-10-22 10:25", "2015-10-22 10:31")  
    BeginBuretT0 <- c(1.55, 2.425, 3.20, NA, 4.45, 5.15, 5.90, 6.60, 7.30, 8.00, 8.75, 5.75)
    EndBuretT0 <- c(2.425, 3.20, NA, NA, 5.15, 5.90, 6.60, 7.30, 8.00, 8.75, 9.375, 6.45)
    timeF <- c("2015-10-22 19:12", "2015-10-22 19:15", "2015-10-22 19:17", "2015-10-22 19:20", "2015-10-22 19:22", "2015-10-22 19:23", "2015-10-22 19:25", "2015-10-22 19:27", "2015-10-22 19:28", "2015-10-22 19:30", "2015-10-22 19:32", "2015-10-22 19:36")  
    BeginBuretTF <- c(1.55, 2.25, 3.15, 3.95, 4.60, 5.30, 6.20, 7.20, 7.80, 8.65, 7.00, 7.75)
    EndBuretTF <- c(2.25, 3.15, 3.95, 4.60, 5.30, 6.20, 7.20, 7.80, 8.65, 7.00, 7.75, 8.15)
    A <- rep(0.0028, 12)
    Replvol <- c(63, 60, 60, 60, 55, 62, 55, 60, 60, 60, 56, 60) # relpacement volume for BOD bottle 10 was not recorded in the notebook, so I used the modal value
    RmeasT0 <- EndBuretT0 - BeginBuretT0    
    RmeasTF <- EndBuretTF - BeginBuretTF
    # create data.frame
    sod <- data.frame(bod, vialT0, vialTF, temp, pressure, A, time0, timeF, RmeasT0, RmeasTF, Replvol)

## Output File 

    write.table(sod, "data/leached_litter_sod_22oct2015.csv", sep = ",", row.names = F, quote = F) 
