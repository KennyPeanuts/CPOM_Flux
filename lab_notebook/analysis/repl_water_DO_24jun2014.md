# Data for the calculation of the DO of the replacement water in the CPOM Flux experiment

## Date of Run 

24 June 2014

## Metadata

### Collected by:

KP

### Created: 

26 June 2014

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
    date <- c("2014-06-24", "2014-06-24")
    vial <- c(17, 34) 
    Rmeas <- c(6.31, 6.72)

Note: Originally the nutirent water was run in vial 35 but vial 8 was broken and vial number 35 was renumbered 8

## Output

    repl <- data.frame(Nutrient, date, vial, Rmeas)

    # replace date with date of run
    write.table(repl, "./data/repl_water_24jun2014.csv", quote = F, row.names = F, sep = ",")


