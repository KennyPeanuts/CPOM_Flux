# Leached Litter Experiment SPRING INCUBATION Sediment Oxygen Demand Data

## 16 Feb 2016 

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the Spring 2016 Leached Litter Flux Experiment. Experiment setup notes can be found [leached_litter_Sp_Exp_SetUp](https://github.com/KennyPeanuts/CPOM_Flux/blob/master/lab_notebook/lab_notes/leached_litter_Sp_Exp_SetUp.md). Briefly, 150 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks that had been leached in DI water prior to being placed in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

File created on: 16 Feb 2016 

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

    bod <- c(5, 1, 6, 7, 2, 8, 4, 10, 9, 3)
    vialT0 <- 1:10
    vialTF <- 15:24
    temp <- rep(22.0, 10)
    pressure <- rep(30.24, 10) 
    time0 <- c("2016-02-11 09:30", "2016-02-11 09:36", "2016-02-11 09:40", "2016-02-11 09:45", "2016-02-11 09:50", "2016-02-11 09:55", "2016-02-11 09:58", "2016-02-11 10:03", "2016-02-11 10:09", "2016-02-11 10:13")
    BeginBuretT0 <- c(0.00, 0.80, 1.60, 2.50, 3.30, 4.10, 5.10, 6.00, 6.85, 7.65)
    EndBuretT0 <- c(0.80, 1.60, 2.50, 3.30, 4.10, 5.10, 6.00, 6.80, 7.65, 8.45)
    timeF <- c("2016-02-11 19:55", "2016-02-11 20:00", "2016-02-11 20:04", "2016-02-11 20:06", "2016-02-11 20:10", "2016-02-11 20:13", "2016-02-11 20:15", "2016-02-11 20:18", "2016-02-11 20:10", "2016-02-11 20:24")  
    BeginBuretTF <- c(3.35, 4.05, 4.75, 5.375, 6.00, 6.65, 7.275, 7.90, 8.575, 9.15)
    EndBuretTF <- c(4.00, 4.70, 5.375, 6.00, 6.65, 7.275, 7.90, 8.575, 9.15, 9.725)
    A <- rep(0.0028, 10)
    Replvol <- c(55, 53, 54, 46, 53, 53, 54, 53, 55, 54)
    RmeasT0 <- EndBuretT0 - BeginBuretT0    
    RmeasTF <- EndBuretTF - BeginBuretTF
    # create data.frame
    sod <- data.frame(bod, vialT0, vialTF, temp, pressure, A, time0, timeF, RmeasT0, RmeasTF, Replvol)

## Output File 

    write.table(sod, "data/leached_litter_SP_sod_11feb2016.csv", sep = ",", row.names = F, quote = F) 
