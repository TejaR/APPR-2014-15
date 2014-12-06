pdf("slike/grafi.pdf",paper="a4")

#leta
barplot(as.matrix(leta), beside = TRUE, las = 2, legend = c("SLOVENIJA", "Pomurska", "Podravska", "Koroška", "Savinjska", "Zasavska", "Spodnjeposavska", "Jugovzhodna Slovenija", "Osrednjeslovenska", "Gorenjska", "Notranjsko-kraška", "Goriška", "Obalno-kraška"))

#investitorji
barplot(apply(invest[-1,], 1, c), beside = TRUE, las = 2, legend = c("Pravne osebe", "Fizične osebe"))