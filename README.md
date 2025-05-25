# GettingAndCleaningDataProject
Coursera course project for Getting and Cleaning Data
# Getting and Cleaning Data Course Project

## Overview

This project is part of the Coursera *Getting and Cleaning Data* course. It uses data from the [UCI Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The goal is to clean and tidy the raw dataset so it can be used for later analysis. The output is a tidy data set containing the **average of each measurement for each activity and each subject**.

## Files in This Repo

- `run_analysis.R`: R script that performs all data cleaning and transformation.
- `CodeBook.md`: Describes the variables and data used in the analysis.
- `tidy_dataset.txt`: The final tidy data output.

## How to Run

1. Download and unzip the dataset from:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Set your R working directory to the folder named `UCI HAR Dataset`.

3. Run the script:

```r
source("run_analysis.R")
