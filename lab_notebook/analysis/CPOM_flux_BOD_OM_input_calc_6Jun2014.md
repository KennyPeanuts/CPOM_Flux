# Calculation of the amount of leaf disks to be added to the treatments in the CPOM flux exp.

* Author: KF

* Created: 6 June 2014

* Modified:

## Description

The AFDM of 10 mm leaf disks made the tulip poplar senescent leaves to be used in the experiment was determined by LOI and the density (g/m2) of CPOM in the LPP near-shore (~10 - 20 m from shore) habitat was measured using an ekman and LOI.

The purpose of these analyses is to calculate the number of leaf disks that can be added to the BOD bottles in the flux experiment to reasonably approximate the CPOM density of the lake.

## Import Data

    leaf <- read.delim("./data/CPOM_flux_leaf_disk_OM_inital_30May2014.txt", header = T)
    cpom <- read.delim("./data/LPP_CPOM_density_for_CPOM_Flux_Exp_29May2014.txt", header = T)

## Analysis

    mean(cpom$AFDM)

The mean CPOM ADFM is `102.4689 g/m2` in LPP

### Surface Area of BOD bottle sediments

The outside diameter of a 300 ml BOD bottle is `69 mm`, if we assume that the glass is approximately 1 mm thick this would make the inside diameter `67 mm` or `0.067 m`.

The area (m2) of the sediments in the BOD bottle would be: `A = pi(0.5 * d)^2`

    pi * (0.5 * 0.067)^2

The surface area of the sediments in the BOD bottle is `0.003525652 m2`

This means that each bottle should have the following CPOM mass (g AFDM)

    102.4689 * 0.003525

Each bottle should have `0.3612029 g AFDM` CPOM.

### AFDM of leaf disks

    mean(leaf$AFDM)

The 10 mm leaf disks have a mean AFDM of `0.0028 g`

This means that each BOD bottle should contain `129`, 10 mm leaf disks!

    0.36 / 0.0028

That's a lot of leaf disks!
