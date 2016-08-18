# Analysis of the Organic Content of the Microcosma from the leached litter SOD exp 

## Spring 2016

## Metadata

* Code created 8 Aug 2016

* Modified 18 Aug 2016 - KF - significantly revised to include the data from the end of the leached litter SOD experiment.

## Purpose

This code analyzes the LOI data from the initial organic matter added to the microcosms in the Spring Leached Litter experiment and from the conclusion of the experiment

## Code
### Import Data

    loi <- read.table("./data/leached_litter_Spring_LOI_sp2016.csv", header = T, sep = ",")

### Summary Statistics
#### Initial Sediment Samples

 
    summary(loi[loi$sample == "sed" & loi$time == "init",])

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
 
##### Initial Leaf Samples  
   
    summary(loi[loi$sample == "leaf" & loi$time == "init",])

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
 
 
### Calculate the initial mass of organic matter in the microcosms
 
The volume of slurry added to each of the microcosms was 150 ml in the leached litter experiment, so the sediment mass of the bottles is summarized as:
 
    summary(loi$dry.bulk[loi$time == "init"] * 150)

~~~~
 Sediment mass in the bottles (g)

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs 
  24.45   24.73   25.01   36.22   42.10   59.19       5 

~~~~
 
The range of initial sediment organic matter mass can be estimated as:
 
    summary((loi$dry.bulk[loi$sample == "sed" & loi$time == "init"] * 150) * (loi$propOM[loi$sample == "sed" & loi$time == "init"]))

~~~~
 Summary of the mass of OM in the sediments (g)

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  4.074   4.133   4.191   4.167   4.213   4.236 

~~~~
### Calculate the initial mass of leaf litter in the microcosms
 
    Each microcosm contained 20 leaf discs so the mass of the added leaves is simply the mass of the 20 leaves

    loi$AFDM.sample[loi$sample == "leaf" & loi$time == "init"]

~~~~
Mass of 20 leached leaf discs

[1] 0.0582 0.0685 0.0551 0.0740 0.0406

~~~~
 
