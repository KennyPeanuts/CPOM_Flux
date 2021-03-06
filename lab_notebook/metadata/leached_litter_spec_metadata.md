# Metadata and code cleaning for spec scans from the Leached Litter Experiment

## Metadata

Collected by: KF, JM, and JA

Collected on: Fall 2016

Affiliation: Longwood University

Location: Longwood University

Description: 

Five ml of water was collected from each BOD bottle prior to sealing for SOD incubation with a glass syringe. The sample was filtered through a GFF into a 15 ml Falcon Tube.  The sample was then refrigerated for approximately 24 h before absorbance was measured.  Absorbance was measured between 190 and 840 nm on a Nanopore (2000/2000c) spec in a 1 cm pathway cuvette. The software subtracted abs at 750 nm for baseline correction

Created: 24 Aug 2016

Modified:

### Variables

* bod# = a data frame of the data imported from the spec, where the # is the ID of the BOD bottle. 17 and 18 refer to the ambient and nutrient replacement water.

* spec.all = a data frame that combines the data from all of the BOD bottles

* bod = a list of the BOD bottle ID numbers sorted

* spec.trunk = a data frame with just the wavelength and absorbance data

* spec = a data frame merging the wavelength and absorbance data with the bod ID numbers

    * bod = the bod ID number
    * wl = the wavelength (nm)
    * abs = the absorbance

## Data Processing and Data File Creation
### 22 Sept 2015 Sampling

#### Data Import

     bod1 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod1.csv", header = T, sep = ",")
     bod2 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod2.csv", header = T, sep = ",")
     bod3 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod3.csv", header = T, sep = ",")
     bod4 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod4.csv", header = T, sep = ",")
     bod5 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod5.csv", header = T, sep = ",")
     bod6 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod6.csv", header = T, sep = ",")
     bod7 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod7.csv", header = T, sep = ",")
     bod8 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod8.csv", header = T, sep = ",")
     bod9 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod9.csv", header = T, sep = ",")
     bod10 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod10.csv", header = T, sep = ",")
     bod11 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod11.csv", header = T, sep = ",")
     bod12 <- read.table("./data/spec_scans/leached_litter_22_sept_2015_bod12.csv", header = T, sep = ",")

#### Combine all BOD bottles into 1 file

     spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12)

#### Create Labels for bod bottles
     bod <- rep(1:12, 531)
     bod <- sort(bod)

#### Create new data.frame with bod lables and only abs and wavelength columns
     spec.trunk <- spec.all[, 1:2]
     spec <- data.frame(bod, spec.trunk)
     names(spec) <- c("bod", "wl", "abs")

#### Make Data Table

    write.table(spec, "./data/leached_litter_spec_22sept2015.csv", row.names = F, quote = F, sep = ",")


## Data Processing and Data File Creation
### 24 Sept 2015 Sampling

#### Data Import

     bod1 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod1.csv", header = T, sep = ",")
     bod2 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod2.csv", header = T, sep = ",")
     bod3 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod3.csv", header = T, sep = ",")
     bod4 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod4.csv", header = T, sep = ",")
     bod5 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod5.csv", header = T, sep = ",")
     bod6 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod6.csv", header = T, sep = ",")
     bod7 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod7.csv", header = T, sep = ",")
     bod8 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod8.csv", header = T, sep = ",")
     bod9 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod9.csv", header = T, sep = ",")
     bod10 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod10.csv", header = T, sep = ",")
     bod11 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod11.csv", header = T, sep = ",")
     bod12 <- read.table("./data/spec_scans/leached_litter_24_sept_2015_bod12.csv", header = T, sep = ",")

#### Combine all BOD bottles into 1 file

     spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12)

#### Create Labels for bod bottles
     bod <- rep(1:12, 651)
     bod <- sort(bod)

#### Create new data.frame with bod lables and only abs and wavelength columns
     spec.trunk <- spec.all[, 1:2]
     spec <- data.frame(bod, spec.trunk)
     names(spec) <- c("bod", "wl", "abs")

#### Make Data Table

    write.table(spec, "./data/leached_litter_spec_24sept2015.csv", row.names = F, quote = F, sep = ",")


## Data Processing and Data File Creation
### 1 Oct 2015 Sampling

#### Data Import

     bod1 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod1.csv", header = T, sep = ",")
     bod2 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod2.csv", header = T, sep = ",")
     bod3 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod3.csv", header = T, sep = ",")
     bod4 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod4.csv", header = T, sep = ",")
     bod5 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod5.csv", header = T, sep = ",")
     bod6 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod6.csv", header = T, sep = ",")
     bod7 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod7.csv", header = T, sep = ",")
     bod8 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod8.csv", header = T, sep = ",")
     bod9 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod9.csv", header = T, sep = ",")
     bod10 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod10.csv", header = T, sep = ",")
     bod11 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod11.csv", header = T, sep = ",")
     bod12 <- read.table("./data/spec_scans/leached_litter_01_oct_2015_bod12.csv", header = T, sep = ",")

