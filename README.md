How to run the analysis script
====================

The following are pre-requisites to run the analysis script. 

1. The raw data in zip format is downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. The zip file is extracted to "UCI HAR Dataset" in the working directory
3. Analysis script (run_analysis) is downloaded to the working directory

After the files have been downloaded, the analysis script can be run using the command from r console.

<pre>
    <code>source("run_analysis.R")</code>
</pre>

After the script finishes execution, the file "tidyData.txt" containing the tidy data is saved to working directory.