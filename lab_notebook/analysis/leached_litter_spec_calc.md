# Calculation of the Sr, E2:E3, and E4:E6 ratio of DOM absorbance from the leached litter exp - Fall 2015 

## Purpose

This code it to calculate the E2:E3, E4:E6, and S_R from the spec scan data from the treatments with and without leached leaf litter 


## Import data

    spec22Sept <- read.table("./data/leached_litter_spec_22sept2015.csv", header = T, sep = ",")
    spec24Sept <- read.table("./data/leached_litter_spec_24sept2015.csv", header = T, sep = ",")
    spec1Oct <- read.table("./data/leached_litter_spec_1oct2015.csv", header = T, sep = ",")
    spec8Oct <- read.table("./data/leached_litter_spec_8oct2015.csv", header = T, sep = ",")
    spec22Oct <- read.table("./data/leached_litter_spec_22oct2015.csv", header = T, sep = ",")
    spec5Nov <- read.table("./data/leached_litter_spec_5nov2015.csv", header = T, sep = ",")
    treat <- read.table("./data/leached_litter_treatments_fall2015.csv", header = T, sep = ",")

## Combine dates

    spec.all <- rbind(spec22Sept, spec24Sept, spec1Oct, spec8Oct, spec22Oct, spec5Nov)
    
To convert the absorbance to absorbance coefficients I am using 

> a = 2.303 A / l

Where:

* a = the absorbance coefficient (m^(-1))
* A = the absorbance from the spec
* l = the path length (m), in this case `0.01 m`

    a <- (spec.all$abs * 2.303) / 0.01
    
Add a to the data frame
    
    spec.a <- data.frame(spec.all, a)

#### make date list

    day <- c(rep("2015-09-22", length(spec22Sept$bod)), rep("2015-09-24", length(spec24Sept$bod)), rep("2015-10-01", length(spec1Oct$bod)), rep("2015-10-08", length(spec8Oct$bod)), rep("2015-10-22", length(spec22Oct$bod)), rep("2015-11-05", length(spec5Nov$bod)))
    spec.tot <- data.frame(day, spec.a)

### Merge with treatments

    spec <- merge(treat, spec.tot, by = "bod")

## Data Analysis

### Calculate E-ratios  

The E2:E3 is the ratio of the absorption at 250 to 365nm and is correlated with the molecular weight of the DOM 

Reference

> De Haan H. and T. De Boer. 1987. Applicability of light absorbance and fluorescence as measures of concentration and molecular size of dissolved organic carbon in humic Lake Tjeukemeer. Water Research 21: 731-734.

The E4:E6 is the ratio of the absorption at 465 to 665nm and is shown to be correlated with the amount of humification in the sample.

Reference

> Sensei, N., T. M. Miano, M. R. Provenzano, and G. Brunetti. 1989. Spectroscopic and composition of I.H.S.S. reference and standard fulvic and humic acids of various origin. Science of the Total Environment 81/82: 143-156.

    E2E3.a <- spec$a[spec$wl == 250] / spec$a[spec$wl == 365]
    E4E6.a <- spec$a[spec$wl == 465] / spec$a[spec$wl == 665]
    bod250 <- spec$bod[spec$wl == 250]
    treat250 <- spec$treat[spec$wl == 250]
    day250 <- spec$day[spec$wl == 254]
    Eratio <- data.frame(bod250, day250, treat250, E2E3.a, E4E6.a)
    
#### Make Data File for the Calculated Data

    write.table(Eratio, "./data/leached_litter_Eratio.csv", quote = F, row.names = F, sep = ",")

## Calculate Spectral Slope ratios

The spectral slope ratio is the ratio of the slope of the change in absoption from 275- 295nm and 350 - 400nm.  The change is negative exponential so the linear slope is calculated from the log transformed absorption.

Reference 

> Helms, J. R. A. Stubbins, J. D. Ritchie, E. C. Minor, D. J. Kieber, K. Mopper. 2008. Absorption spectral slopes and slope ratios as indicators of molecular weight, source, and photobleaching of chromophoric dissolved organic matter. Limnology and Oceanography 53:955-969.


