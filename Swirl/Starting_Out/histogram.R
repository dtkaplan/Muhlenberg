#Histograms of variables
require(mosaic)
print(histogram(~PartnerYesM|DecisionF, data=speed, fit="normal"))
#Favstats of variables
#favstats(~PartnerYesM|DecisionF, data=speed)
#qqplots
#xqqmath(~PartnerYesM|DecisionF, data=speed)