# Analysis of the Organic Matter of the sediments and leaves from the litter experiment 

## Summer 2014 

## Metadata

* Code created 9 Aug 2016

## Purpose

This code analyzes the LOI data from the Litter Experiment (CPOM Flux) and evaluates differences in the treatments

## Code
### Import Data

    loi.sed.init <- read.table("./data/CPOM_flux_LPP_sed_OM_inital_29May2014.txt", header = T)
    loi.sed.final <- read.table("./data/CPOM_flux_LPP_sed_OM_final_7jul2014.csv", header = T, sep = ",")
    loi.leaf.init <- read.table("./data/CPOM_flux_leaf_disk_OM_inital_30May2014.txt", header = T)
    loi.leaf.final <- read.table("./data/CPOM_flux_leaf_disk_OM_7jul2014.csv", header = T, sep = ",")

