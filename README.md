# JHU_DS_GETCLEAN_course_project 
Course project for course 3 of the Johns Hopkins University Data Science Specialization: Getting and Cleaning Data

<h2>The project directory contains:</h2>

<p>
run_analysis.R --> this is the primary script to complete the project
<p>
README.md --> you're reading me now
<p>
CodeBook.Rmd --> a pdf markdown file that goes over the general process with which I approached the project
<p>
JHU_DS_GETCLEAN_course_project -->R Studio project file
<p>
run_analyis_audit.R --> This an EXTRA file and is not required to complete the steps as required by the project.
This script merely audits the project script to ensure the data compilation is sound. 
<p>
fulldataset_avgerages_byactivtity.txt --> output file for 2nd tidy data set required in project. 
<p>
Sub directories:
dataset --> contains the data sets downloaded from project web site. These are unaltered. See README.txt in 
that sub directory for more information the contents

<h2>Short-hand explanation of project:</h2>
Take the datasets of dataset subdirectory and merge them into one.  Match the descriptive variable namse from features/feature_info files into this merged dataset. Match the activities to the activty_labels. 

<h2>Long-hand explanation:
PROJECT INSTRUCTIONS:
====================</h2>
<p>
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
<p>
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
<p>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
<p>
Here are the data for the project:
<p>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
<p>
You should create one R script called run_analysis.R that does the following.
<p>
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
=====================

<p>
Please see the CodeBook.Rmd file for details on my approach to the project.<BR>
Please see the comments of R Script "run_analysis.R" for further details.<BR>
