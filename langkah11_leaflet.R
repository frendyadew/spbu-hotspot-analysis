library(leaflet)
library(htmlwidgets)  # untuk menyimpan ke file .html

# Warna kategori hotspot
hotspot_colors <- c(
  "Hot Spot (99% confidence)" = "#d73027",
  "Hot Spot (95% confidence)" = "#f46d43",
  "Hot Spot (90% confidence)" = "#fdae61",
  "Not Significant" = "#ffffbf",
  "Cold Spot (90% confidence)" = "#abd9e9",
  "Cold Spot (95% confidence)" = "#74add1",
  "Cold Spot (99% confidence)" = "#4575b4"
)

# Konversi ke CRS WGS 84 (EPSG:4326)
jakarta_leaflet <- st_transform(jakarta_analysis, 4326)
spbu_leaflet <- st_transform(spbu_m, 4326)

# Buat peta interaktif
peta_interaktif <- leaflet() %>%
  addTiles() %>%
  addPolygons(
    data = jakarta_leaflet,
    fillColor = ~colorFactor(hotspot_colors, hotspot_category)(hotspot_category),
    fillOpacity = 0.7,
    color = "white",
    weight = 1,
    popup = ~paste0(
      "<strong>Grid ID:</strong> ", grid_id, "<br>",
      "<strong>SPBU:</strong> ", spbu_count, "<br>",
      "<strong>Z-Score:</strong> ", round(gi_star, 2), "<br>",
      "<strong>p-value:</strong> ", round(gi_pvalue, 4), "<br>",
      "<strong>Kategori:</strong> ", hotspot_category
    )
  ) %>%
  addCircleMarkers(
    data = spbu_leaflet,
    radius = 3,
    color = "black",
    stroke = FALSE,
    fillOpacity = 0.8,
    popup = ~paste0("SPBU: ", ifelse(is.na(name), "Tanpa Nama", name))
  ) %>%
  addLegend(
    "bottomright",
    colors = hotspot_colors,
    labels = names(hotspot_colors),
    title = "Hotspot Category",
    opacity = 1
  )
