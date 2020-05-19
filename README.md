WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-20

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
    ##  1 United States           19187.  1477516             77
    ##  2 Russia                   4835.   299941             62
    ##  3 Brazil                   3651.   241080             66
    ##  4 United Kingdom           3284.   246410             75
    ##  5 Spain                    2968.   231606             78
    ##  6 Italy                    2625.   225886             86
    ##  7 Turkey                   2426.   150593             62
    ##  8 Germany                  2216.   175210             79
    ##  9 France                   1799.   140497             78
    ## 10 India                    1531.   101139             66
    ## 11 Peru                     1486.    92273             62
    ## 12 Iran                     1474.   122492             83
    ## 13 Canada                   1135.    77306             68
    ## 14 Saudi Arabia              905.    59854             66
    ## 15 Mexico                    805.    49219             61
    ## 16 Belgium                   749.    55559             74
    ## 17 Chile                     717.    46059             64
    ## 18 China                     702.    84500            120
    ## 19 Pakistan                  684.    43966             64
    ## 20 Netherlands               595.    44141             74

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       72.0               5341.             74
    ##  2 Spain                         63.8               4980.             78
    ##  3 United States                 61.8               4763.             77
    ##  4 United Kingdom                52.7               3952.             75
    ##  5 Peru                          49.7               3085.             62
    ##  6 Italy                         43.5               3744.             86
    ##  7 Chile                         42.8               2750.             64
    ##  8 Portugal                      40.7               2736.             67
    ##  9 Ecuador                       36.0               2243.             62
    ## 10 Netherlands                   35.7               2652.             74
    ## 11 Saudi Arabia                  35.2               2326.             66
    ## 12 Russia                        34.4               2132.             62
    ## 13 Canada                        33.7               2295.             68
    ## 14 Turkey                        31.2               1936.             62
    ## 15 France                        27.8               2169.             78
    ## 16 Germany                       27.1               2142.             79
    ## 17 Iran                          19.2               1592.             83
    ## 18 Brazil                        18.2               1199.             66
    ## 19 Czech Republic                11.9                820.             68
    ## 20 Romania                       11.7                776.             66

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 20.1       28190   140497
    ##  2 Belgium                16.3        9080    55559
    ##  3 Yemen                  15.7          21      134
    ##  4 Italy                  14.2       32007   225886
    ##  5 United Kingdom         14.1       34796   246410
    ##  6 Netherlands            12.9        5694    44141
    ##  7 Spain                  12.0       27709   231606
    ##  8 Mexico                 10.5        5177    49219
    ##  9 Chad                   10.4          54      519
    ## 10 Ecuador                 8.25       2736    33182
    ## 11 Algeria                 7.71        555     7201
    ## 12 Canada                  7.51       5805    77306
    ## 13 Brazil                  6.69      16118   241080
    ## 14 Indonesia               6.61       1191    18010
    ## 15 Philippines             6.53        831    12718
    ## 16 Romania                 6.50       1107    17036
    ## 17 Burkina Faso            6.41         51      796
    ## 18 Niger                   6.05         55      909
    ## 19 United States           6.04      89272  1477516
    ## 20 Mali                    5.95         52      874

EOL
