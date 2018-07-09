library(dplyr)
library(ggplot2)

motor_idx <- SCC %>%
  filter(grepl("^.*Motor.*$", SCC.Level.Three)) %>%
  select(SCC) %>%
  unique()

motor_baltimore2 <- NEI %>%
  filter(SCC %in% motor_idx$SCC, fips %in% c("24510", "06037")) %>%
  mutate(fips = ifelse(fips == "24510", "Baltimore City", "Los Angeles City")) %>%
  group_by(year, fips) %>%
  summarise(Emissions = sum(Emissions)/(10**1))

ggplot(motor_baltimore2,
       aes(x = year, y = Emissions)) +
  geom_point() +
  geom_smooth(method = "glm", se = FALSE) +
  facet_grid(facets = .~fips) +
  labs(title = "Motor Vehicle Source Emissions",
       x = "Year",
       y = "Total PM2.5 Emissions (10^1 tonnes)")

dev.copy(png, "plot6.png")
dev.off()