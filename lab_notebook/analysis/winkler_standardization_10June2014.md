# Calculation of standardization for Winkler Titration

## Date of Run 

10 June 2014

## Metadata

### Collected by:

AG, KP

### Created on

17 June 2014

### Modified

### Affiliation

Longwood University

### Description 

The code for the calculation of the standardization variables for the winkler titrations.

## R Code

### Data entry

    stds <- c(1.35, 1.27, 1.26)
    blank.first <- c(1.26, 1.28, 1.26)
    blank.second <- c(2.57, 2.55, 2.55)
    Vstd <- 0.2
    MnCl.vol <- 0.085
    NaI.vol <- 0.085
    Nstd <- 0.01
    E <- 5598

### Calculations

    Rstd <- mean(stds)
    blank.second.vol <- blank.second - blank.first
    Rblk <- mean(blank.first - blank.second.vol)
    Vreg <- sum(MnCl.vol, NaI.vol)
    DOreg <- 0.018 * MnCl.vol

## Output

    std <- data.frame(Rstd, Rblk, Vstd, Nstd, E, Vreg, DOreg)

    write.table(std, file = "./data/winkler_standardization_10June2014.csv", quote = F, row.names = F, sep = ",")



