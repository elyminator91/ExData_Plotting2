library(dplyr)

total_emission <- NEI %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)/(10**6))

plot(x = total_emission$year,
     y = total_emission$Emissions,
     main = "United States",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (10^6 tonnes)",
     pch = 16,
     las = 1)
abline(lm(Emissions ~ year, total_emission))

dev.copy(png, "plot1.png")
dev.off()