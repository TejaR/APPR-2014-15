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
                    col.names = 2009:2013,
                    fileEncoding = "Windows-1250"))
}

cat("Uvažam letne podatke o stanovanjah (tabela 1)\n")
leta <- uvoziPoLetih()

#Tabela 2:
uvoziPoInvestitorjih <- function(){
  return(read.table("podatki/PoInvestitorjih.csv", sep = ";", as.is = TRUE,
                    row.names = 2,
                    col.names = c("Pravna oseba", "Fizična oseba"),
                    fileEncoding = "Windows-1250"))
}

cat("Uvažam podatke o stanovanjih po investitorjih (tabela 2)\n")
invest <- uvoziPoInvestitorjih()

#Tabela 3:



# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.