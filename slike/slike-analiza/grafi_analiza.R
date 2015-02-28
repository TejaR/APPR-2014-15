pdf("slike/grafi_analiza.pdf",paper="a4")

#stanovanja na prebivalca
barplot(as.matrix(leta)/as.matrix(prebivalstvo), names.arg = 2008:2013,
        main="Stanovanja na prebivalca med leti 2008 in 2013",
        beside = TRUE, legend = rownames(prebivalstvo),xlab = "Leto",
        args.legend = c(cex = 0.7), col = rainbow(12))

#stanovanja na prebivalca v Sloveniji
barplot(as.matrix(leta[5,])/as.matrix(prebivalstvo[4,]), names.arg = 2008:2013,
        main="Stanovanja na prebivalca v Sloveniji med leti 2008 in 2013",
        beside = TRUE, legend = rownames("Slovenija"),xlab = "Leto",
        args.legend = c(cex = 0.7), col = rainbow(1))

dev.off()