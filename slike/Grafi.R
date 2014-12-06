pdf("slike/grafi.pdf",paper="a4")

#investitorji
barplot(apply(invest[-1,], 1, c), beside = TRUE, las = 2, legend = c("Pravne osebe", "Fizične osebe"), fileEncoding="UTF-8")