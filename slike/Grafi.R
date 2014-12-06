pdf("slike/grafi.pdf",paper="a4")

#leta
barplot(as.matrix(leta), beside = TRUE, las = 2)

#investitorji
barplot(apply(invest[-1,], 1, c), beside = TRUE, las = 2, legend = c("Pravne osebe", "Fizične osebe"))