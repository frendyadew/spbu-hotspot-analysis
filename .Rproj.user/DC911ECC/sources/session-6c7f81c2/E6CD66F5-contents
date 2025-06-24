# Statistik deskriptif per kategori hotspot
summary_stats <- jakarta_analysis %>%
  st_drop_geometry() %>%
  group_by(hotspot_category) %>%
  summarise(
    jumlah_grid = n(),
    rata2_spbu = round(mean(spbu_count), 2),
    median_spbu = median(spbu_count),
    min_zscore = round(min(gi_star), 3),
    max_zscore = round(max(gi_star), 3),
    .groups = 'drop'
  )

print("Tabel Statistik Deskriptif per Kategori:")
print(summary_stats)

# Ringkasan area yang signifikan (hotspot dan coldspot saja)
signif_summary <- jakarta_analysis %>%
  st_drop_geometry() %>%
  filter(hotspot_simplified != "Not Significant") %>%
  group_by(hotspot_simplified) %>%
  summarise(
    jumlah_grid = n(),
    persentase = round(n() / nrow(jakarta_analysis) * 100, 2),
    rata2_spbu = round(mean(spbu_count), 2),
    rata2_zscore = round(mean(gi_star), 3),
    .groups = 'drop'
  )

print("Ringkasan Area Signifikan (Hotspot/Coldspot):")
print(signif_summary)
