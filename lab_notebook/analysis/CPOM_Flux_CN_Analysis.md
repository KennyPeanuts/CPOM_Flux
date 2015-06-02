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
  