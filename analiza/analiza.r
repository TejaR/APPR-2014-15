# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
#source("lib/xml.r")

# Preberemo spletno stran v razpredelnico.
#cat("Uvažam spletno stran...\n")
#tabela <- preuredi(uvozi.obcine(), obcine)

# Narišemo graf v datoteko PDF.
#cat("Rišem graf...\n")
#pdf("slike/naselja.pdf", width=6, height=4)
#plot(tabela[[1]], tabela[[4]],
#     main = "Število naselij glede na površino občine",
#     xlab = "Površina (km^2)",
#     ylab = "Št. naselij")
#dev.off()

# Narišemo graf v datoteko PDF
cat("Rišem grafe Stanovanj na prebivalca...\n")
pdf("slike/slike-analiza/grafi_analiza1.pdf",paper="a4")

#stanovanja na prebivalca
barplot(as.matrix(leta)/as.matrix(prebivalstvo)[,1:6 ], names.arg = 2008:2013,
        main="Stanovanja na prebivalca med leti 2008 in 2013", xlim=c(0,95),
        beside = TRUE,xlab = "Leto", col = rainbow(13))
legend("topright", legend = rownames(prebivalstvo), fill = rainbow(12), cex = 0.7)

dev.off()
pdf("slike/slike-analiza/grafi_analiza2.pdf",paper="a4")

#stanovanja na prebivalca v Sloveniji
barplot(as.matrix(leta[1,])/as.matrix(prebivalstvo[1,1:6]), names.arg = 2008:2013,
        main="Stanovanja na prebivalca v Sloveniji med leti 2008 in 2013",
        beside = TRUE, legend = rownames("Slovenija"),xlab = "Leto",
        args.legend = c(cex = 0.7), col = rainbow(1))

dev.off()