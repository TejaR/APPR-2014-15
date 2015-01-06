# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
#uvoziDruzine <- function() {
#  return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                      row.names = 1,
#                      col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                      fileEncoding = "Windows-1250"))
#}
# Zapišimo podatke v razpredelnico druzine.
#cat("Uvažam podatke o družinah...\n")
#druzine <- uvoziDruzine()


#Tabela 1:
uvoziPoLetih <- function(){
  return(read.table("podatki/PoLetih.csv", sep = ";", as.is = TRUE,
                    row.names = 3,
                    col.names = c(rep("", 3), 2008:2013),
                    skip = 4, header = FALSE,
                    fileEncoding = "UTF-8")[c(-1, -2)])
}

cat("Uvažam letne podatke o stanovanjah (tabela 1)\n")
leta <- uvoziPoLetih()

#Tabela 2:
uvoziPoInvestitorjih <- function(){
  return(read.table("podatki/PoInvestitorjih.csv", sep = ";", as.is = TRUE,
                    row.names = 2,
                    col.names = c(rep("", 2), "Pravna oseba", "Fizična oseba"),
                    skip = 4, header = FALSE,
                    fileEncoding = "UTF-8")[c(-1)])
}

cat("Uvažam podatke o stanovanjih po investitorjih (tabela 2)\n")
invest <- uvoziPoInvestitorjih()

#Tabela 3
source("lib/xml.r", encoding="UTF-8")
cat("Uvažam podatke o stanovanjih po načinu izgradnje (tabela 3)\n")
nacin <- uvozi.nacin()

#Tabela 4
uvoziPrebivalstvo <- function(){
  return(read.table("podatki/prebivalstvo_po_regijah.csv", sep = ";", as.is = TRUE,
                    row.names = 1,
                    col.names = c(rep("", 1), "2008H1", "2008H2", "2009H1", "2009H2", "2010H1", "2010H2", "2011H1", "2011H2", "2012H1", "2012H2", "2013H1", "2013H2", "2014H1", "2014H2"),
                    skip = 3, header = FALSE,
                    fileEncoding = "UTF-8"))
}

cat("Uvažam letne podatke o prebivalstvu po regijah (tabela 4)\n")
prebivalstvo <- uvoziPrebivalstvo()






# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.