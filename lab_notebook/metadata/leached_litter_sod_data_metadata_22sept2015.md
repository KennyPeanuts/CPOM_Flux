# Leached Litter Experiment Sediment Oxygen Demand Data

## 22 Sept 2015

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the Leached Litter Flux Experiment. Experiment setup notes can be found [Leached_Litter_Set-up](githuburl). Briefly, 100 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks that had been leached in DI water prior to being placed in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

File created on:  12 Oct 2015

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

    bod <- c(7, 10, 5, 9, 2, 6, 1, 12, 8, 3, 11, 4)
    vialT0 <- c(3, 39, 26, 40, 2, 32, 21, 13, 7, 4, 10, 11)
    vialTF <- c(19, 33, 18, 12, 22, 24, 15, 31, 20, 37, 6, 36)
    temp <- rep(25.5, 12)
    # pressure was not recorded at the time of the sampling, so it was retrieved from the Wunderground climate archive
    pressure <- rep(767, 12) 
    # only the beginnig and end time were recorded for this run, so the times were calcuated by divding the difference by the number of samples and assuming all the samples took approximately the same time. We didn't take breaks, so this is going to be pretty close.
    time0 <- c("2015-09-22 12:42", "2015-09-22 12:47", "2015-09-22 12:53", "2015-09-22 12:58", "2015-09-22 13:04", "2015-09-22 13:09", "2015-09-22 13:15", "2015-09-22 13:20", "2015-09-22 13:26", "2015-09-22 13:31", "2015-09-22 13:37", "2015-09-22 13:47")  
    BeginBuretT0 <- c(2.20, 2.75, 3.4, 4.0, 5.255, 4.7, 6.00, 6.75, 7.35, 8.00, 8.75, 7.00)
    EndBuretT0 <- c(2.75, 3.4, 4.0, 4.7, 6.00, 5.255, 6.75, 7.35, 8.00, 8.75, 9.35, 7.755)
    timeF <- c("2015-09-22 19:45", "2015-09-22 19:47", "2015-09-22 19:44", "2015-09-22 19:42", "2015-09-22 19:40", "2015-09-22 19:35", "2015-09-22 20:01", "2015-09-22 19:59", "2015-09-22 19:54", "2015-09-22 19:57", "2015-09-22 19:52", "2015-09-22 19:49")  
    BeginBuretTF <- c(4.70, 5.30, 4.025, 3.30, 2.40, 1.65, 7.25, 6.50, 7.625, 8.30, 6.70, 5.90)
    EndBuretTF <- c(5.30, 5.90, 4.70, 4.025, 3.30, 2.40, 8.15, 7.25, 8.30, 9.20, 7.625, 6.70)
    A <- rep(0.0028, 12)
    Replvol <- c(35, 37, 35, 37, 36, 35, 35, 35, 35, 36, 36, 37)
    RmeasT0 <- EndBuretT0 - BeginBuretT0    
    RmeasTF <- EndBuretTF - BeginBuretTF
    # create data.frame
    sod <- data.frame(bod, vialT0, vialTF, temp, pressure, A, time0, timeF, RmeasT0, RmeasTF, Replvol)

## Output File 

    write.table(sod, "data/leached_litter_sod_22sept2015.csv", sep = ",", row.names = F, quote = F) 
