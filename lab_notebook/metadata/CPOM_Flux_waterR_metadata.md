# Metadata for the water R flux data 

## File

`CPOM_Flux_waterR.csv`

## Metadata

Collected by: KF and KDP

Collected on: between 10 June and 3 July 2014

Affiliation: Longwood University

Location: Longwood University

Description:

These data are the calculated flux from the change in oxygen concentration in the water from the CPOM Flux experiment.  The details of the calculations and the R code can be found in `waterR_calculation_DATE.md` in the `analysis` folder, where "DATE" is the date the samples were collected. 

Information about the date of the sampling and the time elapsed during the incubation is included.

The methods for the sample collection and incubation can be found in `CPOM_Flux_BOD_sampling_protocol.md` in the `lab_notes` folder.
 
File Created: 3 June 2015

Modified: 

## Variables

* bod = the number of the BOD bottle from which the incubated water was collected

* CPOM = whether the bottle contained added leaf discs (yes) or not (no)

* nutrient = whether the bottle contained added DIP and DIN (yes) or not (no)

* temp = the temperature of the water (dC) at the time of the sampling.

* DO.T0 = the dissolved oxygen concentration at the beginning of the incubation period in mmol O_2 / L

* DO.TF = the dissolved oxygen concentration at the conclusion of the incubation period in mmol O_2 / L

* dDO = the change in oxygen concentration during the incubation (DO.T0 - DO.TF) in mmol O_2 / L

* waterR = the volumetric flux of oxygen in mmol O_2 / L / h

* date = the date that the final oxygen concentration was determined (YYYY-MM-DD)

* days.elap = the number of days that the BOD bottles were incubated between flux calculations.
