WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-12

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
    ##  1 United States           18428.  1271645             69
    ##  2 Russia                   4096.   221344             54
    ##  3 United Kingdom           3270.   219187             67
    ##  4 Spain                    3204.   224390             70
    ##  5 Italy                    2807    219070             78
    ##  6 Brazil                   2687.   155939             58
    ##  7 Turkey                   2564.   138657             54
    ##  8 Germany                  2387.   169575             71
    ##  9 France                   1955.   137073             70
    ## 10 Iran                     1433.   107603             75
    ## 11 Peru                     1201.    65015             54
    ## 12 India                    1156.    67152             58
    ## 13 Canada                   1131.    67996             60
    ## 14 Belgium                   803.    53081             66
    ## 15 China                     752.    84450            112
    ## 16 Saudi Arabia              671.    39048             58
    ## 17 Netherlands               644.    42627             66
    ## 18 Mexico                    629.    33460             53
    ## 19 Pakistan                  549.    30941             56
    ## 20 Ecuador                   545.    29559             54

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       77.2               5102.             66
    ##  2 Spain                         68.9               4825.             70
    ##  3 United States                 59.4               4099.             69
    ##  4 United Kingdom                52.4               3516.             67
    ##  5 Italy                         46.5               3631.             78
    ##  6 Portugal                      43.6               2583.             59
    ##  7 Peru                          40.2               2174.             54
    ##  8 Netherlands                   38.7               2561.             66
    ##  9 Ecuador                       36.8               1998.             54
    ## 10 Canada                        33.6               2019.             60
    ## 11 Turkey                        33.0               1782.             54
    ## 12 Chile                         30.6               1724.             56
    ## 13 France                        30.2               2116.             70
    ## 14 Germany                       29.2               2073.             71
    ## 15 Russia                        29.1               1573.             54
    ## 16 Saudi Arabia                  26.1               1518.             58
    ## 17 Iran                          18.6               1399.             75
    ## 18 Brazil                        13.4                775.             58
    ## 19 Czech Republic                12.7                775.             60
    ## 20 Romania                       12.0                700.             58

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.2       26338   137073
    ##  2 Belgium                16.3        8656    53081
    ##  3 United Kingdom         14.5       31855   219187
    ##  4 Italy                  13.9       30560   219070
    ##  5 Netherlands            12.8        5440    42627
    ##  6 Spain                  11.9       26621   224390
    ##  7 Mexico                 10.0        3353    33460
    ##  8 Chad                    9.63         31      322
    ##  9 Algeria                 8.77        502     5723
    ## 10 Ecuador                 7.20       2127    29559
    ## 11 Canada                  6.95       4728    67996
    ## 12 Indonesia               6.93        973    14032
    ## 13 Brazil                  6.81      10627   155939
    ## 14 Philippines             6.66        719    10794
    ## 15 Burkina Faso            6.52         49      751
    ## 16 Romania                 6.20        952    15362
    ## 17 Iran                    6.17       6640   107603
    ## 18 United States           6.05      76916  1271645
    ## 19 Niger                   5.60         46      821
    ## 20 Egypt                   5.59        525     9400

EOL
