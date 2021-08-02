# Querying which countries solely use the Oxford/AstraZeneca vaccine.
# This query uses a self join on the country_vaccinations table.
# Data available at: https://www.kaggle.com/gpreda/covid-world-vaccination-progress.

SELECT cv1.country, cv1.vaccines, SUM(cv1.total_vaccinations)
FROM country_vaccinations cv1, country_vaccinations cv2 
WHERE cv1.country = cv2.country AND cv1.vaccines = "Oxford/AstraZeneca" 
GROUP BY cv1.country;

# The countries are: Antigua and Barbuda, Barbados, and Botswana.

# NB: In order for GROUP BY to work in the way this SQL statement is expressed, an update to the configuration of sql_mode is required. 
#     This will require running the following SQL command: SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
