# Analysis of the Ergosterol Data from the CPOM Flux Experiment

### Import Data

    ergo <- read.table("./data/CPOM_Flux_Ergo.csv", header = T, sep = ",")

### Simple Plots - Just playing around
    
    plot(fungal_mass_per_OM ~ as.numeric(CPOM), data = ergo, subset = samp == "sed", ylim = c(0, 15), xlim = c(0, 3), axes = F)
    axis(2)
    text(1, 0.5, "+ Leaves")
    text(2, 0.5, "- Leaves")
    
    
    
    plot(fungal_mass ~ as.numeric(CPOM), data = ergo, subset = samp == "sed", ylim = c(0, 0.3), xlim = c(0, 3), axes = F)
    text(1, 0.05, "+ Leaves")
    text(2, 0.05, "- Leaves")
    axis(2)
    
    plot(fungal_mass ~ as.numeric(CPOM), data = ergo, subset = samp == "leaf", ylim = c(0, 0.3))

    plot(fungal_mass ~ as.numeric(nutrients), data = ergo, subset = samp == "leaf", ylim = c(0, 0.3))

    
   boxplot(ergo$fungal_mass[ergo$samp == "leaf"],  ergo$fungal_mass[ergo$samp == "sed"], ylim = c(0, 0.3))
    text(1, 0.02, "leaf")
    text(2, 0.02, "sed")

   boxplot(ergo$fungal_mass_per_OM[ergo$samp == "leaf"],  ergo$fungal_mass_per_OM[ergo$samp == "sed"], ylim = c(0, 50), axes = F) 
    text(1, 0.05, "leaf")
    text(2, 0.05, "sed")
    axis(2)
    

    
   t.test(ergo$fungal_mass[ergo$samp == "leaf"],  ergo$fungal_mass[ergo$samp == "sed"])
    
   boxplot(sqrt(ergo$fungal_mass[ergo$samp == "leaf"]),  sqrt(ergo$fungal_mass[ergo$samp == "sed"]))
    
   stem(ergo$fungal_mass[ergo$samp == "leaf"])
    
    
   stem(ergo$fungal_mass[ergo$samp == "sed"])

    