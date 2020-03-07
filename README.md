WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

## Summary

<https://mitsuoxv.shinyapps.io/covid/>

Coronavirus is affecting the world economy. Uncertaintiy is very high. I searched around and found some informative sites, like [Coronavirus Situation Dashboard by WHO](https://who.maps.arcgis.com/apps/opsdashboard/index.html#/c88e37cfc43b4ed3baf977d77e4a0667) and [Coronavirus Update by worldometer](https://www.worldometers.info/coronavirus/). But they fail to offer time-series data of the newly confirmed cases by each area, in which I am most interested. If the average number of infections one infected person inflict is even slightly more than one, infections grow exponentially. If less than one, the newly confirmed cases begin to decrease, and the virus will be contained eventually in that area.

WHO offers those numbers in [the situation reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/), which are unfortunately pdf files.

So I scratched numbers from pdf files, scratched my head learning regular expressions, and made the shiny app above. I would like to update frequently, but I am not sure. The ugly codes I wrote are in R directory. Data in Table 1 and Table 2 in the situation reports are in tables.rdata in data directory.


EOL
