# Metadata for the Compiled SOD data from the CPOM_Flux experiment 

## File

`CPOM_Flux_SOD.csv`

## Metadata

Collected by: KF and KDP

Collected on: 10 June - 3 July 2014 

Affiliation: Longwood University

Location: Longwood University

Description:

These are the compiled calculations of the SOD (really total respiration, since the water R is not subtracted) for all of the bottles in the CPOM Flux Exp.  The details and code for the calculations can be found in `CPOM_Flux_Exp_SOD_flux_calc.md` in the `analysis` folder.

**These data should be used for all analyses**
 
File Created: 5 June 2015

Modified: 

## Variables

* date = the date that the bottle was sealed and the change in oxygen was measured

* CPOM = the variable that identifies whether the bottle contained ("yes") or did not contain ("no") leaf discs.

* bod = the identifying number of the BOD bottle

* nutrient = the variable that identifies whether the bottle had DIN and DIP added ("yes") or was unamended lake water ("no").

* temp = the temperature of the lab during the incubation (dC)

* dDO = the change in oxygen concentration of the overlying water during the incubation (mmol O2)

* DOpre = the DO concentration of the overlying water at the beginning of the incubation (mmol / L) 

* DOpost = the DO concentration of the overlying water at the end of the incubation (mmol / L)

* DO.T0 = the DO concentration of the overlying water after the replacement water was added (mmol /L). This is the DO concentration that began the next open bottle incubation period (i.e., between day 0 and day 2).

* incubation.h = the number of hours that the bottle was sealed to measure the change in DO (h).

* SOD = the flux of oxygen in the bottle (umol O2 / m2 / h). Note a positive flux indicates a loss of oxygen.

* tot.OM = the total organic matter mass in the sediments of the bottle (g)

* leaf.OM = the mass of organic matter in the leaf discs added to the CPOM = "yes" bottles (g).

* sed.OM = the mass of the organic matter in the sediments without CPOM in the BOD bottles (g).

* days.elap = the number of days that elapsed between sealing the bottles to measure change in DO (d).

* sod.OM = the flux of oxygen in the bottle normalized to the organic matter content of the bottle (umol O2 / g OM / h)
