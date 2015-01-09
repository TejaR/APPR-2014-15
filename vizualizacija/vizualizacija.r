# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
#source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
#cat("Uvažam zemljevid...\n")
#obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
#                          "obcine", "OB/OB.shp", mapa = "zemljevid",
#                          encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
#preuredi <- function(podatki, zemljevid) {
#  nove.obcine <- c()
#  manjkajo <- ! nove.obcine %in% rownames(podatki)
#  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
#  names(M) <- names(podatki)
#  row.names(M) <- nove.obcine[manjkajo]
#  podatki <- rbind(podatki, M)
  
#  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$OB_UIME)[rank(zemljevid$OB_UIME)]), ]
#  if (ncol(podatki) == 1) {
#    out <- data.frame(out)
#    names(out) <- names(podatki)
#    rownames(out) <- rownames(podatki)
#  }
#  return(out)
#}

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
#druzine <- preuredi(druzine, obcine)

# Izračunamo povprečno velikost družine.
#druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
#min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
#max.povprecje <- max(druzine$povprecje, na.rm=TRUE)

# Narišimo zemljevid v PDF.
#cat("Rišem zemljevid...\n")
#pdf("slike/povprecna_druzina.pdf", width=6, height=4)

#n = 100
#barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
#plot(obcine, col = barve)

#dev.off()


# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
regije <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                          "regije", "SVN_adm1.shp", mapa = "zemljevid",
                          encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
zemljevid.leta <- leta[as.character(regije$NAME_1), ]

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
invest <- invest[as.character(regije$NAME_1), ]

koordinate <- coordinates(regije)
rownames(koordinate) <- as.character(regije$NAME_1) # za lažje indeksiranje
# premaknemo po osi x
koordinate["Jugovzhodna Slovenija", 1] <- koordinate["Jugovzhodna Slovenija", 1] - 0.05
# premaknemo po osi y
koordinate["Obalno-kraška", 2] <- koordinate["Obalno-kraška", 2] - 0.1

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid slovenije...\n")
pdf("slike/regije1.pdf")

# Izračunamo povprečno število stanovanj.
invest$povprecje <- apply(invest, 1, function(x) mean(x))
min.povprecje <- min(invest$povprecje, na.rm=TRUE)
max.povprecje <- max(invest$povprecje, na.rm=TRUE)
norm.povprecje <- (invest$povprecje-min.povprecje)/(max.povprecje-min.povprecje)

n = 100
barve =rgb(1, 1, (n:1)/n)[unlist(1+(n-1)*norm.povprecje)]
plot(regije, col = barve,bg="lightblue")
text(coordinates(regije),labels=as.character(regije$NAME_1),cex=0.5)
title("Povprečno število stanovanj po regijah")
LJUBLJANA <- regije$VARNAME_1 == "Ljubljana"
points(coordinates(regije), pch = ifelse(LJUBLJANA, 18, 0), cex = ifelse(LJUBLJANA, 0.5 ,0), col = ifelse(LJUBLJANA, "red", "white"))


dev.off()

pdf("slike/regije2.pdf")
regije$stanovanja2008 <- zemljevid.leta[,3]
print(spplot(regije, "stanovanja2008", col.regions  = topo.colors(50),
             main = "Število stanovanj po regijah (leto 2008)",
             sp.layout = list(list("sp.text", coordinates(regije),as.character(regije$NAME_1), cex = 0.5))))
dev.off()

pdf("slike/regije3.pdf")
regije$stanovanja2011 <- zemljevid.leta[,6]
print(spplot(regije, "stanovanja2011", col.regions  = topo.colors(50),
             main = "Število stanovanj po regijah (leto 2011)",
             sp.layout = list(list("sp.text", coordinates(regije),as.character(regije$NAME_1), cex = 0.5))))
dev.off()

pdf("slike/regije4.pdf")
regije$stanovanja2013 <- zemljevid.leta[,"X2013"]
print(spplot(regije, "stanovanja2013", col.regions  = topo.colors(50),
             main = "Število stanovanj po regijah (leto 2013)",
             sp.layout = list(list("sp.text", coordinates(regije),as.character(regije$NAME_1), cex = 0.5))))
dev.off()

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
slo <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                          "slovenija", "SVN_adm1.shp", mapa = "zemljevid",
                          encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
zemljevid.prebivalstvo <- prebivalstvo[as.character(slo$NAME_1), ]

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
prebivalstvo <- prebivalstvo[as.character(slo$NAME_1), ]

koordinate <- coordinates(regije)
rownames(koordinate) <- as.character(regije$NAME_1) # za lažje indeksiranje
# premaknemo po osi x
koordinate["Jugovzhodna Slovenija", 1] <- koordinate["Jugovzhodna Slovenija", 1] - 0.05
# premaknemo po osi y
koordinate["Obalno-kraška", 2] <- koordinate["Obalno-kraška", 2] - 0.1

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid slovenije...\n")
pdf("slike/prebivalstvo1.pdf")

# Izračunamo povprečno število stanovanj.
prebivalstvo$povprecje <- apply(prebivalstvo, 1, function(x) mean(x))
min.povprecje <- min(prebivalstvo$povprecje, na.rm=TRUE)
max.povprecje <- max(prebivalstvo$povprecje, na.rm=TRUE)
norm.povprecje <- (prebivalstvo$povprecje-min.povprecje)/(max.povprecje-min.povprecje)

n = 100
barve =rgb(1, 1, (n:1)/n)[unlist(1+(n-1)*norm.povprecje)]
plot(slo, col = barve,bg="lightblue")
text(koordinate,labels=as.character(regije$NAME_1),cex=0.5)
title("Povprečno število prebivalcev po regijah")
LJUBLJANA <- slo$VARNAME_1 == "Ljubljana"
points(coordinates(slo), pch = ifelse(LJUBLJANA, 18, 0), cex = ifelse(LJUBLJANA, 0.5 ,0), col = ifelse(LJUBLJANA, "red", "white"))

dev.off()

pdf("slike/prebivalstvo2.pdf")
slo$prebivalstvo2008 <- zemljevid.prebivalstvo[,3]
print(spplot(regije, "stanovanja2008", col.regions  = topo.colors(50),
             main = "Število stanovanj po regijah (leto 2008)",
             sp.layout = list(list("sp.text", koordinate,as.character(regije$NAME_1), cex = 0.5))))
dev.off()

pdf("slike/prebivalstvo3.pdf")
slo$prebivalstvo2011 <- zemljevid.prebivalstvo[,6]
print(spplot(slo, "prebivalstvo2011", col.regions  = topo.colors(50),
             main = "Število prebivalcev po regijah (leto 2011)",
             sp.layout = list(list("sp.text", koordinate,as.character(regije$NAME_1), cex = 0.5))))
dev.off()

pdf("slike/prebivalstvo4.pdf")
slo$prebivalstvo2013 <- zemljevid.prebivalstvo[,8]
print(spplot(slo, "prebivalstvo2013", col.regions  = topo.colors(50),
             main = "Število prebivalcev po regijah (leto 2013)",
             sp.layout = list(list("sp.text", koordinate,as.character(regije$NAME_1), cex = 0.5))))
dev.off()




