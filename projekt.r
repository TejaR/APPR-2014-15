# 2. faza: Obdelava, uvoz in čiščenje podatkov
source("uvoz/uvoz.r", encoding="UTF-8")
source("slike/Grafi.R", encoding="UTF-8")
source("lib/xml.r", encoding="UTF-8")

#3. faza: Analiza in vizualizacija podatkov
source("vizualizacija/vizualizacija.r", encoding="UTF-8")

# 4. faza: Napredna analiza podatkov
#source("analiza/analiza.r")

cat("Končano.\n")