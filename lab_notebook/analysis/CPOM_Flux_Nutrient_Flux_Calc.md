# Calculation of the Areal Nutrient Flux from the CPOM Flux Exp.
## Summer 2014
## Metadata
* Code created: 20 Jan 2014
* Author: KF

* Modified: 3 Feb 2015 - KF - add code to calculate flux
* Modified: 4 Feb 2015 - KF - added code to calculate flux for 17 June Sampling
* Modified: 10 Feb 2015 - KF - added code to calculate flux for 24 June Sampling
* Modified: 25 Feb 2015 - KF - normalized flux by time elapsed
* Modified: 26 Feb 2015 - KF - converted flux to areal flux; create data file of flux calculations
* Modified 3 March 2015 - KF - corrected BOD volume for areal flux calcualtions
* Modified 10 March 2015 - KF - removed exploratory plots


## Purpose
These data were collected from the CPOM Flux Exp. to assess the effect of CPOM on the flux of nutrients across the sediment water interface.

## Import data

    nut <- read.table("./data/CPOM_Flux_Nutrients.csv", header = T, sep = ",")

## Flux Calculations

To calculate the flux:

1) determine the initial nutrient concentration of the bottle at the time period by calculating the dilution due to the replacement water.

* positive numbers = an increase in water nutrient concentratio = a flux from the sediments

### R Code

#### Ambient Nutrient Treatments

#### 12 June

