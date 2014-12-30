pdf("slike/grafi.pdf",paper="a4")

#leta
barplot(as.matrix(leta), names.arg = 2008:2013,
        beside = TRUE, legend = rownames(13),
        args.legend = c(cex = 0.7), col = rainbow)

#investitorji
oznake <- rownames(invest)
oznake[8] <- "Jugovzhodna\nSlovenija"
barplot(apply(invest[-1,], 1, c), beside = TRUE, names.arg = oznake[-1], las = 2,
        legend = c("Novogradnja", "Povečava", "Sprememba namembnosti"), cex.names = 0.6)

dev.off()