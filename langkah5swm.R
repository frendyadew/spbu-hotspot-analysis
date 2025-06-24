library(spdep)

# Buat titik pusat (centroid) dari masing-masing grid — hanya untuk referensi visual
centroids <- st_centroid(jakarta_analysis)

# Buat daftar tetangga (Queen contiguity: berbagi sisi/sudut)
neighbors <- poly2nb(jakarta_analysis, queen = TRUE)

# Buat matriks bobot spasial (standarisasi baris — "W")
weights <- nb2listw(neighbors, style = "W", zero.policy = TRUE)

# Cek ringkasan struktur keterhubungan
print(paste("Jumlah grid:", length(neighbors)))
summary(weights$weights)
