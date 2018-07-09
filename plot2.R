library(dplyr)

baltimore <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)/(10**2))
  
plot(x = baltimore$year,
     y = baltimore$Emissions,
     main = "Baltimore City",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (10^2 tonnes)",
     pch = 16,
     las = 1)
abline(lm(Emissions ~ year, baltimore))

dev.copy(png, "plot2.png")
dev.off()