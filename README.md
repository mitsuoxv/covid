WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-08

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
    ##  1 United States           18359.  1193452             65
    ##  2 Russia                   3540.   177160             50
    ##  3 Spain                    3337.   220325             66
    ##  4 United Kingdom           3192.   201205             63
    ##  5 Italy                    2896.   214457             74
    ##  6 Turkey                   2631.   131744             50
    ##  7 Germany                  2477.   166091             67
    ##  8 Brazil                   2122.   114715             54
    ##  9 France                   2050.   135468             66
    ## 10 Iran                     1430.   101650             71
    ## 11 Canada                   1113.    62458             56
    ## 12 Peru                     1021.    51189             50
    ## 13 India                     979.    52952             54
    ## 14 Belgium                   817.    50781             62
    ## 15 China                     779.    84409            108
    ## 16 Netherlands               664.    41319             62
    ## 17 Saudi Arabia              590.    31938             54
    ## 18 Ecuador                   585.    29420             50
    ## 19 Mexico                    529.    26025             49
    ## 20 Portugal                  474     26182             55

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       78.6               4881.             62
    ##  2 Spain                         71.7               4738.             66
    ##  3 United States                 59.2               3847.             65
    ##  4 United Kingdom                51.2               3227.             63
    ##  5 Italy                         48.0               3554.             74
    ##  6 Portugal                      44.4               2452.             55
    ##  7 Netherlands                   39.9               2482.             62
    ##  8 Ecuador                       39.6               1989.             50
    ##  9 Peru                          34.1               1712.             50
    ## 10 Turkey                        33.8               1693.             50
    ## 11 Canada                        33.0               1855.             56
    ## 12 France                        31.6               2092.             66
    ## 13 Germany                       30.3               2030.             67
    ## 14 Chile                         26.3               1376.             52
    ## 15 Russia                        25.2               1259.             50
    ## 16 Saudi Arabia                  22.9               1241.             54
    ## 17 Iran                          18.6               1321.             71
    ## 18 Czech Republic                13.4                761.             56
    ## 19 Romania                       11.8                642.             54
    ## 20 Brazil                        10.6                570.             54

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.0       25769   135468
    ##  2 Belgium                16.4        8339    50781
    ##  3 United Kingdom         14.9       30076   201205
    ##  4 Italy                  13.8       29684   214457
    ##  5 Netherlands            12.6        5204    41319
    ##  6 Spain                  11.7       25857   220325
    ##  7 Chad                   10            17      170
    ##  8 Mexico                  9.63       2507    26025
    ##  9 Algeria                 9.53        476     4997
    ## 10 Indonesia               7.20        895    12438
    ## 11 Brazil                  6.90       7921   114715
    ## 12 Burkina Faso            6.58         48      729
    ## 13 Canada                  6.58       4111    62458
    ## 14 Philippines             6.58        658    10004
    ## 15 Iran                    6.31       6418   101650
    ## 16 Egypt                   6.18        469     7588
    ## 17 Romania                 6.08        858    14107
    ## 18 Sudan                   5.75         49      852
    ## 19 Greece                  5.52        147     2663
    ## 20 China                   5.50       4643    84409

EOL
