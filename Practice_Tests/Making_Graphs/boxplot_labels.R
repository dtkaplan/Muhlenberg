print(ggplot(muss, aes(attach, AvgAmmonia)) + geom_boxplot() + labs(title="Average Ammonia grouped by substrate", x="Attached to", y="Average Ammonia Produced"))

