# Data for the calculation of the DO of the replacement water in the CPOM Flux experiment

## Date of Run 

18 Feb 2016

## Metadata

### Collected by:

KF, JM, JA

### Created: 

19 Feb 2016

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

    date <- rep("2016-02-18", 4)
    vial <- c(11:14) 
    BeginBuret <- c(0.805, 1.90, 2.95, 3.95)
    EndBuret <- c(1.90, 2.95, 3.95, 5.05)
    Rmeas <- EndBuret - BeginBuret


## Output

    repl <- data.frame(date, vial, Rmeas)

    # replace date with date of run
    write.table(repl, "./data/repl_water_18feb2016.csv", quote = F, row.names = F, sep = ",")


