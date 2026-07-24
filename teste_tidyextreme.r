library(tidyextreme)
library(tidyverse)

a860 <- read_csv("/home/mcure/Downloads/$2a$10$tiPQSlM9vq7tFFpBA7C0UOCxgRTe8JqaXQyQB4wbirVcEQoh7AW4e/dados_A860_D_2008-02-27_2023-11-01.csv")|>
    mutate(`Data Medicao` = lubridate::ymd(`Data Medicao`)) |>
    mutate(`PRECIPITACAO TOTAL` = as.numeric(`PRECIPITACAO TOTAL`)) |>
    rename(Date = `Data Medicao`, Precipitation = `PRECIPITACAO TOTAL`) |>
    filter(!is.na(`Precipitation`))

head(a860)

ggplot(a860, aes(x = `Data Medicao`, y = `PRECIPITACAO TOTAL`)) +
  geom_line() +
  labs(title = "Série Temporal de Valores", x = "Data e Hora", y = "Valor") +
  theme_minimal()

?calculate_CWD

cwd <- tidyextreme::calculate_CWD(a860,
  time_col = "Data",
  prcp_col = "Precipitacao",
  wet_threshold = 1
)

cwd|>
  ggplot(aes(x = `year`, y = `CWD_max`)) +
  geom_line() +
  labs(title = "Máximo de dias chuvosos consecutivos", x = "Data", y = "Nº de dias") +
  theme_minimal()
