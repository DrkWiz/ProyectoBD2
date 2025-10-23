import pandas as pd

# Cargar el dataset (ajustá la ruta al archivo que uses)
df = pd.read_csv("CSVs/listings.csv")

# Asegurarte de que la columna 'host_since' sea tipo fecha
df['host_since'] = pd.to_datetime(df['host_since'], errors='coerce')

# Eliminar valores nulos por seguridad
df = df.dropna(subset=['host_since'])

# Calcular la primera y última fecha
fecha_inicio = df['host_since'].min()
fecha_fin = df['host_since'].max()

# Calcular el periodo total
periodo = fecha_fin - fecha_inicio

print(f"Primer scrape: {fecha_inicio.date()}")
print(f"Último scrape: {fecha_fin.date()}")
print(f"Periodo total: {periodo.days} días ({periodo.days/30:.1f} meses aprox.)")