#### Combine all BOD bottles into 1 file

     spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12)

#### Create Labels for bod bottles
     bod <- rep(1:12, 651)
     bod <- sort(bod)

#### Create new data.frame with bod lables and only abs and wavelength columns
     spec.trunk <- spec.all[, 1:2]
     spec <- data.frame(bod, spec.trunk)
     names(spec) <- c("bod", "wl", "abs")

#### Make Data Table

    write.table(spec, "./data/leached_litter_spec_1oct2015.csv", row.names = F, quote = F, sep = ",")


## Data Processing and Data File Creation
### 8 Oct 2015 Sampling

#### Data Import

     bod1 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod1.csv", header = T, sep = ",")
     bod2 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod2.csv", header = T, sep = ",")
     bod3 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod3.csv", header = T, sep = ",")
     bod4 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod4.csv", header = T, sep = ",")
     bod5 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod5.csv", header = T, sep = ",")
     bod6 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod6.csv", header = T, sep = ",")
     bod7 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod7.csv", header = T, sep = ",")
     bod8 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod8.csv", header = T, sep = ",")
     bod9 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod9.csv", header = T, sep = ",")
     bod10 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod10.csv", header = T, sep = ",")
     bod11 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod11.csv", header = T, sep = ",")
     bod12 <- read.table("./data/spec_scans/leached_litter_08_oct_2015_bod12.csv", header = T, sep = ",")

#### Combine all BOD bottles into 1 file

     spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12)

#### Create Labels for bod bottles
     bod <- rep(1:12, 651)
     bod <- sort(bod)

#### Create new data.frame with bod lables and only abs and wavelength columns
     spec.trunk <- spec.all[, 1:2]
     spec <- data.frame(bod, spec.trunk)
     names(spec) <- c("bod", "wl", "abs")

#### Make Data Table

    write.table(spec, "./data/leached_litter_spec_8oct2015.csv", row.names = F, quote = F, sep = ",")


## Data Processing and Data File Creation
### 22 Oct 2015 Sampling

#### Data Import

     bod1 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod1.csv", header = T, sep = ",")
     bod2 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod2.csv", header = T, sep = ",")
     bod3 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod3.csv", header = T, sep = ",")
     bod4 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod4.csv", header = T, sep = ",")
     bod5 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod5.csv", header = T, sep = ",")
     bod6 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod6.csv", header = T, sep = ",")
     bod7 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod7.csv", header = T, sep = ",")
     bod8 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod8.csv", header = T, sep = ",")
     bod9 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod9.csv", header = T, sep = ",")
     bod10 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod10.csv", header = T, sep = ",")
     bod11 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod11.csv", header = T, sep = ",")
     bod12 <- read.table("./data/spec_scans/leached_litter_22_oct_2015_bod12.csv", header = T, sep = ",")

#### Combine all BOD bottles into 1 file

     spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12)

#### Create Labels for bod bottles
     bod <- rep(1:12, 651)
     bod <- sort(bod)

#### Create new data.frame with bod lables and only abs and wavelength columns
     spec.trunk <- spec.all[, 1:2]
     spec <- data.frame(bod, spec.trunk)
     names(spec) <- c("bod", "wl", "abs")

#### Make Data Table

    write.table(spec, "./data/leached_litter_spec_22oct2015.csv", row.names = F, quote = F, sep = ",")


## Data Processing and Data File Creation
### 5 Nov 2015 Sampling

#### Data Import

     bod1 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod1.csv", header = T, sep = ",")
     bod2 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod2.csv", header = T, sep = ",")
     bod3 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod3.csv", header = T, sep = ",")
     bod4 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod4.csv", header = T, sep = ",")
     bod5 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod5.csv", header = T, sep = ",")
     bod6 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod6.csv", header = T, sep = ",")
     bod7 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod7.csv", header = T, sep = ",")
     bod8 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod8.csv", header = T, sep = ",")
     bod9 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod9.csv", header = T, sep = ",")
     bod10 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod10.csv", header = T, sep = ",")
     bod11 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod11.csv", header = T, sep = ",")
     bod12 <- read.table("./data/spec_scans/leached_litter_05_nov_2015_bod12.csv", header = T, sep = ",")

#### Combine all BOD bottles into 1 file

     spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12)

#### Create Labels for bod bottles
     bod <- rep(1:12, 651)
     bod <- sort(bod)

#### Create new data.frame with bod lables and only abs and wavelength columns
     spec.trunk <- spec.all[, 1:2]
     spec <- data.frame(bod, spec.trunk)
     names(spec) <- c("bod", "wl", "abs")

#### Make Data Table

    write.table(spec, "./data/leached_litter_spec_5nov2015.csv", row.names = F, quote = F, sep = ",")

