WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-17

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
    ##  1 United States           18679.  1382362             74
    ##  2 Russia                   4608.   272043             59
    ##  3 United Kingdom           3286.   236715             72
    ##  4 Brazil                   3219    202918             63
    ##  5 Spain                    3068.   230183             75
    ##  6 Italy                    2696.   223885             83
    ##  7 Turkey                   2479.   146457             59
    ##  8 Germany                  2285.   173772             76
    ##  9 France                   1859.   139646             75
    ## 10 Iran                     1456.   116635             80
    ## 11 Peru                     1364.    80604             59
    ## 12 India                    1362.    85940             63
    ## 13 Canada                   1134.    73829             65
    ## 14 Saudi Arabia              779.    49176             63
    ## 15 Belgium                   768.    54644             71
    ## 16 Mexico                    732.    42595             58
    ## 17 China                     720.    84478            117
    ## 18 Pakistan                  633.    38799             61
    ## 19 Netherlands               613.    43681             71
    ## 20 Chile                     605.    37040             61

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       73.8               5253.             71
    ##  2 Spain                         66.0               4950.             75
    ##  3 United States                 60.2               4456.             74
    ##  4 United Kingdom                52.7               3797.             72
    ##  5 Peru                          45.6               2695.             59
    ##  6 Italy                         44.7               3710.             83
    ##  7 Portugal                      41.7               2677.             64
    ##  8 Netherlands                   36.9               2624.             71
    ##  9 Chile                         36.1               2212.             61
    ## 10 Ecuador                       34.8               2062.             59
    ## 11 Canada                        33.7               2192.             65
    ## 12 Russia                        32.8               1933.             59
    ## 13 Turkey                        31.9               1882.             59
    ## 14 Saudi Arabia                  30.3               1911.             63
    ## 15 France                        28.7               2156.             75
    ## 16 Germany                       27.9               2124.             76
    ## 17 Iran                          18.9               1516.             80
    ## 18 Brazil                        16.0               1009.             63
    ## 19 Czech Republic                12.2                802.             65
    ## 20 Romania                       11.8                749.             63

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.7       27482   139646
    ##  2 Belgium                16.4        8959    54644
    ##  3 Yemen                  14.8          16      108
    ##  4 United Kingdom         14.4       33998   236715
    ##  5 Italy                  14.1       31610   223885
    ##  6 Netherlands            12.9        5643    43681
    ##  7 Spain                  11.9       27459   230183
    ##  8 Chad                   11.2          48      428
    ##  9 Mexico                 10.5        4477    42595
    ## 10 Algeria                 8.08        536     6630
    ## 11 Ecuador                 7.67       2338    30502
    ## 12 Canada                  7.45       5499    73829
    ## 13 Brazil                  6.90      13993   202918
    ## 14 Philippines             6.67        806    12091
    ## 15 Burkina Faso            6.54         51      780
    ## 16 Indonesia               6.52       1076    16496
    ## 17 Romania                 6.42       1056    16437
    ## 18 United States           6.06      83819  1382362
    ## 19 Iran                    5.92       6902   116635
    ## 20 Kenya                   5.89         46      781

EOL
