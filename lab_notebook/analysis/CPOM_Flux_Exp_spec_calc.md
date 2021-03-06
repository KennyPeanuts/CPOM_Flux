# Calculation of the Sr, E2:E3, and E4:E6 ratio of DOM absorbance from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to calculate the E2:E3, E4:E6, and S_R from the spec scan data from the treatments with and without CPOM and/or nutrients


## Import data

    spec10 <- read.table("./data/cpom_flux_spec_10jun2014.csv", header = T, sep = ",")
    spec12 <- read.table("./data/cpom_flux_spec_12jun2014.csv", header = T, sep = ",")
    spec17 <- read.table("./data/cpom_flux_spec_17jun2014.csv", header = T, sep = ",")
    spec24 <- read.table("./data/cpom_flux_spec_24jun2014.csv", header = T, sep = ",")
    spec01 <- read.table("./data/cpom_flux_spec_1jul2014.csv", header = T, sep = ",")
    sod10 <- read.table("./data/cpom_flux_sod_10jun2014.csv", header = T, sep = ",") # imported to get treatment assignments to bod IDs

## Combine dates

    spec.all <- rbind(spec10, spec12, spec17, spec24, spec01)
    
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

    day <- c(rep("2014-06-10", length(spec10$bod)), rep("2014-06-12", length(spec12$bod)), rep("2014-06-17", length(spec17$bod)), rep("2014-06-24", length(spec24$bod)), rep("2014-07-01", length(spec01$bod)))
    spec.tot <- data.frame(day, spec.a)

### Merge with treatments

    treat <- sod10[, c(1, 4, 5)] # selects for the relevant colums from the sod data.frame
    spec <- merge(treat, spec.tot, by.x = "bod", by.y = "bod")

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
    CPOM250 <- spec$CPOM[spec$wl == 250]
    Nutrient250 <- spec$Nutrient[spec$wl == 250]
    day250 <- spec$day[spec$wl == 254]
    Eratio <- data.frame(bod250, day250, CPOM250, Nutrient250, E2E3.a, E4E6.a)
    
    elapsed10 <- as.numeric(difftime(Eratio$day[Eratio$day == "2014-06-10"], Eratio$day[Eratio$day == "2014-06-10"], units = "days"))
    elapsed12 <- as.numeric(difftime(Eratio$day[Eratio$day == "2014-06-12"], Eratio$day[Eratio$day == "2014-06-10"], units = "days"))
    elapsed17 <- as.numeric(difftime(Eratio$day[Eratio$day == "2014-06-17"], Eratio$day[Eratio$day == "2014-06-10"], units = "days"))
    elapsed24 <- as.numeric(difftime(Eratio$day[Eratio$day == "2014-06-24"], Eratio$day[Eratio$day == "2014-06-10"], units = "days"))
    elapsed01 <- as.numeric(difftime(Eratio$day[Eratio$day == "2014-07-01"], Eratio$day[Eratio$day == "2014-06-10"], units = "days"))
    elapsed.d <- c(elapsed10, elapsed12, elapsed17, elapsed24, elapsed01)

#### Make Data Frame of Eratio with elapsed time

    
    # the order stmnt is to sort E2E3 and E4E6 so that it matches the sort of elapsed.d
    Eratio <- data.frame(Eratio[order(as.Date(Eratio$day)), ], elapsed.d)
    names(Eratio) <- c("bod", "day", "CPOM", "nutrient", "E2E3", "E4E6", "elapsed.d")

#### Make Data File for the Calculated Data

    write.table(Eratio, "./data/CPOM_Flux_Eratio.csv", quote = F, row.names = F, sep = ",")

## Calculate Spectral Slope ratios

The spectral slope ratio is the ratio of the slope of the change in absoption from 275- 295nm and 350 - 400nm.  The change is negative exponential so the linear slope is calculated from the log transformed absorption.

Reference 

> Helms, J. R. A. Stubbins, J. D. Ritchie, E. C. Minor, D. J. Kieber, K. Mopper. 2008. Absorption spectral slopes and slope ratios as indicators of molecular weight, source, and photobleaching of chromophoric dissolved organic matter. Limnology and Oceanography 53:955-969.


Select data between 275 and 295 from the `spec` data.

    spec275 <- spec[spec$wl >= 275 & spec$wl <=295, ]

Create empty `elapsed.d` variable

    elapsed.d <- rep(0, 1680)

Add `elapsed.d` to the spec275 dataframe

   spec275 <- data.frame(spec275, elapsed.d)

Replace empty `elapsed.d` variables with correct days

   spec275$elapsed.d[spec275$day == "2014-06-12"] <- 2
   spec275$elapsed.d[spec275$day == "2014-06-17"] <- 7
   spec275$elapsed.d[spec275$day == "2014-06-24"] <- 14
   spec275$elapsed.d[spec275$day == "2014-07-01"] <- 21

Select data between 350 and 400nm from `spec` data.

    spec350 <- spec[spec$wl >=350 & spec$wl <= 400, ]

Create empty `elapsed.d` variable

    elapsed.d <- rep(0, 4080)

Add `elapsed.d` to the spec350 dataframe

   spec350 <- data.frame(spec350, elapsed.d)

Replace empty `elapsed.d` variables with correct days

   spec350$elapsed.d[spec350$day == "2014-06-12"] <- 2
   spec350$elapsed.d[spec350$day == "2014-06-17"] <- 7
   spec350$elapsed.d[spec350$day == "2014-06-24"] <- 14
   spec350$elapsed.d[spec350$day == "2014-07-01"] <- 21

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
    bod <- c(rep(1:16, 5))
    bod <- sort(bod)
    elapsed.d <- rep(c(0, 2, 7, 14, 21), 16)

    spec275.slopes <- data.frame(bod, elapsed.d, slopes)

##### S 350 - 400

    # split the day and bod data
    spl.data <- with(spec350, split(spec350, list(elapsed.d = elapsed.d, bod = bod)))

    # get a list of the slopes
    slopes <- sapply(spl.data, lm.slope)

    # create data frame of the data with the slopes
    # create a data frame of the elapsed day and bod
    bod <- c(rep(1:16, 5))
    bod <- sort(bod)

    elapsed.d <- rep(c(0, 2, 7, 14, 21), 16)

    spec350.slopes <- data.frame(bod, elapsed.d, slopes)

#### Calculate the S-ratio

    s.ratio.lst <- spec275.slopes$slopes / spec350.slopes$slopes

##### Create data.frame of the S-ratio

    s.ratio <- data.frame(spec275.slopes$bod, spec275.slopes$elapsed.d, spec275.slopes$slopes, spec350.slopes$slopes, s.ratio.lst)
    names(s.ratio) <- c("bod", "elapsed.d", "spec275.slope", "spec350.slope", "s.ratio")

Merge with the treatments

    s.ratio <- merge(treat, s.ratio, by.x = "bod", by.y = "bod")

    write.table(s.ratio, "./data/CPOM_Flux_sratio.csv", quote = F, row.names = F, sep = ",")
