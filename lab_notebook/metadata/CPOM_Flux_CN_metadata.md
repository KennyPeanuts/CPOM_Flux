# Metadata for the processed %C and %N data from the CPOM Flux Experiment

## File

`CPOM_Flux_CN.csv`

## Metadata

Collected by: KF and KDP, C/N analysis completed by Matt Waters at Valdosta State

Collected on: 3 July 2014

Affiliation: Longwood University

Location: Longwood University

Description:

The collection of the sediment and leaf discs for %C and %N analysis is described in `CPOM_flux_break-down_notes.md` in the `lab_notes` folder.

Briefly, 4 leaf discs, a surface sediment core (1 cm X 0.8 cm), and a bulk sediment core (z cm X 0.8 cm) were collected from each bottle and placed into a 20 ml glass scintillation vial and dried at 50 dC. The samples were then homogenized with a mortar and pestle and sent to the Waters lab at Valdosta State University for C and N analysis.

These data were processed from the raw data to remove the unreliable data values and to calculate C:N and C and N mass.

The calculation details and code are in `CPOM_Flux_CN_Analysis.md` in the `Analysis` folder.

**These data should be used for all analyses**
 
File Created: 2 June 2015

Modified: 

## Variables

* Source = the type of organic matter that is in the sample. "bulk" is a 0.8 cm diameter core of the entire sediment column, "surf" is a 0.8 cm diameter core from the sediment-water interface down to 1 cm, and "leaf" is 4 leaf discs homogenized together.

* Vial = the identifying number of the BOD bottle from which the sample was taken

* mass = the mass of the dried sample in mg

* percN = the percent nitrogen content of the sample

* percC = the percent carbon content of the sample

* N.mass = the mass of N in the sample in mg calculated as the dry mass of the sample multiplied by the proportion of N in the sample.

* C.mass = the mass of C in the sample in mg calculated as the dry mass of the sample multiplied by the proportion of C in the sample.

* CN = the ratio of C to N in the sample calculated as C.mass / N.mass

* CPOM = identifies whether the bottle contained leaf litter (Y) or not (N).

* NUT = identifies whether the bottle contained added DIN and DIP (Y) or not (N).
 
### Notes

bulk sample in vial 13 was broken during shipping and so the some of the sample was lost.  The percC and percN values are not likely reliable. The measured values were replaced with `NA` for analysis.

bulk sample vial 1 was broken during shipping and all material was lost. 


