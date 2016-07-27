# Analysis of the Initial Organic Content of the Microcosma from the leached litter exp. 

## Fall 2015

## Metadata

* Code created 27 July 2016

## Purpose

This code analyzes the LOI data from the initial organic matter added to the microcosms in the Leached Litter experiment

## Code
### Import Data

    loi <- read.table("./data/leached_litter_initial_LOI_17Sept2015.csv", header = T, sep = ",")

### Summary Statistics
#### Sediment Samples

    summary(loi[loi$sample == "sed",])
   

~~~~
Sediment Samples

  sample       cruc         cruc.mass        cruc.sed        cruc.ash        sed.mass     
 leaf:0   Min.   : 4.00   Min.   :11.89   Min.   :12.44   Min.   :12.37   Min.   :0.5031  
 sed :4   1st Qu.: 7.00   1st Qu.:12.16   1st Qu.:12.67   1st Qu.:12.61   1st Qu.:0.5263  
          Median : 9.00   Median :12.42   Median :12.96   Median :12.89   Median :0.5401  
          Mean   : 8.25   Mean   :12.42   Mean   :12.95   Mean   :12.89   Mean   :0.5361  
          3rd Qu.:10.25   3rd Qu.:12.68   3rd Qu.:13.24   3rd Qu.:13.17   3rd Qu.:0.5498  
          Max.   :11.00   Max.   :12.94   Max.   :13.47   Max.   :13.40   Max.   :0.5611  
                                                                                          
    ash.mass          propOM        AFDM.sample         leaf.num     AFDM.leaf      sed.vol 
 Min.   :0.4413   Min.   :0.1208   Min.   :0.06180   Min.   : NA   Min.   : NA   Min.   :5  
 1st Qu.:0.4614   1st Qu.:0.1223   1st Qu.:0.06495   1st Qu.: NA   1st Qu.: NA   1st Qu.:5  
 Median :0.4736   Median :0.1229   Median :0.06655   Median : NA   Median : NA   Median :5  
 Mean   :0.4704   Mean   :0.1225   Mean   :0.06567   Mean   :NaN   Mean   :NaN   Mean   :5  
 3rd Qu.:0.4826   3rd Qu.:0.1230   3rd Qu.:0.06728   3rd Qu.: NA   3rd Qu.: NA   3rd Qu.:5  
 Max.   :0.4933   Max.   :0.1236   Max.   :0.06780   Max.   : NA   Max.   : NA   Max.   :5  
                                                     NAs   :4     NAs   :4                
    dry.bulk     
 Min.   :0.1006  
 1st Qu.:0.1053  
 Median :0.1080  
 Mean   :0.1072  
 3rd Qu.:0.1100  
 Max.   :0.1122 

~~~~
 
##### Leaf Samples  
   
    summary(loi[loi$sample == "leaf",])

~~~~
Leaf

  sample       cruc        cruc.mass        cruc.sed        cruc.ash        sed.mass      
 leaf:4   Min.   :11.0   Min.   :26.59   Min.   :26.62   Min.   :29.44   Min.   :0.02680  
 sed :0   1st Qu.:12.5   1st Qu.:28.50   1st Qu.:28.76   1st Qu.:29.51   1st Qu.:0.03535  
          Median :15.5   Median :29.29   Median :29.48   Median :29.58   Median :0.04300  
          Mean   :15.5   Mean   :28.73   Mean   :28.84   Mean   :29.58   Mean   :0.11230  
          3rd Qu.:18.5   3rd Qu.:29.51   3rd Qu.:29.55   3rd Qu.:29.66   3rd Qu.:0.11995  
          Max.   :20.0   Max.   :29.73   Max.   :29.78   Max.   :29.73   Max.   :0.33640  
                                                         NAs   :2                        
    ash.mass           propOM        AFDM.sample         leaf.num    AFDM.leaf       
 Min.   :0.00000   Min.   :0.9948   Min.   :0.03800   Min.   :20   Min.   :0.001900  
 1st Qu.:0.00005   1st Qu.:0.9961   1st Qu.:0.04045   1st Qu.:20   1st Qu.:0.002022  
 Median :0.00010   Median :0.9974   Median :0.04290   Median :20   Median :0.002145  
 Mean   :0.00010   Mean   :0.9974   Mean   :0.04290   Mean   :20   Mean   :0.002145  
 3rd Qu.:0.00015   3rd Qu.:0.9987   3rd Qu.:0.04535   3rd Qu.:20   3rd Qu.:0.002267  
 Max.   :0.00020   Max.   :1.0000   Max.   :0.04780   Max.   :20   Max.   :0.002390  
 NAs   :2         NAs   :2        NAs   :2                      NAs   :2         
    sed.vol       dry.bulk  
 Min.   : NA   Min.   : NA  
 1st Qu.: NA   1st Qu.: NA  
 Median : NA   Median : NA  
 Mean   :NaN   Mean   :NaN  
 3rd Qu.: NA   3rd Qu.: NA  
 Max.   : NA   Max.   : NA  
 NAs   :4     NAs   :4    

~~~~
 
 
### Calculate the mass of organic matter in the microcosms
 
The volume of slurry added to each of the microcosms was 100 ml in the leached litter experiment, so the sediment mass of the bottles is summarized as:
 
    summary(loi$dry.bulk * 100)

~~~~
 Sediment mass in the bottles (g)

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
  10.06   10.53   10.80   10.72   11.00   11.22       4 

~~~~
 
The range of sediment organic matter mass can be estimated as:
 
minimum = the minimum sediment mass in the bottle * the minimum proportion of organic matter:
 
    min(loi$dry.bulk[loi$sample == "sed"] * 100) * min(loi$propOM[loi$sample == "sed"])

~~~~
minimum g of organic matter in the microcosm

1.215832

~~~~
 
maximum = the maximum sediment mass in the bottle * the maximum proportion of organic matter:
 
    max(loi$dry.bulk[loi$sample == "sed"] * 100) * max(loi$propOM[loi$sample == "sed"])

~~~~
maximum of organic matter in the microcosm

1.386729

~~~~
 
### Calculate the mass of leaf litter in the microcosms
 
    Each microcosm contained 20 leaf discs so the mass of the added leaves is simply the mass of the 20 leaves

    loi$AFDM.sample[loi$sample == "leaf"]

~~~~
Mass of 20 leached leaf discs

[1]     NA 0.0478 0.0380     NA

~~~~
 
The surface area of the sediments in the microcosms is 0.00353 m2 [ref](//github.com/KennyPeanuts/CPOM_Flux/blob/master/lab_notebook/analysis/CPOM_flux_BOD_OM_input_calc_6Jun2014.md) so the mass per m^2 would be:
 
    loi$AFDM.sample[loi$sample == "leaf"] / 0.00353

~~~~
Mass of CPOM added to each bottle (g/m2)

[1]       NA 13.54108 10.76487       NA

~~~~