Calculation of the sediment nutrient flux in the unenriched samples from initiation to 12 June.  Since we do not have the nutrient data from 10 June, I am using the replacement water values as initial value.
     
     
     NOx.flux.12Jun.C <-  nut$NOx[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"] - nut$NOx[nut$BOD == "RW0" & nut$DATE == "10-Jun"] 
     NH3.flux.12Jun.C <-  nut$NH3[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"] - nut$NH3[nut$BOD == "RW0" & nut$DATE == "10-Jun"]
     P.flux.12Jun.C <-  nut$P[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"] - nut$P[nut$BOD == "RW0" & nut$DATE == "10-Jun"]
     CPOM.0 <- nut$CPOM[nut$BOD != "RW0" & nut$DATE == "12-Jun" & nut$NUTS == "0"]
     flux.12Jun.C <- data.frame(CPOM.0, NOx.flux.12Jun.C, NH3.flux.12Jun.C, P.flux.12Jun.C )
     names(flux.12Jun.C) <- c("CPOM", "NOx", "NH3", "P")
     
##### Output

~~~~

> flux.12Jun.C
  CPOM    NOx    NH3      P
1    C  0.034  0.009  0.001
2    0  5.381 -0.064  0.022
3    0  5.757  0.168  0.014
4    C  0.110  0.091  0.024
5    0  1.541 -0.063  0.026
6    0  6.857 -0.054 -0.004
7    C  0.067 -0.036  0.008
8    C -0.033 -0.029  0.016

~~~~


#### 17 June

To calculate the flux for 17 June we need to calculate the initial nutrient concentrations due to the dilution of the overlying water with the replacement water.  At the conclusion of the sampling of the previous date a volume of water was removed from each of the bottles for sampling and this was then readded via the replacement water before the jar was put back into incubation.

So the inital nutrient concentration for 17 June is the concentration on 12 June diluted with the 12 June replacement water.

##### Import data with replacement water volumes

    sod.12Jun <- read.table("./data/cpom_flux_sod_12jun2014.csv", header = T, sep = ",")

##### Merge replacement volume data with Nutrient data
 
    repl.vol <- sod.12Jun[, c(1, 13, 14)] # selects only the BOD number and the repl vol from the file
    names(repl.vol) <- c("BOD", "Replvol", "BODwatervol")
    nut.12Jun <- merge(nut[nut$DATE == "12-Jun", ], repl.vol, by = "BOD")

##### Calculate the initial nutrient concentration as a weighted average of the volumes

    prop.repl <- nut.12Jun$Replvol / nut.12Jun$BODwatervol
    init.NOx.17Jun.C <- (nut.12Jun$NOx[nut.12Jun$NUTS == "0"] * (1 - prop.repl[nut.12Jun$NUTS == "0"])) + (nut$NOx[nut$BOD == "RW0" & nut$DATE == "12-Jun"] * prop.repl[nut.12Jun$NUTS == "0"])
    init.NH3.17Jun.C <- (nut.12Jun$NH3[nut.12Jun$NUTS == "0"] * (1 - prop.repl[nut.12Jun$NUTS == "0"])) + (nut$NH3[nut$BOD == "RW0" & nut$DATE == "12-Jun"] * prop.repl[nut.12Jun$NUTS == "0"])
    init.P.17Jun.C <- (nut.12Jun$P[nut.12Jun$NUTS == "0"] * (1 - prop.repl[nut.12Jun$NUTS == "0"])) + (nut$P[nut$BOD == "RW0" & nut$DATE == "12-Jun"] * prop.repl[nut.12Jun$NUTS == "0"])

##### Calculate the Flux as the change in Concentration

    flux.NOx.17Jun.C <- nut$NOx[nut$BOD != "RW0" & nut$DATE == "17-Jun" & nut$NUTS == "0"] - init.NOx.17Jun.C
    flux.NH3.17Jun.C <- nut$NH3[nut$BOD != "RW0" & nut$DATE == "17-Jun" & nut$NUTS == "0"] - init.NH3.17Jun.C
    flux.P.17Jun.C <- nut$P[nut$BOD != "RW0" & nut$DATE == "17-Jun" & nut$NUTS == "0"] - init.P.17Jun.C
    CPOM.C <- nut$CPOM[nut$BOD != "RW0" & nut$DATE == "17-Jun" & nut$NUTS == "0"]
    flux.17Jun.C <- data.frame(CPOM.C, flux.NOx.17Jun.C, flux.NH3.17Jun.C, flux.P.17Jun.C)
    names(flux.17Jun.C) <- c("CPOM", "NOx", "NH3", "P")

##### Output

~~~~
  
  > flux.17Jun.C
CPOM       NOx       NH3        P
1    C  3.540770 -0.113045 0.025455
2    0  0.253465 -0.102720 0.018360
3    0  0.345965 -0.108815 0.011680
4    C -0.329225 -0.092340 0.003170
5    0 -3.077185 -0.231060 0.009850
6    0  0.254310 -0.191015 0.014000
7    C -0.042825 -0.088925 0.003830
8    C -1.943735 -0.084890 0.019780
> 
  
~~~~
  
#### 24 June
  
  To calculate the flux for 24 June we need to calculate the initial nutrient concentrations due to the dilution of the overlying water with the replacement water.  At the conclusion of the sampling of the previous date a volume of water was removed from each of the bottles for sampling and this was then readded via the replacement water before the jar was put back into incubation.

So the inital nutrient concentration for 24 June is the concentration on 17 June diluted with the 17 June replacement water.

##### Import data with replacement water volumes

    sod.17Jun <- read.table("./data/cpom_flux_sod_17jun2014.csv", header = T, sep = ",")

##### Merge replacement volume data with Nutrient data

    repl.vol <- sod.17Jun[, c(1, 13, 14)] # selects only the BOD number and the repl vol from the file
    names(repl.vol) <- c("BOD", "Replvol", "BODwatervol")
    nut.17Jun <- merge(nut[nut$DATE == "17-Jun", ], repl.vol, by = "BOD")

##### Calculate the initial nutrient concentration as a weighted average of the volumes

     prop.repl <- nut.17Jun$Replvol / nut.17Jun$BODwatervol
     init.NOx.24Jun.C <- (nut.17Jun$NOx[nut.17Jun$NUTS == "0"] * (1 - prop.repl[nut.17Jun$NUTS == "0"])) + (nut$NOx[nut$BOD == "RW0" & nut$DATE == "17-Jun"] * prop.repl[nut.17Jun$NUTS == "0"])
     init.NH3.24Jun.C <- (nut.17Jun$NH3[nut.17Jun$NUTS == "0"] * (1 - prop.repl[nut.17Jun$NUTS == "0"])) + (nut$NH3[nut$BOD == "RW0" & nut$DATE == "17-Jun"] * prop.repl[nut.17Jun$NUTS == "0"])
     init.P.24Jun.C <- (nut.17Jun$P[nut.17Jun$NUTS == "0"] * (1 - prop.repl[nut.17Jun$NUTS == "0"])) + (nut$P[nut$BOD == "RW0" & nut$DATE == "17-Jun"] * prop.repl[nut.17Jun$NUTS == "0"])

##### Calculate the Flux as the change in Concentration

     flux.NOx.24Jun.C <- nut$NOx[nut$BOD != "RW0" & nut$DATE == "24-Jun" & nut$NUTS == "0"] - init.NOx.24Jun.C
     flux.NH3.24Jun.C <- nut$NH3[nut$BOD != "RW0" & nut$DATE == "24-Jun" & nut$NUTS == "0"] - init.NH3.24Jun.C
     flux.P.24Jun.C <- nut$P[nut$BOD != "RW0" & nut$DATE == "24-Jun" & nut$NUTS == "0"] - init.P.24Jun.C
     CPOM.C <- nut$CPOM[nut$BOD != "RW0" & nut$DATE == "24-Jun" & nut$NUTS == "0"]
     flux.24Jun.C <- data.frame(CPOM.C, flux.NOx.24Jun.C, flux.NH3.24Jun.C, flux.P.24Jun.C)
     names(flux.24Jun.C) <- c("CPOM", "NOx", "NH3", "P")

##### Output

~~~~
  
> flux.24Jun.C
  CPOM      NOx       NH3         P
1    C -1.89924 -0.098020 -0.007530
2    0 -0.31557 -0.073490  0.005565
3    0 -1.19749 -0.078490  0.006320
4    C  0.04254 -0.037660  0.000225
5    0  0.00265  0.245510  0.045395
6    0 -1.43417  0.001850  0.009320
7    C -0.03329 -0.082395 -0.008850
8    C  0.04553 -0.036270  0.012300

~~~~

#### 1 July
  
  To calculate the flux for 1 Jul we need to calculate the initial nutrient concentrations due to the dilution of the overlying water with the replacement water.  At the conclusion of the sampling of the previous date a volume of water was removed from each of the bottles for sampling and this was then readded via the replacement water before the jar was put back into incubation.

So the inital nutrient concentration for 1 July is the concentration on 24 June diluted with the 24 June replacement water.

##### Import data with replacement water volumes

    sod.24Jun <- read.table("./data/cpom_flux_sod_24jun2014.csv", header = T, sep = ",")

##### Merge replacement volume data with Nutrient data

    repl.vol <- sod.24Jun[, c(1, 13, 14)] # selects only the BOD number and the repl vol from the file
    names(repl.vol) <- c("BOD", "Replvol", "BODwatervol")
    nut.24Jun <- merge(nut[nut$DATE == "24-Jun", ], repl.vol, by = "BOD")

##### Calculate the initial nutrient concentration as a weighted average of the volumes

    prop.repl <- nut.24Jun$Replvol / nut.24Jun$BODwatervol
    init.NOx.1Jul.C <- (nut.24Jun$NOx[nut.24Jun$NUTS == 0] * (1 - prop.repl[nut.24Jun$NUTS == "0"])) + (nut$NOx[nut$BOD == "RW0" & nut$DATE == "24-Jun"] * prop.repl[nut.24Jun$NUTS == "0"])
    init.NH3.1Jul.C <- (nut.24Jun$NH3[nut.24Jun$NUTS == 0] * (1 - prop.repl[nut.24Jun$NUTS == "0"])) + (nut$NH3[nut$BOD == "RW0" & nut$DATE == "24-Jun"] * prop.repl[nut.24Jun$NUTS == "0"])
    init.P.1Jul.C <- (nut.24Jun$P[nut.24Jun$NUTS == 0] * (1 - prop.repl[nut.24Jun$NUTS == "0"])) + (nut$P[nut$BOD == "RW0" & nut$DATE == "24-Jun"] * prop.repl[nut.24Jun$NUTS == "0"])

##### Calculate the Flux as the change in Concentration

    flux.NOx.1Jul.C <- nut$NOx[nut$BOD != "RW0" & nut$DATE == "1-Jul" & nut$NUTS == "0"] - init.NOx.1Jul.C
    flux.NH3.1Jul.C <- nut$NH3[nut$BOD != "RW0" & nut$DATE == "1-Jul" & nut$NUTS == "0"] - init.NH3.1Jul.C
    flux.P.1Jul.C <- nut$P[nut$BOD != "RW0" & nut$DATE == "1-Jul" & nut$NUTS == "0"] - init.P.1Jul.C
    CPOM.C <- nut$CPOM[nut$BOD != "RW0" & nut$DATE == "1-Jul" & nut$NUTS == "0"]
    flux.1Jul.C <- data.frame(CPOM.C, flux.NOx.1Jul.C, flux.NH3.1Jul.C, flux.P.1Jul.C)
    names(flux.1Jul.C) <- c("CPOM", "NOx", "NH3", "P")

##### Output

~~~~

> flux.1Jul.C
  CPOM       NOx       NH3         P
1    C -1.130255  0.005605  0.009980
2    0 -1.139760  0.143020  0.052490
3    0 -1.152785  0.106995  0.046865
4    C -1.146010 -0.020585  0.011715
5    0 -0.945420  0.003740 -0.013700
6    0 -1.183805 -0.035230  0.009470
7    C -1.166105 -0.107200 -0.025270
8    C -1.187390 -0.064290 -0.014455

~~~~

### Nutrient Enriched Treatments

#### 12 June

Calculation of the sediment nutrient flux in the enriched samples from initiation to 12 June.  Since we do not have the nutrient data from 10 June, I am using the replacement water values as initial value.
     
     
     NOx.flux.12Jun.N <-  nut$NOx[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"] - nut$NOx[nut$BOD == "RWN" & nut$DATE == "10-Jun"]  
     NH3.flux.12Jun.N <-  nut$NH3[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"] - nut$NH3[nut$BOD == "RWN" & nut$DATE == "10-Jun"]
     P.flux.12Jun.N <-  nut$P[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"] - nut$P[nut$BOD == "RWN" & nut$DATE == "10-Jun"]
     CPOM.N <- nut$CPOM[nut$BOD != "RWN" & nut$DATE == "12-Jun" & nut$NUTS == "N"]
     flux.12Jun.N <- data.frame(CPOM.N, NOx.flux.12Jun.N, NH3.flux.12Jun.N, P.flux.12Jun.N )
     names(flux.12Jun.N) <- c("CPOM", "NOx", "NH3", "P")
     
##### Output

~~~~

> flux.12Jun.N
  CPOM    NOx    NH3     P
1    0  6.902 -0.155 0.019
2    C  0.000 -0.043 0.002
3    0  1.428 -0.174 0.024
4    C -0.025 -0.122 0.007
5    C  0.098  0.003 0.014
6    0  6.854 -0.166 0.012
7    0  1.735 -0.171 0.030
8    C -0.090  0.283 0.061
> 

~~~~

#### 17 June

To calculate the flux for the enriched samples on 17 June we need to calculate the initial nutrient concentrations due to the dilution of the overlying water with the replacement water.  At the conclusion of the sampling of the previous date a volume of water was removed from each of the bottles for sampling and this was then readded via the replacement water before the jar was put back into incubation.

So the inital nutrient concentration for 17 June is the concentration on 12 June diluted with the 12 June replacement water.

##### Import data with replacement water volumes

    sod.12Jun <- read.table("./data/cpom_flux_sod_12jun2014.csv", header = T, sep = ",")

##### Merge replacement volume data with Nutrient data
 
    repl.vol <- sod.12Jun[, c(1, 13, 14)] # selects only the BOD number and the repl vol from the file
    names(repl.vol) <- c("BOD", "Replvol", "BODwatervol")
    nut.12Jun <- merge(nut[nut$DATE == "12-Jun", ], repl.vol, by = "BOD")

##### Calculate the initial nutrient concentration as a weighted average of the volumes

    prop.repl <- nut.12Jun$Replvol / nut.12Jun$BODwatervol
    init.NOx.17Jun.N <- (nut.12Jun$NOx[nut.12Jun$NUTS == "N"] * (1 - prop.repl[nut.12Jun$NUTS == "N"])) + (nut$NOx[nut$BOD == "RWN" & nut$DATE == "12-Jun"] * prop.repl[nut.12Jun$NUTS == "N"])
    init.NH3.17Jun.N <- (nut.12Jun$NH3[nut.12Jun$NUTS == "N"] * (1 - prop.repl[nut.12Jun$NUTS == "N"])) + (nut$NH3[nut$BOD == "RWN" & nut$DATE == "12-Jun"] * prop.repl[nut.12Jun$NUTS == "N"])
    init.P.17Jun.N <- (nut.12Jun$P[nut.12Jun$NUTS == "N"] * (1 - prop.repl[nut.12Jun$NUTS == "N"])) + (nut$P[nut$BOD == "RWN" & nut$DATE == "12-Jun"] * prop.repl[nut.12Jun$NUTS == "N"])

##### Calculate the Flux as the change in Concentration

    flux.NOx.17Jun.N <- nut$NOx[nut$BOD != "RWN" & nut$DATE == "17-Jun" & nut$NUTS == "N"] - init.NOx.17Jun.N
    flux.NH3.17Jun.N <- nut$NH3[nut$BOD != "RWN" & nut$DATE == "17-Jun" & nut$NUTS == "N"] - init.NH3.17Jun.N
    flux.P.17Jun.N <- nut$P[nut$BOD != "RWN" & nut$DATE == "17-Jun" & nut$NUTS == "N"] - init.P.17Jun.N
    CPOM.N <- nut$CPOM[nut$BOD != "RWN" & nut$DATE == "17-Jun" & nut$NUTS == "N"]
    flux.17Jun.N <- data.frame(CPOM.N, flux.NOx.17Jun.N, flux.NH3.17Jun.N, flux.P.17Jun.N)
    names(flux.17Jun.N) <- c("CPOM", "NOx", "NH3", "P")

##### Output

~~~~

> flux.17Jun.N
  CPOM       NOx       NH3         P
1    0  0.234810 -0.119495  0.028680
2    C  1.803855 -0.162620  0.007585
3    0 -3.902405 -0.099755 -0.001245
4    C  1.381210 -0.072830 -0.011775
5    C  1.957735 -0.338220  0.001690
6    0 -3.838485  0.016810  0.051660
7    0  0.170185 -0.110710  0.054605
8    C  1.636805 -0.082075 -0.000265

~~~~
  
#### 24 June
  
  To calculate the flux for the enriched samples on 24 June we need to calculate the initial nutrient concentrations due to the dilution of the overlying water with the replacement water.  At the conclusion of the sampling of the previous date a volume of water was removed from each of the bottles for sampling and this was then readded via the replacement water before the jar was put back into incubation.

So the inital nutrient concentration for 24 June is the concentration on 17 June diluted with the 17 June replacement water.

##### Import data with replacement water volumes

    sod.17Jun <- read.table("./data/cpom_flux_sod_17jun2014.csv", header = T, sep = ",")

##### Merge replacement volume data with Nutrient data

    repl.vol <- sod.17Jun[, c(1, 13, 14)] # selects only the BOD number and the repl vol from the file
    names(repl.vol) <- c("BOD", "Replvol", "BODwatervol")
    nut.17Jun <- merge(nut[nut$DATE == "17-Jun", ], repl.vol, by = "BOD")

##### Calculate the initial nutrient concentration as a weighted average of the volumes

    prop.repl <- nut.17Jun$Replvol / nut.17Jun$BODwatervol
    init.NOx.24Jun.N <- (nut.17Jun$NOx[nut.17Jun$NUTS == "N"] * (1 - prop.repl[nut.17Jun$NUTS == "N"])) + (nut$NOx[nut$BOD == "RWN" & nut$DATE == "17-Jun"] * prop.repl[nut.17Jun$NUTS == "N"])
    init.NH3.24Jun.N <- (nut.17Jun$NH3[nut.17Jun$NUTS == "N"] * (1 - prop.repl[nut.17Jun$NUTS == "N"])) + (nut$NH3[nut$BOD == "RWN" & nut$DATE == "17-Jun"] * prop.repl[nut.17Jun$NUTS == "N"])
    init.P.24Jun.N <- (nut.17Jun$P[nut.17Jun$NUTS == "N"] * (1 - prop.repl[nut.17Jun$NUTS == "N"])) + (nut$P[nut$BOD == "RWN" & nut$DATE == "17-Jun"] * prop.repl[nut.17Jun$NUTS == "N"])

##### Calculate the Flux as the change in Concentration

    flux.NOx.24Jun.N <- nut$NOx[nut$BOD != "RWN" & nut$DATE == "24-Jun" & nut$NUTS == "N"] - init.NOx.24Jun.N
    flux.NH3.24Jun.N <- nut$NH3[nut$BOD != "RWN" & nut$DATE == "24-Jun" & nut$NUTS == "N"] - init.NH3.24Jun.N
    flux.P.24Jun.N <- nut$P[nut$BOD != "RWN" & nut$DATE == "24-Jun" & nut$NUTS == "N"] - init.P.24Jun.N
    CPOM.N <- nut$CPOM[nut$BOD != "RWN" & nut$DATE == "24-Jun" & nut$NUTS == "N"]
    flux.24Jun.N <- data.frame(CPOM.N, flux.NOx.24Jun.N, flux.NH3.24Jun.N, flux.P.24Jun.N)
    names(flux.24Jun.N) <- c("CPOM", "NOx", "NH3", "P")

##### Output

~~~~

> flux.24Jun.N
  CPOM       NOx       NH3         P
1    0 -1.392180 -0.051405  0.034605
2    C -1.099870 -0.080780 -0.000190
3    0 -0.103610 -0.208920 -0.021440
4    C -0.024970 -0.153050 -0.034645
5    C -1.399640 -0.142970 -0.000075
6    0 -0.045220 -0.116875 -0.019190
7    0 -1.032205 -0.152425  0.002755
8    C -0.042115 -0.113365 -0.013395

~~~~

#### 1 July
  
  To calculate the flux for the enriched samples on 1 Jul we need to calculate the initial nutrient concentrations due to the dilution of the overlying water with the replacement water.  At the conclusion of the sampling of the previous date a volume of water was removed from each of the bottles for sampling and this was then readded via the replacement water before the jar was put back into incubation.

So the inital nutrient concentration for 1 July is the concentration on 24 June diluted with the 24 June replacement water.

##### Import data with replacement water volumes

    sod.24Jun <- read.table("./data/cpom_flux_sod_24jun2014.csv", header = T, sep = ",")

##### Merge replacement volume data with Nutrient data

    repl.vol <- sod.24Jun[, c(1, 13, 14)] # selects only the BOD number and the repl vol from the file
    names(repl.vol) <- c("BOD", "Replvol", "BODwatervol")
    nut.24Jun <- merge(nut[nut$DATE == "24-Jun", ], repl.vol, by = "BOD")

##### Calculate the initial nutrient concentration as a weighted average of the volumes

    prop.repl <- nut.24Jun$Replvol / nut.24Jun$BODwatervol
    init.NOx.1Jul.N <- (nut.24Jun$NOx[nut.24Jun$NUTS == "N"] * (1 - prop.repl[nut.24Jun$NUTS == "N"])) + (nut$NOx[nut$BOD == "RWN" & nut$DATE == "24-Jun"] * prop.repl[nut.24Jun$NUTS == "N"])
    init.NH3.1Jul.N <- (nut.24Jun$NH3[nut.24Jun$NUTS == "N"] * (1 - prop.repl[nut.24Jun$NUTS == "N"])) + (nut$NH3[nut$BOD == "RWN" & nut$DATE == "24-Jun"] * prop.repl[nut.24Jun$NUTS == "N"])
    init.P.1Jul.N <- (nut.24Jun$P[nut.24Jun$NUTS == "N"] * (1 - prop.repl[nut.24Jun$NUTS == "N"])) + (nut$P[nut$BOD == "RWN" & nut$DATE == "24-Jun"] * prop.repl[nut.24Jun$NUTS == "N"])

##### Calculate the Flux as the change in Concentration

    flux.NOx.1Jul.N <- nut$NOx[nut$BOD != "RWN" & nut$DATE == "1-Jul" & nut$NUTS == "N"] - init.NOx.1Jul.N
    flux.NH3.1Jul.N <- nut$NH3[nut$BOD != "RWN" & nut$DATE == "1-Jul" & nut$NUTS == "N"] - init.NH3.1Jul.N
    flux.P.1Jul.N <- nut$P[nut$BOD != "RWN" & nut$DATE == "1-Jul" & nut$NUTS == "N"] - init.P.1Jul.N
    CPOM.N <- nut$CPOM[nut$BOD != "RWN" & nut$DATE == "1-Jul" & nut$NUTS == "N"]
    flux.1Jul.N <- data.frame(CPOM.N, flux.NOx.1Jul.N, flux.NH3.1Jul.N, flux.P.1Jul.N)
    names(flux.1Jul.N) <- c("CPOM", "NOx", "NH3", "P")

##### Output

~~~~

> flux.1Jul.N
  CPOM       NOx       NH3         P
1    0 -1.466735 -0.034995  0.020850
2    C -1.409355  0.029535  0.010000
3    0 -1.687000 -0.043010  0.019080
4    C -1.361205  0.032195 -0.010340
5    C -1.344145  0.007665  0.014530
6    0 -1.354710 -0.086795 -0.013550
7    0 -1.397390 -0.054055  0.001565
8    C -1.362785  0.009345 -0.000340
> 

~~~~

### Create single data frame from dates

    DATE <- c(rep("12-Jun", 16), rep("17-Jun", 16), rep("24-Jun", 16), rep("1-Jul", 16))
    days <- c(rep(2, 16), rep(7, 16), rep(14, 16), rep(21, 16)) # number of days since set up
    days.elap <- c(rep(2, 16), rep(5, 16), rep(7, 16), rep(7, 16)) # number of days since t-1
    NUT <- c(rep(c(rep("0", 8), rep("N", 8)), 4)) 
    flux.samp <- rbind(flux.12Jun.C, flux.12Jun.N, flux.17Jun.C, flux.17Jun.N, flux.24Jun.C, flux.24Jun.N, flux.1Jul.C, flux.1Jul.N)
    flux.day <- flux.samp[,-1]/days.elap # removed the `CPOM` variable from the data and normalize by days

To convert the flux in `flux.day` from mg/L/d to mg/m2/d I calculated the volume of water in the bottles when the samples were collected as 300 ml bottle - 100 ml sediment = 200 ml - 15 ml removed for T-f SOD measurement = 185 ml = 0.185 L

Multiplying the volume in L by the change concentration in mg-N/L gives the change in N mass (mg) `mg/L * L/1 = mg`

To convert this to an areal flux, I divided the change in mass of N by the sediment area of the BOD bottles which was calculated as `0.003525652 m2` in the file CPOM_flux_BOD_OM_input_calc_6Jun2014.md

This gives `mg-N/1 * 1/m2 = mg-N/m2`

    flux <- (flux.day * .185) / 0.003525652
    cpom.flux.nut <- data.frame(DATE, days, NUT, flux.samp[,1], flux)
    names(cpom.flux.nut) <- c("DATE", "days", "NUT", "CPOM", "NOx", "NH3", "P")

    write.table(cpom.flux.nut, "./data/CPOM_Flux_Nutrient_Flux_calc.csv", row.names = F, quote = F, sep = ",")

