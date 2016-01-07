# Metadata for the Ergosterol Data from the CPOM Flux Exp 

## File

`CPOM_Flux_Ergo.csv`

## Metadata

Collected by: KF and KDP, Ergosterol analysis completed by Vlad Gulis at Coastal Carolina University 

Collected on: 3 July 2014

Affiliation: Longwood University

Location: Longwood University

Description:

The collection of the sediment and leaf discs for %C and %N analysis is described in `CPOM_flux_break-down_notes.md` in the `lab_notes` folder.

Briefly, 4 leaf discs and a surface sediment core (1 cm X 0.8 cm) were collected from each bottle and placed into a 20 ml glass scintillation vial and 10 ml of HPLC-grade methanol was added to each sample. The samples were then capped very tightly, wrapped in parafilm and placed in the freezer.

The analysis details are in `Fortino_ergosterol.xlsx` in the `Data` folder.

The calculation details and code are in `CPOM_Flux_Ergo_Analysis.md` in the `Analysis` folder.

**These data should be used for all analyses**
 
File Created: 8 Jan 2016 

Modified: 

## Variables

* samp_code = the identification code on the vial that indicated the sample type (L or S) and BOD bottle number

* bod = the number of the BOD bottle from which the sample was taken

* CPOM = the code indicating whether the BOD bottle has added CPOM (Y) or not (N)

* nutrients = the code indicating whether the BOD bottle had added N and P (Y) or not (N)

* samp = the code indicating whether the sample is a leaf disc ("leaf") or a sediment core ("sed")

* samp_AFDM = the ash-free-dry-mass of the sample (g) 

* ml_MeOH = the volume of methanol (ml)

* pk_area = the peak area from the HPLC

* ergo_conc = the concentration of ergosterol (&mu;g/ml)

* ergo_samp = the mass of ergosterol in the sample (&mu;g)

* fungal_mass_samp = the biomass of fungi in the sample (&mu;g)

* ergo_per_OM = the ergosterol mass normalized to the AFDM of the sample (&mu;g / g AFDM)

* fungal_mass_per_OM = the fungal biomass normalized to the AFDM of the sample (&mu;g / g AFDM)
