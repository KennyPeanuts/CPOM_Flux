# Data for the calculation of the DO of the replacement water in the CPOM Flux experiment

## Date of Run 

10 June 2014

## Metadata

### Collected by:

AG, KP

### Created on:

19 Jun 2014

### Modified:

### Affiliation:

Longwood University

### Description: 

The code for the calculation of the DO in the replacement water in the CPOM Flux Experiment

## R Code

### Data entry

    Nutrient <- c("no", "yes")
    date <- c("2014-06-10", "2014-06-10")
    vial <- c(18, 8) 
    Rmeas <- c(5.66, 6.83)

Note: Originally the nutirent water was run in vial 35 but vial 8 was broken and vial number 35 was renumbered 8

## Output

    repl <- data.frame(Nutrient, date, vial, Rmeas)

    write.table(repl, "./data/repl_water_10Jun2014.csv", quote = F, row.names = F, sep = ",")


