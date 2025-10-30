
import pandas as pd

# Cargar el archivo CSV
df = pd.read_csv('CSVs/cars.csv')

# Eliminar las columnas no deseadas
df = df.drop(columns=['Mileage_KM', 'Sales_Classification'])

# Estandarizar las columnas de texto a minúsculas
text_columns = df.select_dtypes(include=['object']).columns
for col in text_columns:
    df[col] = df[col].str.lower()

# Convertir la columna Engine_Size_L al formato correcto
df['Engine_Size_L'] = df['Engine_Size_L'].astype(float)

# Convertir la columna Year al formato de fecha
df['Year'] = pd.to_datetime(df['Year'], format='%Y').dt.year

# Convertir la columna Price_USD al formato float
df['Price_USD'] = df['Price_USD'].astype(float)

# Convertir la columna Sales_Volume al formato int
df['Sales_Volume'] = df['Sales_Volume'].astype(int)

# Guardar el DataFrame modificado en un nuevo archivo CSV
df.to_csv('CSVs/cars_modified.csv', index=False)
