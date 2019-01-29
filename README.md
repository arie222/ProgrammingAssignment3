## Course 3 README
# This file describes the process used to create the finalproduct.csv tidy dataset

1. Read in all the test and training data. This includes the data with measurements, the activity number, and the subject number.
2. Column merge the 3 files for test and training data separately.
3. Row merge the full test and training data.
4. Get a full list of the column names and subset it to only those containing the string "[Mm]ean()" or "[Ss]td()"
5. Subset the full data set by this list of columns.
6. Map the activity numbers to the activity names.
7. Group the data by Subject and Activity.
8. Summarize all the columns in the grouped data using the function mean.
9. Write the newly created dataset to a .csv
