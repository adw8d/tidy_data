Codebook
========

The raw dataset includes the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

For the purposes of the analysis, the run_analysis.R script produces the following datasets:

- xtrain: Shows all of the movement data for the participants in the Training set
- xtest: Shows all of the movement data for the participants in the Testing set
- ytrain: Includes the movement performed for each record of the Training dataset
- ytest: Includes the movement performed for each record of the Testing dataset
- subject_train: Includes the subject identifier for the Training Dataset
- subject_test: Includes the subject identifer for the Testing Dataset
- Activity Labels: The key for decoding the ytrain and ytest datasets with the label for each activity
- Features: the key for decoding the xtrain and xtest datasets with the label for each of the variable values

The run_analysis.R script results in a tidy summary dataset that shows the mean for each participant (n=30) and each movement (n=6) for each variable involving mean and standard deviation (n=79).



