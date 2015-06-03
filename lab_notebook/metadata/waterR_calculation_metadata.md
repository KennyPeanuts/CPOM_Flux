# Metadata for the calculations of the water oxygen consumption (R) in the CPOM Flux Exp. 

## File

`waterR_calculation_DATE` note: these metadata apply to the calculations done on all the sampling dates.

## Metadata

Collected by: KF and KDP

Collected on: between 10 June and 3 July 2014

Affiliation: Longwood University

Location: Longwood University

Description:

These data are the calculated flux from the change in oxygen concentration in the water from the CPOM Flux experiment.  The details of the calculations and the R code can be found in `waterR_calculation_DATE.md` in the `analysis` folder, where "DATE" is the date the samples were collected. 

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

