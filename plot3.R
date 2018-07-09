library(dplyr)
library(ggplot2)

baltimore2 <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(Emissions = sum(Emissions)/(10**2))

ggplot(baltimore2, 
       aes(x = year, y = Emissions)) +
  geom_point() +
  geom_smooth(method = "glm", se = FALSE) +
  facet_grid(facets = .~type) + 
  labs(title = "Baltimore City",
       x = "Year",
       y = "Total PM2.5 Emissions (10^2 tonnes)")

dev.copy(png, "plot3.png")
dev.off()