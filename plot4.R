library(dplyr)
library(ggplot2)

coal_idx <- SCC %>%
  filter(grepl("^Fuel Comb.*Coal$", EI.Sector)) %>%
  select(SCC) %>%
  unique()

coal <- NEI %>%
  filter(SCC %in% coal_idx$SCC) %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)/(10**6))
 
ggplot(coal,
       aes(x = year, y = Emissions)) +
  geom_point() + 
  geom_smooth(method = "glm", se = FALSE) +
  labs(title = "United States",
       x = "Year",
       y = "Total PM2.5 Emissions (10^6 tonnes)")

dev.copy(png, "plot4.png")
dev.off()