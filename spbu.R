library(osmdata)
library(sf)

# Baca ulang shapefile Jakarta (kalau belum dibaca sebelumnya)
jakarta_boundary <- st_read("data/jakarta_boundary.shp")

# Ambil bounding box dari batas Jakarta
bbox <- st_bbox(jakarta_boundary)

# Buat query untuk mengambil data "amenity = fuel" (SPBU) dari OSM
spbu_query <- opq(bbox = bbox) %>%
  add_osm_feature(key = "amenity", value = "fuel") %>%
  osmdata_sf()

# Ekstrak hanya data titik (point)
spbu_points <- spbu_query$osm_points

# Filter dan bersihkan data
spbu_clean <- spbu_points %>%
  filter(!is.na(geometry)) %>%
  select(osm_id, name, amenity, brand, operator)

# Pastikan hanya titik SPBU yang berada dalam batas Jakarta
spbu_clean <- st_intersection(spbu_clean, jakarta_boundary)

# Tampilkan jumlah SPBU
print(paste("Jumlah SPBU ditemukan:", nrow(spbu_clean)))

# Tampilkan peta cepat untuk pengecekan
plot(st_geometry(jakarta_boundary), col = "lightgray")
plot(st_geometry(spbu_clean), add = TRUE, col = "red", pch = 20)
