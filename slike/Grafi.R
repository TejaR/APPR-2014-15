pdf("slike/grafi.pdf",paper="a4")

#leta
barplot(as.matrix(leta), names.arg = 2008:2013, main="Gradnja stanovanj, med leti 2008 in 2013",
        beside = TRUE, legend = rownames(leta),xlab = "Leto",
        args.legend = c(cex = 0.7), col = rainbow(12))

#investitorji
oznake <- rownames(invest)
oznake[8] <- "Jugovzhodna\nSlovenija"
barplot(apply(invest[-1,], 1, c), beside = TRUE, names.arg = oznake[-1], las = 2,
        legend = c("Pravna oseba", "Fizična oseba", "Povprečje"), cex.names = 0.6, args.legend = c(cex = 0.6))

#prebivalstvo
barplot(as.matrix(prebivalstvo)/1000, names.arg = 2008:2013,
        main="Tisoče prebivalcev, med leti 2008 in 2013",
        beside = TRUE, legend = rownames(prebivalstvo),xlab = "Leto",
        args.legend = c(cex = 0.7), col = rainbow(12))

dev.off()