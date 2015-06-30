# Metadata for the Calculated Sr analysis of the DOM from the CPOM Flux Experiment, Summer 2014

## File

`CPOM_Flux_sratio.csv`

## Metadata

Collected by: KF and KDP

Collected on: 10 June - 3 July 2014 

Affiliation: Longwood University

Location: Longwood University

Description:

The calculated ratio of the slope of the absorption of the the DOM between 275 and 295 nm and between 350 and 400 nm. Water samples were collected from each BOD bottle and filtered through a GFF filter and then run on a nanopore spec.

Reference:

> Helms, J. R. A. Stubbins, J. D. Ritchie, E. C. Minor, D. J. Kieber, K. Mopper. 2008. Absorption spectral slopes and slope ratios as indicators of molecular weight, source, and photobleaching of chromophoric dissolved organic matter. Limnology and Oceanography 53:955-969.

Calculation details and code in `CPOM_Flux_Exp_spec_calc.md` in the `analysis` folder.

**These data should be used for all analyses**
 
File Created: 29 June 2015

Modified: 

## Variables

* bod = the identifying number of the BOD bottles

* day = the date that the samples were collected from the BOD bottles

* CPOM = whether the bottles contained "yes" or did not contain "no" CPOM

* nutrient = whether the bottles contained "yes" or did not contain "no" added DIN and DIP

* spec275.slope = the slope of the natural log of the DOM absorption by wavelength between 275 and 295 nm

* spec350.slope = the slope of the natural log DOM absorption by wavelength between 350 and 400 nm

* s.ratio = the ratio of the `spec275.slope` and `spec350.slope`

* elapsed.d = the number of days elapsed during the incubation.
