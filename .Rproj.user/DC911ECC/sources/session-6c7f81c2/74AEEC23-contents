# Peta distribusi Z-Score (Gi*)
zscore_map <- ggplot() +
  geom_sf(data = jakarta_analysis, 
          aes(fill = gi_star), 
          color = "white", 
          size = 0.1) +
  geom_sf(data = spbu_m, 
          color = "black", 
          size = 0.3, 
          alpha = 0.5) +
  scale_fill_gradient2(
    low = "blue", 
    mid = "white", 
    high = "red",
    midpoint = 0,
    name = "Z-Score\n(Gi*)"
  ) +
  labs(
    title = "Distribusi Z-Score (Getis-Ord Gi*)",
    subtitle = "Sebaran SPBU di DKI Jakarta",
    caption = "Nilai positif = Hotspot, nilai negatif = Coldspot"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12),
    legend.position = "right"
  )

# Tampilkan peta
print(zscore_map)

# Simpan peta sebagai file PNG
ggsave("zscore_spbu_jakarta.png", zscore_map, 
       width = 12, height = 8, dpi = 300)
