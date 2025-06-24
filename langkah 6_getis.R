library(spdep)

# Hitung nilai Gi* (z-score)
gi_star <- localG(jakarta_analysis$spbu_count, weights, zero.policy = TRUE)

# Tambahkan ke dalam data grid
jakarta_analysis$gi_star <- as.numeric(gi_star)

# Hitung nilai p-value dua sisi (z-score ke p-value)
jakarta_analysis$gi_pvalue <- 2 * pnorm(-abs(jakarta_analysis$gi_star))

# Klasifikasikan hotspot / coldspot
jakarta_analysis <- jakarta_analysis %>%
  mutate(
    hotspot_category = case_when(
      gi_star >= 2.58 & gi_pvalue <= 0.01 ~ "Hot Spot (99% confidence)",
      gi_star >= 1.96 & gi_pvalue <= 0.05 ~ "Hot Spot (95% confidence)",
      gi_star >= 1.65 & gi_pvalue <= 0.10 ~ "Hot Spot (90% confidence)",
      gi_star <= -2.58 & gi_pvalue <= 0.01 ~ "Cold Spot (99% confidence)",
      gi_star <= -1.96 & gi_pvalue <= 0.05 ~ "Cold Spot (95% confidence)",
      gi_star <= -1.65 & gi_pvalue <= 0.10 ~ "Cold Spot (90% confidence)",
      TRUE ~ "Not Significant"
    ),
    hotspot_simplified = case_when(
      gi_star >= 1.65 & gi_pvalue <= 0.10 ~ "Hot Spot",
      gi_star <= -1.65 & gi_pvalue <= 0.10 ~ "Cold Spot",
      TRUE ~ "Not Significant"
    )
  )

# Lihat hasil klasifikasi
table(jakarta_analysis$hotspot_category)
