print(ggplot(muss, aes(protein, fill=attach)) + geom_histogram(binwidth=1.5) + labs(title="Protein with substrate groups", x="Protein"))

