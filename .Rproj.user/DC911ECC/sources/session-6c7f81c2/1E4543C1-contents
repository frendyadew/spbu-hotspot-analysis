library(sf)
library(dplyr)

# Transformasikan ke CRS metrik (contoh: UTM zone 48S - cocok untuk Jakarta)
jakarta_boundary_m <- st_transform(jakarta_boundary, 32748)  # EPSG:32748

# Buat grid 1km x 1km di atas boundary yang sudah metrik
grid_size <- 1000  # meter
jakarta_grid <- st_make_grid(jakarta_boundary_m,
                             cellsize = grid_size,
                             square = TRUE) %>%
  st_sf() %>%
  mutate(grid_id = row_number())

# Potong grid agar hanya bagian dalam Jakarta
jakarta_grid <- st_intersection(jakarta_grid, jakarta_boundary_m)

# Plot hasil grid dan titik SPBU
spbu_m <- st_transform(spbu_clean, 32748)  # Transformasikan SPBU juga

plot(st_geometry(jakarta_grid), col = NA, border = "gray")
plot(st_geometry(spbu_m), add = TRUE, col = "red", pch = 20)
