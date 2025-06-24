library(dplyr)
library(sf)

# Hitung berapa banyak SPBU di dalam tiap grid
spbu_count <- st_intersection(spbu_m, jakarta_grid) %>%  # gunakan SPBU dan grid versi metrik
  st_drop_geometry() %>%
  count(grid_id, name = "spbu_count")  # hitung jumlah per grid

# Gabungkan data jumlah SPBU ke data grid
jakarta_analysis <- jakarta_grid %>%
  left_join(spbu_count, by = "grid_id") %>%
  mutate(spbu_count = ifelse(is.na(spbu_count), 0, spbu_count))  # ganti NA jadi 0

# Lihat ringkasan jumlah SPBU per grid
summary(jakarta_analysis$spbu_count)
