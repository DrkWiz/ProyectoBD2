# Diccionario de Datos - Airbnb Listings

Este documento explica cada columna del CSV `listings.csv` de Airbnb.

---

## 1️⃣ Información de la propiedad
- **id** → Identificador único del listing (propiedad).  
- **listing_url** → URL del anuncio en Airbnb.  
- **scrape_id** → Identificador del “scrape” o extracción de datos.  
- **last_scraped** → Fecha en la que se extrajo esta info del sitio.  
- **source** → Fuente del scrape (ej. ciudad o dataset).  
- **name** → Nombre del anuncio.  
- **description** → Descripción larga del lugar.  
- **neighborhood_overview** → Descripción del barrio o zona.  
- **picture_url** → Foto principal del anuncio.  

---

## 2️⃣ Información del host (anfitrión)
- **host_id** → ID único del host.  
- **host_url** → URL del perfil del host.  
- **host_name** → Nombre del host.  
- **host_since** → Fecha en que el host comenzó a publicar en Airbnb.  
- **host_location** → Ciudad/país del host.  
- **host_about** → Información del host (biografía).  
- **host_response_time** → Tiempo promedio de respuesta.  
- **host_response_rate** → % de mensajes contestados.  
- **host_acceptance_rate** → % de reservas aceptadas.  
- **host_is_superhost** → Si es superhost o no (t/f).  
- **host_thumbnail_url** → Foto pequeña del host.  
- **host_picture_url** → Foto mediana/grande del host.  
- **host_neighbourhood** → Barrio del host (si lo tiene registrado).  
- **host_listings_count** → Cantidad de propiedades activas del host.  
- **host_total_listings_count** → Total de propiedades del host (incluye inactivas).  
- **host_verifications** → Formas en que Airbnb verificó al host (email, teléfono, etc.).  
- **host_has_profile_pic** → Si tiene foto de perfil.  
- **host_identity_verified** → Si su identidad fue verificada por Airbnb.  

---

## 3️⃣ Ubicación de la propiedad
- **neighbourhood** → Barrio.  
- **neighbourhood_cleansed** → Barrio “limpio” (homogeneizado para análisis).  
- **neighbourhood_group_cleansed** → Agrupación más grande (ej. zona de la ciudad).  
- **latitude** → Latitud.  
- **longitude** → Longitud.  

---

## 4️⃣ Tipo de propiedad y características
- **property_type** → Tipo (ej. “Entire condo”, “House”).  
- **room_type** → Tipo de habitación (entera, privada, compartida).  
- **accommodates** → Cantidad máxima de huéspedes.  
- **bathrooms** → Cantidad de baños (numérico).  
- **bathrooms_text** → Descripción del baño (ej. “1 bath”).  
- **bedrooms** → Cantidad de dormitorios.  
- **beds** → Cantidad de camas.  
- **amenities** → Lista de comodidades (aire acondicionado, TV, cocina, etc.).  

---

## 5️⃣ Precios y restricciones
- **price** → Precio por noche.  
- **minimum_nights** → Mínimo de noches por reserva.  
- **maximum_nights** → Máximo de noches permitido.  
- **minimum_minimum_nights / maximum_minimum_nights / minimum_maximum_nights / maximum_maximum_nights** → Estadísticas sobre restricciones de noches mínimas y máximas.  
- **minimum_nights_avg_ntm / maximum_nights_avg_ntm** → Promedio de noches mínimas/máximas según datos recientes.  

---

## 6️⃣ Disponibilidad
- **calendar_updated** → Fecha en que se actualizó el calendario.  
- **has_availability** → Si tiene disponibilidad actualmente.  
- **availability_30 / 60 / 90 / 365** → Cantidad de días disponibles en los próximos 30, 60, 90, 365 días.  
- **calendar_last_scraped** → Última fecha en que se extrajo información del calendario.  

---

## 7️⃣ Reseñas
- **number_of_reviews** → Cantidad total de reseñas recibidas.  
- **number_of_reviews_ltm** → Reviews en los últimos 12 meses.  
- **number_of_reviews_l30d** → Reviews en los últimos 30 días.  
- **availability_eoy** → Disponibilidad al final del año.  
- **number_of_reviews_ly** → Reviews del año pasado.  
- **estimated_occupancy_l365d** → Ocupación estimada últimos 365 días.  
- **estimated_revenue_l365d** → Ingreso estimado últimos 365 días.  
- **first_review / last_review** → Fecha de la primera y última reseña.  

---

## 8️⃣ Puntuaciones (reviews)
- **review_scores_rating** → Puntuación general.  
- **review_scores_accuracy** → Precisión de la descripción.  
- **review_scores_cleanliness** → Limpieza.  
- **review_scores_checkin** → Check-in.  
- **review_scores_communication** → Comunicación con el host.  
- **review_scores_location** → Ubicación.  
- **review_scores_value** → Relación precio/valor.  

---

## 9️⃣ Otros
- **license** → Licencia de alquiler (si aplica).  
- **instant_bookable** → Si se puede reservar instantáneamente.  
- **calculated_host_listings_count / calculated_host_listings_count_entire_homes / _private_rooms / _shared_rooms** → Cantidad de propiedades del host desglosadas por tipo.  
- **reviews_per_month** → Promedio de reseñas por mes.  
