WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-09

## Summary

<https://mitsuoxv.shinyapps.io/covid/>

Coronavirus is affecting the world economy. Uncertaintiy is very high. I
searched around and found some informative sites, like [Coronavirus
Situation
Dashboard](https://who.maps.arcgis.com/apps/opsdashboard/index.html#/c88e37cfc43b4ed3baf977d77e4a0667)
and [Coronavirus Update by
worldometer](https://www.worldometers.info/coronavirus/). But they fail
to offer time-series data of the newly confirmed cases by each area, in
which I am most interested. If the average number of infections one
infected person inflict is even slightly more than one, infections grow
exponentially. If less than one, the newly confirmed cases begin to
decrease, and the virus will be contained eventually in that area.

WHO offers those numbers in [the situation
reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/),
which are unfortunately pdf files.

So I scratched numbers from pdf files, scratched my head learning
regular expressions, and made the shiny app above. I would like to
update frequently, but I am not sure. The ugly codes I wrote are in R
directory. Data in Table 1 (In China) and Table 2 (World including
China) in the situation reports are in table1.csv, table2.csv and
tables.rdata in data directory.

Note that the confirmed cases are not the actual cases, due to delays
from infection to symptoms, limited testing capacity, and so on, as
[Nate Silver tells
us](https://fivethirtyeight.com/features/coronavirus-case-counts-are-meaningless/).

## Load

Here, I load Table 1 and Table 2, which I managed to scratch from WHO
situation reports. Beware Table 1 (in\_china) includes total, but Table
2 (world) does not include subtotal or total, as I cut them.

``` r
# load data
load("data/tables.rdata")
```

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 10 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           10089.   363321             36
    ##  2 Spain                    3794.   140510             37
    ##  3 Italy                    3010.   135586             45
    ##  4 Germany                  2713.   103228             38
    ##  5 France                   2082.    77226             37
    ##  6 United Kingdom           1621.    55246             34
    ##  7 Turkey                   1615.    34109             21
    ##  8 Iran                     1487.    62589             42
    ##  9 China                    1049.    83157             79
    ## 10 Belgium                   669.    22194             33
    ## 11 Canada                    626.    17049             27
    ## 12 Netherlands               589.    19580             33
    ## 13 Brazil                    477.    12056             25
    ## 14 Portugal                  474.    12442             26
    ## 15 Russia                    350      7497             21
    ## 16 Chile                     216.     5116             23
    ## 17 South Korea               210.    10384             49
    ## 18 India                     203.     5194             25
    ## 19 Australia                 202.     5956             29
    ## 20 Poland                    189.     4848             25

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        81.6                3021.             37
    ##  2 Belgium                      64.3                2133.             33
    ##  3 Italy                        49.9                2247.             45
    ##  4 Portugal                     44.4                1165.             26
    ##  5 Netherlands                  35.4                1176.             33
    ##  6 Germany                      33.2                1262.             38
    ##  7 United States                32.5                1171.             36
    ##  8 France                       32.1                1192.             37
    ##  9 United Kingdom               26.0                 886.             34
    ## 10 Turkey                       20.8                 438.             21
    ## 11 Iran                         19.3                 814.             42
    ## 12 Canada                       18.6                 506.             27
    ## 13 Czech Republic               17.3                 479.             27
    ## 14 Chile                        12.9                 305.             23
    ## 15 Ecuador                      11.6                 253.             21
    ## 16 Australia                     9.37                277.             29
    ## 17 Romania                       7.82                201.             25
    ## 18 Greece                        5.83                167.             25
    ## 19 Poland                        4.92                126.             25
    ## 20 Malaysia                      4.53                140.             30

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   13.4       10313    77226
    ##  2 Algeria                                  13.2         194     1468
    ##  3 Italy                                    12.6       17129   135586
    ##  4 United Kingdom                           11.1        6159    55246
    ##  5 Democratic Republic of the Congo         10.9          20      183
    ##  6 Netherlands                              10.7        2101    19580
    ##  7 Bangladesh                               10.4          17      164
    ##  8 Spain                                     9.82      13798   140510
    ##  9 Belgium                                   9.17       2035    22194
    ## 10 Indonesia                                 8.07        221     2738
    ## 11 Morocco                                   7.60         90     1184
    ## 12 Egypt                                     6.48         94     1450
    ## 13 Iran                                      6.19       3872    62589
    ## 14 Iraq                                      5.79         65     1122
    ## 15 Mexico                                    5.13        125     2439
    ## 16 Ecuador                                   5.10        191     3747
    ## 17 Burkina Faso                              4.95         18      364
    ## 18 Philippines                               4.70        177     3764
    ## 19 Brazil                                    4.59        553    12056
    ## 20 Greece                                    4.42         81     1832

EOL
