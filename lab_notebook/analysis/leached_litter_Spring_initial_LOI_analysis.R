# Analysis of the Initial Organic Content of the Microcosma from the leached litter SOD exp. 

## Spring 2016

## Metadata

* Code created 8 Aug 2016

## Purpose

This code analyzes the LOI data from the initial organic matter added to the microcosms in the Spring Leached Litter experiment

## Code
### Import Data

    loi <- read.table("./data/leached_litter_initial_LOI_Spring2016.csv", header = T, sep = ",")

### Summary Statistics
#### Sediment Samples

    summary(loi[loi$sample == "sed",])
   

~~~~
Sediment Samples

sample     leaf.num      sed.vol       cruc         cruc.mass      cruc.remass   
 leaf:0   Min.   : NA   Min.   :5   Min.   : 6.00   Min.   :28.87   Min.   :28.87  
 sed :3   1st Qu.: NA   1st Qu.:5   1st Qu.:11.00   1st Qu.:29.16   1st Qu.:29.16  
          Median : NA   Median :5   Median :16.00   Median :29.44   Median :29.44  
          Mean   :NaN   Mean   :5   Mean   :13.33   Mean   :29.94   Mean   :29.56  
          3rd Qu.: NA   3rd Qu.:5   3rd Qu.:17.00   3rd Qu.:30.48   3rd Qu.:29.91  
          Max.   : NA   Max.   :5   Max.   :18.00   Max.   :31.52   Max.   :30.38  
          NAs   :3                                                                
    cruc.sed        cruc.ash        sed.mass         ash.mass          propOM       
 Min.   :29.71   Min.   :29.57   Min.   :0.8149   Min.   :0.6791   Min.   :0.07157  
 1st Qu.:29.98   1st Qu.:29.84   1st Qu.:0.8243   1st Qu.:0.6865   1st Qu.:0.11911  
 Median :30.25   Median :30.12   Median :0.8337   Median :0.6940   Median :0.16665  
 Mean   :30.77   Mean   :30.63   Mean   :1.2072   Mean   :1.0683   Mean   :0.13526  
 3rd Qu.:31.30   3rd Qu.:31.16   3rd Qu.:1.4033   3rd Qu.:1.2629   3rd Qu.:0.16711  
 Max.   :32.35   Max.   :32.21   Max.   :1.9729   Max.   :1.8317   Max.   :0.16757  
                                                                                    
  AFDM.sample       AFDM.leaf      dry.bulk     
 Min.   :0.1358   Min.   : NA   Min.   :0.1630  
 1st Qu.:0.1378   1st Qu.: NA   1st Qu.:0.1649  
 Median :0.1397   Median : NA   Median :0.1667  
 Mean   :0.1389   Mean   :NaN   Mean   :0.2414  
 3rd Qu.:0.1404   3rd Qu.: NA   3rd Qu.:0.2807  
 Max.   :0.1412   Max.   : NA   Max.   :0.3946  
                  NAs   :3                     

~~~~
 
##### Leaf Samples  
   
    summary(loi[loi$sample == "leaf",])

~~~~
Leaf Samples

 sample     leaf.num     sed.vol         cruc        cruc.mass      cruc.remass   
 leaf:5   Min.   :20   Min.   : NA   Min.   : 5.0   Min.   :28.82   Min.   :28.82  
 sed :0   1st Qu.:20   1st Qu.: NA   1st Qu.: 8.0   1st Qu.:28.97   1st Qu.:28.97  
          Median :20   Median : NA   Median :10.0   Median :29.75   Median :29.75  
          Mean   :20   Mean   :NaN   Mean   :13.4   Mean   :29.78   Mean   :29.78  
          3rd Qu.:20   3rd Qu.: NA   3rd Qu.:21.0   3rd Qu.:30.38   3rd Qu.:30.38  
          Max.   :20   Max.   : NA   Max.   :23.0   Max.   :31.00   Max.   :31.00  
                       NAs   :5                                                   
    cruc.sed        cruc.ash        sed.mass         ash.mass            propOM      
 Min.   :28.86   Min.   :28.82   Min.   :0.0421   Min.   :-0.00550   Min.   :0.9644  
 1st Qu.:29.04   1st Qu.:28.96   1st Qu.:0.0535   1st Qu.:-0.00160   1st Qu.:0.9782  
 Median :29.82   Median :29.75   Median :0.0595   Median : 0.00090   Median :0.9870  
 Mean   :29.84   Mean   :29.78   Mean   :0.0586   Mean   :-0.00068   Mean   :1.0080  
 3rd Qu.:30.43   3rd Qu.:30.38   3rd Qu.:0.0685   3rd Qu.: 0.00130   3rd Qu.:1.0299  
 Max.   :31.06   Max.   :31.00   Max.   :0.0694   Max.   : 0.00150   Max.   :1.0803  
                                                                                     
  AFDM.sample        AFDM.leaf           dry.bulk  
 Min.   :0.04060   Min.   :0.002030   Min.   : NA  
 1st Qu.:0.05510   1st Qu.:0.002755   1st Qu.: NA  
 Median :0.05820   Median :0.002910   Median : NA  
 Mean   :0.05928   Mean   :0.002964   Mean   :NaN  
 3rd Qu.:0.06850   3rd Qu.:0.003425   3rd Qu.: NA  
 Max.   :0.07400   Max.   :0.003700   Max.   : NA  
                                      NAs   :5   
~~~~
 
 
### Calculate the mass of organic matter in the microcosms
 
The volume of slurry added to each of the microcosms was 150 ml in the leached litter experiment, so the sediment mass of the bottles is summarized as:
 
    summary(loi$dry.bulk * 150)

~~~~
 Sediment mass in the bottles (g)

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
  24.45   24.73   25.01   36.22   42.10   59.19       5 

~~~~
 
The range of sediment organic matter mass can be estimated as:
 
    summary((loi$dry.bulk[loi$sample == "sed"] * 150) * (loi$propOM[loi$sample == "sed"]))

~~~~
 Summary of the mass of OM in the sediments (g)

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  4.074   4.133   4.191   4.167   4.213   4.236 

~~~~
### Calculate the mass of leaf litter in the microcosms
 
    Each microcosm contained 20 leaf discs so the mass of the added leaves is simply the mass of the 20 leaves

    loi$AFDM.sample[loi$sample == "leaf"]

~~~~
Mass of 20 leached leaf discs

[1] 0.0582 0.0685 0.0551 0.0740 0.0406

~~~~
 
The surface area of the sediments in the microcosms is 0.00353 m2 [ref](//github.com/KennyPeanuts/CPOM_Flux/blob/master/lab_notebook/analysis/CPOM_flux_BOD_OM_input_calc_6Jun2014.md) so the mass per m^2 would be:
 
    loi$AFDM.sample[loi$sample == "leaf"] / 0.00353

~~~~
Mass of CPOM added to each bottle (g/m2)

[1] 16.48725 19.40510 15.60907 20.96317 11.50142

~~~~


