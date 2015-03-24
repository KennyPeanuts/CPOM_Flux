# Data for the calculation of the DO of the replacement water in the CPOM Flux experiment

## Date of Run 

1 July 2014

## Metadata

### Collected by:

KP

### Created: 

2 July 2014

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of the DO in the replacement water in the CPOM Flux Experiment

## Variable Descriptions

* Nutrient = indicates whether the water came from the nutrient enriched treatment

* date = the date that the measurements were collected (YYYY-MM-DD)

* vial = the number ID of the 10 ml vial used to collect the water for winklers

* Rmeas = the ml of titrant used to titrate the sample (ml)

## R Code

### Data entry

    # replace the values with the current data
    Nutrient <- c("no", "yes")
    date <- c("2014-01-01", "2014-07-01")
    vial <- c(17, 34) 
    Rmeas <- c(5.68, 5.58)

## Output

    repl <- data.frame(Nutrient, date, vial, Rmeas)

    # replace date with date of run
    write.table(repl, "./data/repl_water_1jul2014.csv", quote = F, row.names = F, sep = ",")


