# Metadata for data file of Nutrient flux calculation from the CPOM Flux experiment

## Metadata

File: CPOM_Flux_Nutrient_Flux_calc.csv

Collected by: KF and KP

Collected on: 10, 12, 17, 24 Jun 2014 & 01 Jul 2014; calculations done Jan-Feb 2015

Affiliation: Longwood University

Description: These data contain the flux calculations from the measured nutrient concentrations in the CPOM flux experiments. The flux was calculated as the change in nutrient concentration from time `t-1` to time `t`, corrected for the nutrients that were added with the water to replace the sampling volume. Since the nutrient concentration on 10 Jun 2014 was not measured, the inintal nutirent concentrations of the replacement water bottles are used as `t-1` for the 12 Jun 2014 sampling. All other dates the `t-1` concentration was calculated as the volume weighted average of the replacement water and the measured concentration on that date.

The flux calculations from each date were combined into a single data.frame

Created: 25 Feb 2015

Modified:

### Variables:

* DATE = the date that the water for nutrient analysis was removed from the BOD bottle
* days = the number of days from set-up that the sample was taken.
* NUT = identifies the treatment level of the nutrient addition treatment; "N" = added nutrients, "0" = ambient nutrients
* CPOM = identifies the treatment level of the CPOM addition; CPOM = 20, 1 cm senecent tulip poplar leaf discs added, "0" = no CPOM
* NOx = the flux of nitrate and nitrite from the sediments in mg-N m^-2 d^-1
* NH3 = the flux of ammonum from the sediments in mg-N m^-2 d^-1
* P = the flux of orthophosphate from the sediments in mg-P m^-2 d^-1 

## R Code

The code for the calculations can be found in `code/CPOM_Flux_Nutrients_Flux_Calc.md`

## Output


