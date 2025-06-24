# Simpan grid hasil analisis
st_write(jakarta_analysis, "output/jakarta_spbu_hotspot_analysis.shp", delete_dsn = TRUE)

# Simpan titik SPBU
st_write(spbu_m, "output/spbu_points_jakarta.shp", delete_dsn = TRUE)

# Simpan ringkasan statistik
write.csv(summary_stats, "output/hotspot_summary_statistics.csv", row.names = FALSE)
write.csv(signif_summary, "output/significant_hotspots_summary.csv", row.names = FALSE)
