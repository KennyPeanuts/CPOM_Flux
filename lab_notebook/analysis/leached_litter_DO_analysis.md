# Analysis of the DO from the Leached Litter Exp 

## Fall 2016

## Metadata

* Code created 12 Aug 2016

## Purpose

This code is to analyze the effect of the leached litter addition treatments on DO

## Code
### Import Data

     ll.do.22sept <- read.table("./data/leached_litter_DOconc_22sept2015.csv", header = T, sep = ",")
     ll.do.24sept <- read.table("./data/leached_litter_DOconc_24sept2015.csv", header = T, sep = ",")
     ll.do.1oct <- read.table("./data/leached_litter_DOconc_01oct2015.csv", header = T, sep = ",")
     ll.do.8oct <- read.table("./data/leached_litter_DOconc_08oct2015.csv", header = T, sep = ",")
     ll.do.22oct <- read.table("./data/leached_litter_DOconc_22oct2015.csv", header = T, sep = ",")
     

### Combine into a single dataset

    sod <- rbind(ll.do.22sept, ll.do.24sept, ll.do.1oct, ll.do.8oct, ll.do.22oct)
    
#### Create a date and incubation day variable

    date <- c(rep("2016-09-22", 12), rep("2016-09-24", 12), rep("2016-10-01", 12), rep("2016-10-08", 12), rep("2016-10-22", 12))
    # the incubation was begun on 9 Feb 2016
    days.elap <- as.numeric(difftime(as.Date(date), as.Date("2016-09-21") ))

#### Create as single combined data.frame

    sod <- data.frame(date, days.elap, sod)

## Analysis
    
    tapply(sod$DOmmol.TF, sod$days.elap, summary)
