# Data for the calculation of the DO of the replacement water in the CPOM Flux experiment

## Date of Run 

22 Sept 2015

## Metadata

### Collected by:

KF, JM, JA

### Created: 

12 Oct 2015

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of the DO in the replacement water in the CPOM Flux Experiment

## Variable Descriptions

* date = the date that the measurements were collected (YYYY-MM-DD)

* vial = the number ID of the 10 ml vial used to collect the water for winklers

* BeginBuret = the reading on the buret at the beginning of the titration (ml)

* EndBuret = the reading on the buret at the end of the titration (ml)

* Rmeas = the difference between EndBuret and Begin Buret, which is the ml of titrant used to titrate the sample (ml)

## R Code

### Data entry

    date <- c("2015-09-22", "2015-09-22")
    vial <- c(29, 17) 
    BeginBuret <- c(7.755, 8.40)
    EndBuret <- c(8.40, 8.95)
    Rmeas <- EndBuret - BeginBuret


## Output

    repl <- data.frame(date, vial, Rmeas)

    # replace date with date of run
    write.table(repl, "./data/repl_water_22sept2015.csv", quote = F, row.names = F, sep = ",")