Select data between 275 and 295 from the `spec` data.

    spec275 <- spec[spec$wl >= 275 & spec$wl <=295, ]

Create empty `elapsed.d` variable

    elapsed.d <- rep(0, length(spec275$bod))

Add `elapsed.d` to the spec275 dataframe

   spec275 <- data.frame(spec275, elapsed.d)

Replace empty `elapsed.d` variables with correct days

   spec275$elapsed.d[spec275$day == "2015-09-22"] <- 1
   spec275$elapsed.d[spec275$day == "2015-09-24"] <- 2
   spec275$elapsed.d[spec275$day == "2015-10-01"] <- 9
   spec275$elapsed.d[spec275$day == "2015-10-08"] <- 16
   spec275$elapsed.d[spec275$day == "2015-10-22"] <- 30
   spec275$elapsed.d[spec275$day == "2015-11-05"] <- 44

Select data between 350 and 400nm from `spec` data.

    spec350 <- spec[spec$wl >=350 & spec$wl <= 400, ]

Create empty `elapsed.d` variable

    elapsed.d <- rep(0, length(spec350$bod))

Add `elapsed.d` to the spec350 dataframe

   spec350 <- data.frame(spec350, elapsed.d)

Replace empty `elapsed.d` variables with correct days

   spec350$elapsed.d[spec350$day == "2015-09-22"] <- 1
   spec350$elapsed.d[spec350$day == "2015-09-24"] <- 2
   spec350$elapsed.d[spec350$day == "2015-10-01"] <- 9
   spec350$elapsed.d[spec350$day == "2015-10-08"] <- 16
   spec350$elapsed.d[spec350$day == "2015-10-22"] <- 30
   spec350$elapsed.d[spec350$day == "2015-11-05"] <- 44

Calculate the slope for each day and bottle

#### Create a function to calculate the slope for each day and bottle

The following code was provided by Gavin Simpson on Stack Overflow [http://stackoverflow.com/a/31059583/686481](http://stackoverflow.com/a/31059583/686481)


    # create wrapper function tp calculate the slope
    lm.slope <- function(x){
      coef(lm(log(a) ~ wl, data = x))[2]
    }

##### S 275 - 295

    # split the day and bod data
    spl.data <- with(spec275, split(spec275, list(elapsed.d = elapsed.d, bod = bod)))

    # get a list of the slopes
    slopes <- sapply(spl.data, lm.slope)

    # create data frame of the data with the slopes
    # create a data frame of the elapsed day and bod
    bod <- c(rep(1:12, length(unique(spec275$elapsed.d))))
    bod <- sort(bod)
    elapsed.d <- rep(sort(unique(spec275$elapsed.d)), length(unique(bod))

    spec275.slopes <- data.frame(bod, elapsed.d, slopes)

##### S 350 - 400

    # split the day and bod data
    spl.data <- with(spec350, split(spec350, list(elapsed.d = elapsed.d, bod = bod)))

    # get a list of the slopes
    slopes <- sapply(spl.data, lm.slope)

    # create data frame of the data with the slopes
    # create a data frame of the elapsed day and bod
    bod <- c(rep(1:12, length(unique(spec350$elapsed.d))))
    bod <- sort(bod)
    elapsed.d <- rep(sort(unique(spec350$elapsed.d)), length(unique(bod)))

    spec350.slopes <- data.frame(bod, elapsed.d, slopes)

#### Calculate the S-ratio

    s.ratio.lst <- spec275.slopes$slopes / spec350.slopes$slopes

##### Create data.frame of the S-ratio

    s.ratio <- data.frame(spec275.slopes$bod, spec275.slopes$elapsed.d, spec275.slopes$slopes, spec350.slopes$slopes, s.ratio.lst)
    names(s.ratio) <- c("bod", "elapsed.d", "spec275.slope", "spec350.slope", "s.ratio")

Merge with the treatments

    s.ratio <- merge(treat, s.ratio, by = "bod")

    write.table(s.ratio, "./data/leached_litter_sratio.csv", quote = F, row.names = F, sep = ",")
