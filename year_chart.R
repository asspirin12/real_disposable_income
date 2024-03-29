year_df <- read_csv("raw_data/реальные располагаемые доходы по годам 2000-2020 - Sheet3.csv")

year_income_plot <- 
  year_df %>%
  ggplot() +
  geom_bar(aes(x = year, y = perc),
           stat = "identity",
           fill=ifelse(year_df$perc > 0, "#1380a1", "#990000")) +
  bbc_style() +
  labs(
    title = "Динамика реальных располагаемых\nдоходов россиян",
    subtitle = "Данные по годам"
  ) +
  scale_y_continuous(
    breaks = c(-5, 0, 5, 10, 15),
    labels = c("-5%", "0", "+5%", "+10%", "+15%")
  ) +
  theme(
    panel.grid.major.y = element_line(size = .3, color = "#dddddd"),
    panel.grid.major.x = element_line(size = .3, color = "#dddddd")
  )

finalise_plot(
  plot_name = year_income_plot,
  save_filepath = "charts/year_income-nc.png",
  source_name = "Источник: Росстат"
)