The surface area of the sediments in the microcosms is 0.00353 m2 [ref](//github.com/KennyPeanuts/CPOM_Flux/blob/master/lab_notebook/analysis/CPOM_flux_BOD_OM_input_calc_6Jun2014.md) so the mass per m^2 would be:
 
    loi$AFDM.sample[loi$sample == "leaf" & loi$time == "init"] / 0.00353

~~~~
Mass of CPOM added to each bottle (g/m2)

[1] 16.48725 19.40510 15.60907 20.96317 11.50142

~~~~

## Final Samples
 
This is the organic matter of the samples after the conclusion of the experiment

### Final Sediment Summary

    summary(loi[loi$time == "final" & loi$sample == "sed", ])

~~~~
Summary of the Final LOI data for the sediments from the leached litter SOD exp.

    time         bod        treatment  sample      leaf.num      sed.vol     
 final:10   Min.   : 1.00   LS:5      leaf: 0   Min.   : NA   Min.   :0.800  
 init : 0   1st Qu.: 3.25   S :5      sed :10   1st Qu.: NA   1st Qu.:1.000  
            Median : 5.50                       Median : NA   Median :1.100  
            Mean   : 5.50                       Mean   :NaN   Mean   :1.070  
            3rd Qu.: 7.75                       3rd Qu.: NA   3rd Qu.:1.175  
            Max.   :10.00                       Max.   : NA   Max.   :1.300  
                                                NAs   :10                   
      cruc         cruc.mass        cruc.sed        cruc.ash        sed.mass     
 Min.   : 6.00   Min.   :26.99   Min.   :27.19   Min.   :27.15   Min.   :0.1465  
 1st Qu.:10.00   1st Qu.:28.83   1st Qu.:29.02   1st Qu.:28.98   1st Qu.:0.1696  
 Median :15.50   Median :29.05   Median :29.24   Median :29.21   Median :0.1898  
 Mean   :15.50   Mean   :29.15   Mean   :29.34   Mean   :29.31   Mean   :0.1904  
 3rd Qu.:20.75   3rd Qu.:29.65   3rd Qu.:29.82   3rd Qu.:29.79   3rd Qu.:0.2014  
 Max.   :24.00   Max.   :31.52   Max.   :31.72   Max.   :31.68   Max.   :0.2620  
                                                                                 
    ash.mass          propOM        AFDM.sample        AFDM.leaf      dry.bulk     
 Min.   :0.1193   Min.   :0.1693   Min.   :0.02720   Min.   : NA   Min.   :0.1487  
 1st Qu.:0.1385   1st Qu.:0.1770   1st Qu.:0.03365   1st Qu.: NA   1st Qu.:0.1680  
 Median :0.1548   Median :0.1865   Median :0.03605   Median : NA   Median :0.1782  
 Mean   :0.1549   Mean   :0.1875   Mean   :0.03551   Mean   :NaN   Mean   :0.1782  
 3rd Qu.:0.1618   3rd Qu.:0.1963   3rd Qu.:0.03660   3rd Qu.: NA   3rd Qu.:0.1849  
 Max.   :0.2165   Max.   :0.2101   Max.   :0.04550   Max.   : NA   Max.   :0.2183  
                                                     NAs   :10  

~~~~

#### Comparison of Treatment Final Sediment LOI 
#### Sediment Only

    summary(loi[loi$sample == "sed" & loi$time == "final" & loi$treatment == "S", 6:16])

~~~~
Summary of LOI Data for the Sediments in the sediment - only treatment at the end of the leached litter SOD exp.

    sed.vol          cruc        cruc.mass        cruc.sed        cruc.ash    
 Min.   :0.90   Min.   : 6.0   Min.   :26.99   Min.   :27.19   Min.   :27.15  
 1st Qu.:1.10   1st Qu.:15.0   1st Qu.:28.87   1st Qu.:29.03   1st Qu.:29.00  
 Median :1.20   Median :16.0   Median :29.14   Median :29.35   Median :29.32  
 Mean   :1.14   Mean   :16.2   Mean   :29.18   Mean   :29.39   Mean   :29.35  
 3rd Qu.:1.20   3rd Qu.:20.0   3rd Qu.:29.40   3rd Qu.:29.66   3rd Qu.:29.62  
 Max.   :1.30   Max.   :24.0   Max.   :31.52   Max.   :31.72   Max.   :31.68  
                                                                              
    sed.mass         ash.mass          propOM        AFDM.sample        AFDM.leaf  
 Min.   :0.1599   Min.   :0.1263   Min.   :0.1693   Min.   :0.03360   Min.   : NA  
 1st Qu.:0.1933   1st Qu.:0.1566   1st Qu.:0.1737   1st Qu.:0.03630   1st Qu.: NA  
 Median :0.2041   Median :0.1636   Median :0.1899   Median :0.03670   Median : NA  
 Mean   :0.2067   Mean   :0.1682   Mean   :0.1883   Mean   :0.03852   Mean   :NaN  
 3rd Qu.:0.2144   3rd Qu.:0.1781   3rd Qu.:0.1984   3rd Qu.:0.04050   3rd Qu.: NA  
 Max.   :0.2620   Max.   :0.2165   Max.   :0.2101   Max.   :0.04550   Max.   : NA  
                                                                      NAs   :5    
    dry.bulk     
 Min.   :0.1487  
 1st Qu.:0.1777  
 Median :0.1787  
 Mean   :0.1818  
 3rd Qu.:0.1855  
 Max.   :0.2183 
 
~~~~~

#### Sediment and Leaves

    summary(loi[loi$sample == "sed" & loi$time == "final" & loi$treatment == "LS", 6:16])

~~~~
Summary of LOI Data for the Sediments in the sediment and leaf treatment at the end of the leached litter SOD exp.

   sed.vol         cruc        cruc.mass        cruc.sed        cruc.ash    
 Min.   :0.8   Min.   : 8.0   Min.   :27.08   Min.   :27.26   Min.   :27.22  
 1st Qu.:1.0   1st Qu.: 9.0   1st Qu.:28.82   1st Qu.:29.01   1st Qu.:28.97  
 Median :1.0   Median :13.0   Median :28.97   Median :29.13   Median :29.11  
 Mean   :1.0   Mean   :14.8   Mean   :29.12   Mean   :29.29   Mean   :29.26  
 3rd Qu.:1.1   3rd Qu.:21.0   3rd Qu.:29.73   3rd Qu.:29.87   3rd Qu.:29.85  
 Max.   :1.1   Max.   :23.0   Max.   :31.01   Max.   :31.20   Max.   :31.16  
                                                                             
    sed.mass         ash.mass          propOM        AFDM.sample       AFDM.leaf  
 Min.   :0.1465   Min.   :0.1193   Min.   :0.1758   Min.   :0.0272   Min.   : NA  
 1st Qu.:0.1672   1st Qu.:0.1378   1st Qu.:0.1805   1st Qu.:0.0294   1st Qu.: NA  
 Median :0.1768   Median :0.1407   Median :0.1857   Median :0.0338   Median : NA  
 Mean   :0.1740   Mean   :0.1415   Mean   :0.1867   Mean   :0.0325   Mean   :NaN  
 3rd Qu.:0.1873   3rd Qu.:0.1535   3rd Qu.:0.1873   3rd Qu.:0.0360   3rd Qu.: NA  
 Max.   :0.1922   Max.   :0.1562   Max.   :0.2042   Max.   :0.0361   Max.   : NA  
                                                                     NA's   :5    
    dry.bulk     
 Min.   :0.1607  
 1st Qu.:0.1672  
 Median :0.1703  
 Mean   :0.1747  
 3rd Qu.:0.1831  
 Max.   :0.1922  
 
 ~~~~

### Summary of Final Leaf LOI
 
    summary(loi[loi$time == "final" & loi$sample == "leaf", ])

~~~~
Summary of the LOI data of the leaves at the conclusion of the leached litter SOD exp.

    time        bod      treatment  sample     leaf.num     sed.vol         cruc     
 final:5   Min.   :1.0   LS:5      leaf:5   Min.   :20   Min.   : NA   Min.   : 1.0  
 init :0   1st Qu.:2.0   S :0      sed :0   1st Qu.:20   1st Qu.: NA   1st Qu.: 4.0  
           Median :4.0                      Median :20   Median : NA   Median : 5.0  
           Mean   :4.4                      Mean   :20   Mean   :NaN   Mean   : 7.6  
           3rd Qu.:7.0                      3rd Qu.:20   3rd Qu.: NA   3rd Qu.:10.0  
           Max.   :8.0                      Max.   :20   Max.   : NA   Max.   :18.0  
                                                         NAs   :5                   
   cruc.mass        cruc.sed        cruc.ash        sed.mass          ash.mass      
 Min.   :27.49   Min.   :27.52   Min.   :27.49   Min.   :0.03260   Min.   :0.00260  
 1st Qu.:29.44   1st Qu.:29.48   1st Qu.:29.45   1st Qu.:0.03300   1st Qu.:0.00270  
 Median :29.74   Median :29.77   Median :29.74   Median :0.03920   Median :0.00340  
 Mean   :29.36   Mean   :29.40   Mean   :29.37   Mean   :0.04162   Mean   :0.00604  
 3rd Qu.:29.75   3rd Qu.:29.81   3rd Qu.:29.76   3rd Qu.:0.04620   3rd Qu.:0.00960  
 Max.   :30.38   Max.   :30.42   Max.   :30.38   Max.   :0.05710   Max.   :0.01190  
                                                                                    
     propOM        AFDM.sample        AFDM.leaf           dry.bulk  
 Min.   :0.7424   Min.   :0.02990   Min.   :0.001495   Min.   : NA  
 1st Qu.:0.8319   1st Qu.:0.03040   1st Qu.:0.001520   1st Qu.: NA  
 Median :0.9133   Median :0.03430   Median :0.001715   Median : NA  
 Mean   :0.8652   Mean   :0.03558   Mean   :0.001779   Mean   :NaN  
 3rd Qu.:0.9172   3rd Qu.:0.03580   3rd Qu.:0.001790   3rd Qu.: NA  
 Max.   :0.9212   Max.   :0.04750   Max.   :0.002375   Max.   : NA  
                                                       NAs   :5  

~~~~
 
## Change in Leaf AFDM
 
    init.leaf.mean <- mean(loi$AFDM.leaf[loi$time == "init" & loi$sample == "leaf"])

    mass.loss <- init.leaf.mean - loi$AFDM.leaf[loi$time == "final" & loi$sample == "leaf"]
    perc.mass.rem <- (1 - (mass.loss / init.leaf.mean)) * 100

### Summary by Treatment

    summary(perc.mass.rem)
    sd(perc.mass.rem)

~~~~
Summary of the percent of the mean initial leaf mass remaining at the end of the leached litter SOD experiment

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.  SD
  50.44   51.28   57.86   60.02   60.39   80.13  12.01347

~~~~
 
 