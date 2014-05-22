Code Book 
====================

The code book describes the data, variables and transformations performed to get a tidy data set from the original data set: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Getting the raw data
The following steps are followed to get the raw data

1. The raw data in zip format is downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. The zip file is extracted to "UCI HAR Dataset" in the working directory

The raw data contained the following key variables associated to an one of 6 different activities and 30 subjects.
* Standard Deviation of measurements
* Average of measurements

### Preparing the raw data
The first step in cleaning the raw data is to merge the columnar data scattered in different raw data files into a single data frame.

The following files from the raw data in test and train folders are read as individual tables. These individual tables are then combined to create the test and train data sets.

* Measurements file 
    * This file contains 561 individual measurements recorded per row
    * The Standard.Deviation and Mean columns are calculated from the measurements and added to the measurements table
* Labels file 
    * This file contains a list of activity ids associated with the Activity.Id column for each row of measurements
* Subjects file 
    * This file contains a list of subject ids associated with the Subject.Id column for each row of measurements

The test and train data set built from each file above are then combined using row bind into a complete data set

### Cleaning the raw data
In preparation for the cleaning process. The Activity lables file from the raw data is read into a table containing the following columns.
* Activity.Id
* Activity.Name

After the preparation process above, a complete data set containg both test and train measurements with the following columns is available.
* Activity.Id
* Subject.Id
* Standard.Deviation
* Mean

The next step in cleaning process is to add descriptiors around the each activity. This is achieved by merging the complete data set with the activity labels data set on Activity.Id to create a new merged data set.


The final step in cleaning process is to run the aggregate method on the merged data set to aggregate the average values for Standard.Deviation and Mean values by the Activity.Id, Activity.Name and Subject.Id. The aggregate method results in the final tidy data set. The columns along with descriptions are shown below.

* Activity.Id
    * Identifier for the type of activity record in measurment
* Activity.Name
    * Descriptor of the specific activity
* Subject.Id
    * Identifier for the subject the measurement was made on
* Standard.Deviation
    * The average standard deviation of the measurements made on the subject for a specific activity
* Mean
    * The average mean of the measurements made on the subject for a specific activity