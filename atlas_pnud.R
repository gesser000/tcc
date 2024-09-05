library(readxl)
library(dplyr)

file_list <- list.files(path = "dados", pattern = "*.xlsx", full.names = TRUE)
all_data <- lapply(file_list, read_excel) %>% 
  bind_rows() %>%
  filter(!(Territorialidades %in% c("Brasil", 
                                    "Elaboração: Atlas do Desenvolvimento Humano no Brasil. Pnud Brasil, Ipea e FJP, 2022.", 
                                    "Fontes: dados do IBGE e de registros administrativos, conforme especificados nos metadados disponíveis disponíveis em: http://atlasbrasil.org.br/acervo/biblioteca.")
           )) %>%
  filter(!is.na(Territorialidades))


