# Prediction Assignment Write up for Practical Machine Learning

###The goal of this project is to use machine learning to predict the qualitative activity recognition of weight lifting exercises (the classes) from research activity recognition data hosted at <http://groupware.les.inf.puc-rio.br/har>. Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. The data was collected from six participants, where class A represents the correct execution of the exercise, and the remaining five classes (B-E) are considered to have mistakes in the execution of the exercise.  

###The analysis uses two different learners, one fast ( **Random Forrest**), and one slow (**Extream Graident Boosting** ) with the intent to combine predictors if they both do not perform optimally.

# Conclusion

###Both models were tested against the testing set, and the results were submitted to validate the models out of sample predictions capability. The Kappa statistic is a metric that compares an observed accuracy with an expected accuracy by taking into account random chance. The Kappa value of 1 lets us know that both models performed perfectly on the training sets.  Because multiple cross validation was selected, the out of error rate is expected to be 0%$<x$<1% as the accuracy of the models are 100%.