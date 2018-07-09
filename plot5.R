library(dplyr)
library(ggplot2)

motor_idx <- SCC %>%
  filter(grepl("^.*Motor.*$", SCC.Level.Three)) %>%
  select(SCC) %>%
  unique()

motor_baltimore <- NEI %>%
  filter(SCC %in% motor_idx$SCC, fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)/(10**1))

ggplot(motor_baltimore,
       aes(x = year, y = Emissions)) +
  geom_point() +
  geom_smooth(method = "glm", se = FALSE) +
  labs(title = "Motor Vehicle Source Emissions (Baltimore City)",
       x = "Year",
       y = "Total PM2.5 Emissions (10^1 tonnes)")

dev.copy(png, "plot5.png")
dev.off()