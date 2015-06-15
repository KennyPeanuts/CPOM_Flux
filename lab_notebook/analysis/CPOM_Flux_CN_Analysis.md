# Analysis of the C:N data for the CPOM Flux Experiment

## Summer 2014

## Metadata

* Code created 2 June 2015 - KF

## Purpose

This code creates calculated variables for the C:N data from the CPOM Flux experiment and evaluates differences in the treatments

## Code
### Import Data

    cn.raw <- read.table("./data/CPOM_Flux_CN_raw.csv", header = T, sep = ",")

### Strip bullshit columns created by Excel

    cn.raw <- cn.raw[, 1:5]

### Replace bad valus from lost sample with `NA`. 

See `CPOM_Flux_CN_raw_metadata.md` for the details, but bulk sample in Vial 13 was mostly lost in shipping so %C and %N are not reliable and are replaced with `NA`

    cn.raw[12, 4:5] <- NA

### Create Calculated Variables

To calculate the actual mass of C and N in the samples I multipled the proportion of C and N (%/100) by the dry mass of the sample

    N.mass <- cn.raw$mass * (cn.raw$percN / 100) # mass of N in the sample in mg
    C.mass <- cn.raw$mass * (cn.raw$percC / 100) # mass of C in the sample in mg

To calculate the C:N I divided the C.mass by the N.mass

    CN <- C.mass / N.mass

### Create labels for the treatments

    CPOM <- c("N", "N", "Y", "N", "Y", "N", "N", "N", "Y", "Y", "Y", "Y", "N", "N", "Y", "Y", "N", "N", "Y", "N", "Y", "N", "N", "N", "Y", "Y", "Y", "Y", "N", "N", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y")

    NUT <- c("Y", "N", "Y", "N", "N", "Y", "N", "N", "Y", "Y", "N", "N", "Y", "Y", "Y", "N", "Y", "N", "Y", "N", "N", "Y", "N", "N", "Y", "Y", "N", "N", "Y", "Y", "Y", "N", "Y", "N", "Y", "Y", "N", "N", "Y") 

### Bind the labels and calculated variables into data file

    cn <- data.frame(cn.raw, N.mass, C.mass, CN, CPOM, NUT)

    write.table(cn, "./data/CPOM_Flux_CN.csv", quote = F, row.names = F, sep = ",")

## Data Analysis

### Load working data
** Begin data reanalysis here with working data **
  
    cn <- read.table("./data/CPOM_Flux_CN.csv", header = T, sep = ",")

### Summary Statistics

#### %C content of the surface sediments

    tapply(cn$percC[cn$Source == "surf"], cn$CPOM[cn$Source == "surf"], summary) 

~~~~

$N ** NO CPOM **
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  3.050   3.088   3.205   3.198   3.288   3.360 

$Y ** CPOM **
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  3.050   3.135   3.180   3.215   3.325   3.410 

~~~~

    tapply(cn$percC[cn$Source == "surf"], cn$NUT[cn$Source == "surf"], summary)
    
~~~~

$N ** NO CPOM **
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  3.090   3.148   3.225   3.236   3.318   3.410 

$Y ** CPOM **
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  3.050   3.072   3.135   3.176   3.290   3.360 
  
~~~~

    plot(surf ~ bulk, ylim = c(2.5, 4.5), xlim = c(2.5, 4.5), subset = cn$CPOM[cn$Source == "bulk"] == "Y")
    points(surf ~ bulk, ylim = c(2.5, 4.5), xlim = c(2.5, 4.5), subset = cn$CPOM[cn$Source == "bulk"] == "N", pch = 2)
    abline(0, 1)
    
#### % C in the Bulk sediment

    tapply(cn$percC[cn$Source == "bulk"], cn$CPOM[cn$Source == "bulk"], summary) 

~~~~

$N ** NO CPOM **
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  3.120   3.230   3.275   3.375   3.300   4.270 

$Y  ** CPOM **
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  3.200   3.242   3.320   3.373   3.427   3.720       1 

~~~~


### Compare the CN by treatments

    tapply(cn$CN[cn$Source == "surf"], cn$CPOM[cn$Source == "surf"], summary) 

~~~~
  
$N **NO CPOM**
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.50   10.77   10.90   10.85   11.01   11.04 

$Y **CPOM**
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.66   10.70   10.82   10.81   10.91   10.97 

~~~~

    tapply(cn$CN[cn$Source == "surf"], cn$NUT[cn$Source == "surf"], summary)

~~~~
  
$N **NO Nutrient Addition**
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.66   10.81   10.88   10.88   10.98   11.04 

$Y **Nutrient Addition**
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.50   10.64   10.80   10.77   10.91   11.00 

~~~~

    tapply(cn$CN[cn$CPOM == "Y"], cn$Source[cn$CPOM == "Y"], summary)

~~~~
  
$bulk
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
  10.48   10.68   10.74   10.82   10.96   11.27       1 

$leaf
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  15.22   15.84   16.16   16.37   17.15   17.36 

$surf
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.66   10.70   10.82   10.81   10.91   10.97 

~~~~

## Conclusions 
  
Neither nutrients or the addition of leaf litter had an effect on the sediment C:N.  Further, at the end of the experiment, the added leaf litter had a C:N 51.2% greater than the surface sediment. 

    mean(cn$CN[cn$Source == "leaf"]) 

`= 16.36817 # mean C:N of the leaf discs`

    mean(cn$CN[cn$Source == "surf"])

`= 10.82821 # mean C:N of the surface sediment`

    ((16.36817 - 10.82821) / 10.82821) * 100

` = 51.2%`
     
