# Leached Litter Experiment SPRING INCUBATION Sediment Oxygen Demand Data

## 18 Feb 2016 

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: 

These data were collected to measure sediment oxygen demand in the Spring 2016 Leached Litter Flux Experiment. Experiment setup notes can be found [leached_litter_Sp_Exp_SetUp](https://github.com/KennyPeanuts/CPOM_Flux/blob/master/lab_notebook/lab_notes/leached_litter_Sp_Exp_SetUp.md). Briefly, 150 ml of sediments from Lancer Park Pond were incubated with or without 20 tulip poplar leaf disks that had been leached in DI water prior to being placed in 300 ml BOD bottles. To measure SOD, the DO concentration was measured at T0 and then the bottles were sealed without air and the DO concentration was measured at TF.  DO was measured using Winkler Titrations.

File created on: 19 Feb 2016 

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

    bod <- c(1, 6, 7, 5, 2, 8, 4, 10, 3, 9)
    vialT0 <- 1:10
    vialTF <- 15:24
    temp <- rep(21.0, 10)
    pressure <- rep(30.49, 10) 
    time0 <- c("2016-02-18 09:45", "2016-02-18 09:50", "2016-02-18 09:54", "2016-02-18 09:56", "2016-02-18 10:00", "2016-02-18 10:05", "2016-02-18 10:09", "2016-02-18 10:12", "2016-02-18 10:17", "2016-02-18 10:21")
    BeginBuretT0 <- c(1.455, 2.25, 3.05, 3.90, 4.80, 5.60, 6.40, 7.20, 8.005, 0.00)
    EndBuretT0 <- c(2.25, 3.05, 3.90, 4.80, 5.60, 6.40, 7.20, 8.005, 8.80, 0.805)
    timeF <- c("2016-02-18 19:47", "2016-02-18 19:50", "2016-02-18 19:52", "2016-02-18 19:55", "2016-02-18 19:57", "2016-02-18 20:00", "2016-02-18 20:02", "2016-02-18 20:05", "2016-02-18 20:07", "2016-02-18 20:09")  
    BeginBuretTF <- c(5.05, 5.60, 6.30, 6.90, 7.60, 8.15, 8.75, 4.50, 5.20, 5.80)
    EndBuretTF <- c(5.60, 6.30, 6.90, 7.60, 8.15, 8.75, 9.35, 5.20, 5.80, 6.50)
    A <- rep(0.0028, 10)
    Replvol <- c(55, 53, 54, 46, 53, 53, 54, 53, 55, 54)
    RmeasT0 <- EndBuretT0 - BeginBuretT0    
    RmeasTF <- EndBuretTF - BeginBuretTF
    # create data.frame
    sod <- data.frame(bod, vialT0, vialTF, temp, pressure, A, time0, timeF, RmeasT0, RmeasTF, Replvol)

## Output File 

    write.table(sod, "data/leached_litter_SP_sod_18feb2016.csv", sep = ",", row.names = F, quote = F) 
