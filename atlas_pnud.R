library(readxl)
library(dplyr)
library(sf)
library(plm)
library(spdep)
library(splm)

setwd(getwd())

dados <- readxl::read_excel("dados/dados.xlsx")
shape <- sf::st_read("dados/shapefile/regioes_imediatas.shp")

pdata <- plm::pdata.frame(dados, index=c("cod_rgi", "ano"))
form <- poupanca ~ log_renda + anos_estudo + razao_idosos

# Fixed effects model
fe_model <- plm(form, data = pdata, model = "within")
summary(fe_model)

# Random effects model
re_model <- plm(form, data = pdata, model = "random")
summary(re_model)

# Hausman test
hausman_test <- phtest(fe_model, re_model)
print(hausman_test)
