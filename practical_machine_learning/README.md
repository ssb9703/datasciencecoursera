# This is a list of reports where I applied machine learning to public data sets to gain a better understanding of building prediction models.

##Prediction Assignment Write up for Practical Machine Learning

### Summary
The goal of this project is to use machine learning to predict the qualitative activity recognition of weight lifting exercises (the classes) from research activity recognition data hosted at <http://groupware.les.inf.puc-rio.br/har>. Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. The data was collected from six participants, where class A represents the correct execution of the exercise, and the remaining five classes (B-E) are considered to have mistakes in the execution of the exercise.  

The analysis uses two different learners, one fast ( **Random Forrest**), and one slow (**Extream Graident Boosting** ) with the intent to combine predictors if they both do not perform optimally.

### Conclusion

Both models were tested against the testing set, and the results were submitted to validate the models out of sample predictions capability. The Kappa statistic is a metric that compares an observed accuracy with an expected accuracy by taking into account random chance. The Kappa value of 1 lets us know that both models performed perfectly on the training sets.  Because multiple cross validation was selected, the out of error rate is expected to be 0%$<x$<1% as the accuracy of the models are 100%.

## AIDS Antiviral Screen Data Set

### Summary
The goal of this project is to use machine learning to predict the results of Development Therapeutics Program (DTP) AIDS Antiviral Screening data that is publicly available. Namely, the DTP provides services and data to facilitate the discovery and development of new therapeutic agents. Moreover, this report documents both the predictive power of the model and all corresponding data used for the analysis in an effort to identify effective therapeutic agents for treating patients with AIDS and/or cancer.

The NIH website hosting the data is located at https://wiki.nci.nih.gov/display/NCIDTPdata/AIDS+Antiviral+Screen+Data, and the May 2004 data can be found at https://wiki.nci.nih.gov/pages/viewpageattachments.action?pageId=158204006&metadataLink=true. The target classes for prediction are:

    CA - Confirmed active
    CM - Confirmed moderately active
    CI - Confirmed inactive

### Conclusion
Using a rule-based algorithm (C5.0) and cross-validation, the statistics of the model chosen has an accuracy of 96.23% (95% CI of .9589- .9656), and a Kappa value of .7645. Lastly, the analysis uncovered that high EC50 concentrations can be used to indicate a drug’s potency and classification.