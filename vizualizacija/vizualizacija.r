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

# Izračunamo povprečno velikost družine.
invest$povprecje <- apply(invest, 1, function(x) mean(x))
min.povprecje <- min(invest$povprecje, na.rm=TRUE)
max.povprecje <- max(invest$povprecje, na.rm=TRUE)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid slovenije...\n")
pdf("slike/regije.pdf")



dev.off()