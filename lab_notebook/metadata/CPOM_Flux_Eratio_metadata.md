# Metadata for the Calculated E2:E3 and E4:E6 ratios of DOM absorbance from the CPOM Flux Experiment 

## File

`CPOM_Flux_Eratio.csv`

## Metadata

Collected by: KF and KDP

Collected on: 10 June - 3 July 2014 

Affiliation: Longwood University

Location: Longwood University

Description:

The calculated DOM E2:E3 and E4:E6 ratios for the DOM in the CPOM Flux experiment.

Samples of water from each BOD bottle were filtered through GFF and run on a Nanopore spec.

The E2:E3 is the ratio of the DOM absorption at 275 nm and 365 nm and is a proxy for the molecular mass of the DOM.  

Reference:

> De Haan H. and T. De Boer. 1987. Applicability of light absorbance and fluorescence as measures of concentration and molecular size of dissolved organic carbon in humic Lake Tjeukemeer. Water Research 21: 731-734.

The E4:E6 is the ratio of the DOM absorption at 350 nm and 665 nm and is a proxy of the humification of the DOM.

> Sensei, N., T. M. Miano, M. R. Provenzano, and G. Brunetti. 1989. Spectroscopic and composition of I.H.S.S. reference and standard fulvic and humic acids of various origin. Science of the Total Environment 81/82: 143-156.

Calculation details and code in `CPOM_Flux_Exp_spec_calc.md` in the `analysis` folder.

**These data should be used for all analyses**
 
File Created: 29 June 2015

Modified: 

## Variables

* bod = the identifying number of the BOD bottles

* day = the date that the samples were collected from the BOD bottles

* CPOM = whether the bottles contained "yes" or did not contain "no" CPOM

* nutrient = whether the bottles contained "yes" or did not contain "no" added DIN and DIP

* E2E3 = the calculated ratio of the DOM absorption at 275 nm and 365 nm.

* E4E6 = the calculated ratio of the DOM absorption at 350 nm and 665 nm.

* elapsed.d = the number of days elapsed during the incubation.
