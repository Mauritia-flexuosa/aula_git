import pandas as pd
import numpy as np
import statistics as stats
import plotnine as p9

dicionario = {
    'nome': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'idade': [25, 30, 35, 40, 45],
    'salario': [5000, 6000, 7000, 8000, 9000]
}

df = pd.DataFrame(dicionario)

p9.ggplot(df, p9.aes(x='idade', y='salario')) + p9.geom_point()

