# Leached Litter Experiment Sediment Oxygen Demand Data

## 01 Oct 2015

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the Leached Litter Flux Experiment. Experiment setup notes can be found [Leached_Litter_Set-up](githuburl). Briefly, 100 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks that had been leached in DI water prior to being placed in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

File created on:  15 Oct 2015

Modified:

* 15 Oct 2015 - KF - corrected the pressure value - I originally entered as mm HG but should be in Hg

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

    bod <- c(9, 4, 5, 12, 3, 11, 2, 8, 6, 7, 10, 1) 
    vialT0 <- c(4, 13, 33, 22, 40, 15, 39, 7, 29, 12, 26, 36)
    vialTF <- c(25, 01, 16, 23, 5, 8, 34, 27, 30, 8, 9, 32)
    temp <- rep(25.0, 12)
    # pressure was not recorded at the time of the sampling, so I used what looks like about the average 
    pressure <- rep(30, 12) 
    time0 <- c("2015-10-01 09:29", "2015-10-01 09:33", "2015-10-01 09:42", "2015-10-01 09:45", "2015-10-01 09:52", "2015-10-01 09:58", "2015-10-01 10:05", "2015-10-01 10:10", "2015-10-01 10:18", "2015-10-01 10:22", "2015-10-01 10:28", "2015-10-01 10:30")  
    BeginBuretT0 <- c(2.00, 2.90, 3.70, 4.60, 5.50, 6.25, 7.05, 8.00, 8.75, 0.00, 0.65, 1.70)
    EndBuretT0 <- c(2.90, 3.70, 4.60, 5.50, 6.25, 7.05, 8.00, 8.75, 9.50, 0.65, 1.70, 2.60)
    timeF <- c("2015-10-01 16:07", "2015-10-01 16:10", "2015-10-01 16:12", "2015-10-01 16:14", "2015-10-01 16:17", "2015-10-01 16:19", "2015-10-01 16:22", "2015-10-01 16:24", "2015-10-01 16:27", "2015-10-01 16:29", "2015-10-01 16:31", "2015-10-01 16:33")  
    BeginBuretTF <- c(0.00, 0.60, 1.45, 1.90, 2.80, 3.45, 4.00, 4.65, 5.25, 5.85, 6.50, 7.00)
    EndBuretTF <- c(0.60, 1.45, 1.90, 2.80, 3.45, 4.00, 4.65, 5.25, 5.80, 6.50, 7.00, 7.85)
    A <- rep(0.0028, 12)
    Replvol <- c(54.5, 55.0, 55.0, 55.5, 54.5, 54.0, 59.0, 53.5, 54.5, 54.0, 53.5, 54.0)
    RmeasT0 <- EndBuretT0 - BeginBuretT0    
    RmeasTF <- EndBuretTF - BeginBuretTF
    # create data.frame
    sod <- data.frame(bod, vialT0, vialTF, temp, pressure, A, time0, timeF, RmeasT0, RmeasTF, Replvol)

## Output File 

    write.table(sod, "data/leached_litter_sod_1oct2015.csv", sep = ",", row.names = F, quote = F) 
