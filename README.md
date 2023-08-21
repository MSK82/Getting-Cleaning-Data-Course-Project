---
title: "README.md"
author: "Sohail"
date: "2023-08-21"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Getting & Cleaning Data Course Project

The repository contains R script, codebook and the FinalData which is the tidy dataset required for this project.

### Files:

codeBook.md 

this file provides the details of variable names and any transformations which were applied in order to the get the required tidy data.

run_anlysis.r 

This file contains the necessary scripts to perform the 5 steps required for the completion of the project.

i. Merging of the train and test datasets to create a combined dataset.
ii. Extraction of mean and standard diviation based measurements.
iii. assignment of descriptive names for the activities in the dataset.
iv. assignment of descriptive names to variable names in the dataset.
v. creation of an independent tidy dataset with mean of all variables for each activity and each subject.

FinalData.txt
This file contains the resultant data of step V.

