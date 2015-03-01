cat("Rišem grafe...\n")

pdf("slike/grafi1.pdf",paper="a4")

#leta
barplot(as.matrix(leta)[2:13, ], names.arg = 2008:2013, main="Gradnja stanovanj med leti 2008 in 2013",
        beside = TRUE, legend = rownames(leta)[2:13],xlab = "Leto",
        args.legend = c(cex = 0.7), col = rainbow(12))

dev.off()

pdf("slike/grafi2.pdf",paper="a4")

#investitorji
oznake <- rownames(invest)
oznake[8] <- "Jugovzhodna\nSlovenija"
barplot(apply(invest[-1,], 1, c), beside = TRUE, names.arg = oznake[-1], las = 2,
        legend = c("Pravna oseba", "Fizična oseba", "Povprečje"), cex.names = 0.6, args.legend = c(cex = 0.6))

dev.off()

pdf("slike/grafi3.pdf",paper="a4")

#prebivalstvo
barplot(as.matrix(prebivalstvo)[2:13, ]/1000, names.arg = 2008:2013,
        main="Tisoče prebivalcev med leti 2008 in 2013",xlim=c(0,95),
        beside = TRUE, xlab = "Leto", col = rainbow(12))
legend("topright", legend = rownames(prebivalstvo)[2:13], fill = rainbow(12), cex = 0.6)

dev.off()