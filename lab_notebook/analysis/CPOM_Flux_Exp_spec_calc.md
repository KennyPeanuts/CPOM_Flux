# Calculation of the ratio of DOM absorbance at 254nm and 336nm from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to calculate the ratio of the absorbance of the DOM at 254nm and 336nm the spec scan data from the treatments with and without CPOM and/or nutrients

Analysis methods taken from:

> Helms, J. R. A. Stubbins, J. D. Ritchie, E. C. Minor, D. J. Kieber, K. Mopper. 2008. Absorption spectral slopes and slope ratios as indicators of molecular weight, source, and photobleaching of chromophoric dissolved organic matter. Limnology and Oceanography 53:955-969.

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

### Calculate E2E3

This is the ratio of the absorption at 250 to 365nm and is correlated with the molecular weight of the DOM 

Reference

> De Haan H. and T. De Boer. 1987. Applicability of light absorbance and fluorescence as measures of concentration and molecular size of dissolved organic carbon in humic Lake Tjeukemeer. Water Research 21: 731-734.

    E2E3.a <- spec$a[spec$wl == 250] / spec$a[spec$wl == 365]
    bod250 <- spec$bod[spec$wl == 250]
    CPOM250 <- spec$CPOM[spec$wl == 250]
    Nutrient250 <- spec$Nutrient[spec$wl == 250]
    day250 <- spec$day[spec$wl == 254]
    E2E3 <- data.frame(bod250, day250, CPOM250, Nutrient250, E2E3.a)
    names(E2E3) <- c("bod", "day", "CPOM", "nutrient", "E2E3")
    
    E4E6.a <- spec$a[spec$wl == 465] / spec$a[spec$wl == 665]
    
    elapsed10 <- as.numeric(difftime(E2E3$day[E2E3$day == "2014-06-10"], E2E3$day[E2E3$day == "2014-06-10"], units = "days"))
    elapsed12 <- as.numeric(difftime(E2E3$day[E2E3$day == "2014-06-12"], E2E3$day[E2E3$day == "2014-06-10"], units = "days"))
    elapsed17 <- as.numeric(difftime(E2E3$day[E2E3$day == "2014-06-17"], E2E3$day[E2E3$day == "2014-06-10"], units = "days"))
    elapsed24 <- as.numeric(difftime(E2E3$day[E2E3$day == "2014-06-24"], E2E3$day[E2E3$day == "2014-06-10"], units = "days"))
    elapsed01 <- as.numeric(difftime(E2E3$day[E2E3$day == "2014-07-01"], E2E3$day[E2E3$day == "2014-06-10"], units = "days"))
    elapsed.d <- c(elapsed10, elapsed12, elapsed17, elapsed24, elapsed01)

#### Make Data Frame of E2E3 with elapsed time

** This is not working yet.  I think the problem is with sorting the E4E6.a vector.  I am getting:  `Error in E4E6.a[order(as.Date(E2E3$day)), ] : 
  incorrect number of dimensions` **
    
    # the order stmnt is to sort E2E3 so that it matches the sort of elapsed.d
    E.ratios <- data.frame(E2E3[order(as.Date(E2E3$day)), ], elapsed.d, E4E6.a[order(as.Date(E2E3$day)), ]) 

#### Make Data File for the Calculated Data

    write.table(E2E3, "./data/CPOM_Flux_E2E3.csv", quote = F, row.names = F, sep = ",")

