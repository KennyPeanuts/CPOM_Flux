# This is a test of the sorting code for the vial volumes in the SOD calculations

## Purpose

This code will (if it works) replace the vial number with its volume from the data frame containing the numbers and volumes

## Test Data

    vial <- 1:10
    vol <- sample(90:99, 10, repl = T)
    vols <- data.frame(vial, vol)

## Sort Code

    vial <- c(3, 5, 9)
    bod <- 1:3
    Rf <- 4:6
    test <- data.frame(bod, vial, Rf)

    test.vol <- merge(test, vols, by.x = "vial", by.y = "vial")    
