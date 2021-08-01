# Querying which countries solely use the Oxford/AstraZeneca vaccine.
# This query uses a self join on the country_vaccinations table.
# Data available at: https://www.kaggle.com/gpreda/covid-world-vaccination-progress.

SELECT cv1.country, cv1.vaccines, SUM(cv1.total_vaccinations)
FROM country_vaccinations cv1, country_vaccinations cv2 
WHERE cv1.country = cv2.country AND cv1.vaccines = "Oxford/AstraZeneca" 
GROUP BY cv1.country;

# The countries are: Antigua and Barbuda, Barbados, and Botswana.
