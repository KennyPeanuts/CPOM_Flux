# Metadata and code cleaning for spec scans from the CPOM Flux Experiment

## Metadata

Collected by: KDP and KF

Collected on: 17 June 2014

Affiliation: Longwood University

Location: Longwood University

Description: 

Five ml of water was collected from each BOD bottle prior to sealing for SOD incubation with a glass syringe. The sample was filtered through a GFF into a 15 ml Falcon Tube.  The sample was then refrigerated for approximately 24 h before absorbance was measured.  Absorbance was measured between 190 and 840 nm on a Nanopore (MODEL) spec in a 1 cm pathway cuvette. The software subtracted abs at 750 nm for baseline correction

Created: 2 July 2014

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

## Data Import

    bod1 <- read.table("./data/spec_scans/bod1_17jun.csv", header = T, sep = ",")
    bod2 <- read.table("./data/spec_scans/bod2_17jun.csv", header = T, sep = ",")
    bod3 <- read.table("./data/spec_scans/bod3_17jun.csv", header = T, sep = ",")
    bod4 <- read.table("./data/spec_scans/bod4_17jun.csv", header = T, sep = ",")
    bod5 <- read.table("./data/spec_scans/bod5_17jun.csv", header = T, sep = ",")
    bod6 <- read.table("./data/spec_scans/bod6_17jun.csv", header = T, sep = ",")
    bod7 <- read.table("./data/spec_scans/bod7_17jun.csv", header = T, sep = ",")
    bod8 <- read.table("./data/spec_scans/bod8_17jun.csv", header = T, sep = ",")
    bod9 <- read.table("./data/spec_scans/bod9_17jun.csv", header = T, sep = ",")
    bod10 <- read.table("./data/spec_scans/bod10_17jun.csv", header = T, sep = ",")
    bod11 <- read.table("./data/spec_scans/bod11_17jun.csv", header = T, sep = ",")
    bod12 <- read.table("./data/spec_scans/bod12_17jun.csv", header = T, sep = ",")
    bod13 <- read.table("./data/spec_scans/bod13_17jun.csv", header = T, sep = ",")
    bod14 <- read.table("./data/spec_scans/bod14_17jun.csv", header = T, sep = ",")
    bod15 <- read.table("./data/spec_scans/bod15_17jun.csv", header = T, sep = ",")
    bod16 <- read.table("./data/spec_scans/bod16_17jun.csv", header = T, sep = ",")
    bod17 <- read.table("./data/spec_scans/bod17_17jun.csv", header = T, sep = ",")
    bod18 <- read.table("./data/spec_scans/bod18_17jun.csv", header = T, sep = ",")

## Combine all BOD bottles into 1 file

    spec.all <- rbind(bod1, bod2, bod3, bod4, bod5, bod6, bod7, bod8, bod9, bod10, bod11, bod12, bod13, bod14, bod15, bod16, bod17, bod18)

     ## Create Labels for bod bottles
    bod <- rep(1:18, 651)
    bod <- sort(bod)

    ## Create new data.frame with bod lables and only abs and wavelength columns
    spec.trunk <- spec.all[, 1:2]
    spec <- data.frame(bod, spec.trunk)
    names(spec) <- c("bod", "wl", "abs")

## Create Data Table

    write.table(spec, "./data/cpom_flux_spec_17jun2014.csv", row.names = F, quote = F, sep = ",")
