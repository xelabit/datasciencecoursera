# List of variables
  ## Data frames
	* X_test -- test set;
	* features -- list of all features;
	* X_train -- training set;
	* y_test -- test labels (type of activity);
	* y_train -- training labels;
	* subject_test, subject_train -- each row identifies the subject who
	  performed the activity for each window sample. Its range is from 1 to 30
  ## Other variables
	* valid_column_names_test, valid_column_names_train -- a 561-length vector
	  based on features data frame but with corrected names (which do not
	  violate R rules), values of these vectors will then be set as names of
	  variables of X_test and X_train data frames respectively;
	* y_te, y_tr -- vectors derived from y_test and y_train respectively;
	* test, train -- data frames wich contain selected columns as described in
	  a code book. Use function "select" from dplyr package to select columns.
	  Use mutate function from the same function to add "activity" and
	  "subject" variables. 
    * sub_te, sub_tr -- vectors derived from subject_test and subject_train
	  respectively;
	* all_together -- test and train data frames bind. Use function "row_bind"
	  from dplyr package.
	* outMelt -- melt object derived from all_together
	* outCast -- a final data frame as required in step 5 
# Melting
	In function melt parameter measure.vals is equal to
	names(all_together)[2:58]. I used such indices because there are 59 total
	variables in all_together data frame, where the first variable is
	"activity" and the 59th is "subject". We do not need their mean values.