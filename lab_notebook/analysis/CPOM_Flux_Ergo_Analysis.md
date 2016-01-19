# Analysis of the Ergosterol Data from the CPOM Flux Experiment

## Import Data

    ergo <- read.table("./data/CPOM_Flux_Ergo.csv", header = T, sep = ",")

## Calculate Variables
    
Given that the sediments have a lot of volume that does not likely support fungi, I am converting the ergosterol and fungal biomass to an areal estimate.
    
### Calculate the area of the sediment core and leaf disks
    
    sed.area <- pi * ((0.8 / 2)^2) # sediment core = 0.8 cm diam. Units = cm^2

The surface area of the leaf discs is multipled by 2 assuming that each leaf disc could be colonized on both sides.
    
    leaf.area <- (pi * ((1 / 2)^2)) * 4 * 2 # leaf discs 1 cm diam and each sample = 4 leaf discs.  Units = cm^2

    surf.area <- rep(NA, 32) # create empty object
    # fill in appropriate areas
    surf.area[ergo$samp == "leaf"] <- leaf.area
    surf.area[ergo$samp == "sed"] <- sed.area
    
### Calculate the Areal abundance of ergosterol 

    ergo.area <- ergo$ergo_samp / surf.area

## Calculated Variable Descriptions
    
* surf.area = the surface area of the total sample material in the vial. For the sediment core it is the surface area of the sediment core in cm^2. For the leaf discs it is the total surface area of both sides of the 4 leaf discs in cm^2.
    
* ergo.area = the mass of ergosterol per cm^2 of sediment or leaf disc in the sample (&mu;g / cm^2).
    
## Analysis
    
### Ergosterol Normalized by AFDM
    
For the leaf samples (&mu;g ergosterol / g AFDM):
     
    summary(ergo$ergo_per_OM[ergo$samp == "leaf"])
    
~~~~

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
  72.88  105.30  119.20  132.10  168.70  203.80       8 
    
~~~~
     
For the sediment samples (&mu;g ergosterol / g AFDM):
     
    summary(ergo$ergo_per_OM[ergo$samp == "sed"])
    
~~~~
     
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  39.02   49.71   58.87   55.97   61.60   68.56 
    
~~~~

     par(las = 1)
     boxplot(ergo$ergo_per_OM[ergo$samp == "leaf"], ergo$ergo_per_OM[ergo$samp == "sed"], ylim = c(0, 200), ylab = "Ergosterol (ug/ g AFDM)")
    text(1, 10, "Leaf")
    text(2, 10, "Sediment")
    dev.copy(jpeg, "./output/plots/ergo_per_OM_by_samp.jpg")
    dev.off()
    
![Ergosterol per g AFDM on leaf discs and sediment in CPOM Flux Exp.](../output/plots/ergo_per_OM_by_samp.jpg)
    
Analyzed in this way the, leaves appear to have more ergosterol than the sediments but since the sediments were a core there is a lot of AFDM that was below the sediment surface that could not have supported fungal biomass.  Thus the value for the sediments is being diluted by this excess sediment organic matter.
    
If we normalize the samples by area, we can see that the sediments actually have a lot more ergosterol than the leaf discs.

### Ergosterol Normalized by Area
    
For the leaf samples (&mu;g ergosterol / cm^2 leaf):
    
    summary(ergo.area[ergo$samp == "leaf"])

~~~~
     
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
0.07512 0.10370 0.13750 0.14610 0.18260 0.23350       8 
    
~~~~
     
For the sediment samples (&mu;g ergosterol / cm^2 sediments):
     
     summary(ergo.area[ergo$samp == "sed"])

~~~~
     
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  2.296   2.489   2.694   2.670   2.818   3.021 
    
~~~~
    
    #boxplot
    #par(las = 1)
    #boxplot(ergo.area[ergo$samp == "leaf"], ergo.area[ergo$samp == "sed"], ylim = c(0, 3), ylab = "Ergosterol (ug/ cm^2)")
    #text(1, 0.5, "Leaf")
    #text(2, 2, "Sediment")
    #dev.copy(jpeg, "./output/plots/ergo_per_cm2.jpg")
    #dev.off()

    # points plot
    par(las = 1)
    plot(ergo.area ~ jitter(as.numeric(samp), 1), data = ergo, xlim = c(0, 3), ylab = "Ergosterol (ug / cm^2)", xlab = " ", axes = F)
    axis(2)
    axis(1, at = c(1, 2), c("Leaf", "Sediment"))
    box()
    dev.copy(jpeg, "./output/plots/ergo_per_cm2.jpg")
    dev.off()

![Ergosterol per cm^2 of leaf discs and sediment in CPOM Flux Exp.](../output/plots/ergo_per_cm2.jpg)
    
#### Kruskal Test of difference between the medians
    
    kruskal.test(ergo.area ~ samp, data = ergo)
    
~~~~
   
Kruskal-Wallis rank sum test

data:  ergo.area by samp
Kruskal-Wallis chi-squared = 15.36, df = 1, p-value = 8.885e-05

~~~~
     

    
### Effect of Leaves on Sediment Ergosterol
    
    par(las = 1)
    plot(ergo.area ~ jitter(as.numeric(CPOM), 1), data = ergo, subset = samp == "sed" & nutrients == "N", ylim = c(0, 3), xlim = c(0, 3), axes = F, xlab = " ", ylab = "Sediment Ergosterol / cm^2")
    points(ergo.area ~ jitter(as.numeric(CPOM), 1), data = ergo, subset = samp == "sed" & nutrients != "N", pch = 19)
    axis(2)
    axis(1, at = c(1, 2), c("No Leaves", "Leaves"))
    legend(0, 1, c("Ambient Nutrients", "Added Nutrients"), pch = c(1, 19))
    box()
    dev.copy(jpeg, "./output/plots/sed_erg_by_CPOM.jpg")
    dev.off()
    
![Sediment Ergosterol by CPOM and Nutrients](../output/plots/sed_erg_by_CPOM.jpg)
 