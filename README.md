WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2020-05-25

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
    ##  1 United States           19126.  1568448             82
    ##  2 Russia                   5139.   344481             67
    ##  3 Brazil                   4659.   330890             71
    ##  4 United Kingdom           3213    257158             80
    ##  5 Spain                    2833.   235290             83
    ##  6 Italy                    2519.   229327             91
    ##  7 Turkey                   2321.   155686             67
    ##  8 Germany                  2121.   178281             84
    ##  9 India                    1856.   131868             71
    ## 10 France                   1711.   142173             83
    ## 11 Peru                     1665.   111698             67
    ## 12 Iran                     1516.   133521             88
    ## 13 Canada                   1134.    82892             73
    ## 14 Saudi Arabia              987.    70161             71
    ## 15 Mexico                    946.    62527             66
    ## 16 Chile                     945.    65393             69
    ## 17 Pakistan                  789.    54601             69
    ## 18 Belgium                   718.    56810             79
    ## 19 China                     674.    84525            125
    ## 20 Bangladesh                666.    32078             48

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       69.0               5461.             79
    ##  2 United States                 61.7               5056.             82
    ##  3 Spain                         60.9               5059.             83
    ##  4 Chile                         56.5               3905.             69
    ##  5 Peru                          55.7               3735.             67
    ##  6 United Kingdom                51.5               4125.             80
    ##  7 Italy                         41.7               3801.             91
    ##  8 Portugal                      39.5               2854.             72
    ##  9 Saudi Arabia                  38.3               2727.             71
    ## 10 Russia                        36.5               2448.             67
    ## 11 Ecuador                       36.4               2451.             67
    ## 12 Netherlands                   34.2               2707.             79
    ## 13 Canada                        33.7               2461.             73
    ## 14 Turkey                        29.8               2001.             67
    ## 15 France                        26.4               2195.             83
    ## 16 Germany                       25.9               2179.             84
    ## 17 Brazil                        23.2               1645.             71
    ## 18 Iran                          19.7               1736.             88
    ## 19 Czech Republic                11.5                849.             73
    ## 20 Romania                       11.4                813.             71

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.9       28281   142173
    ##  2 Yemen                  18.5          40      216
    ##  3 Belgium                16.3        9237    56810
    ##  4 Italy                  14.3       32735   229327
    ##  5 United Kingdom         14.3       36675   257158
    ##  6 Netherlands            12.9        5811    45064
    ##  7 Spain                  12.2       28678   235290
    ##  8 Mexico                 11.2        6989    62527
    ##  9 Chad                    9.26         60      648
    ## 10 Ecuador                 8.54       3096    36258
    ## 11 Canada                  7.57       6277    82892
    ## 12 Algeria                 7.30        592     8113
    ## 13 Romania                 6.55       1170    17857
    ## 14 Niger                   6.47         61      943
    ## 15 Brazil                  6.36      21048   330890
    ## 16 Philippines             6.26        863    13777
    ## 17 Burkina Faso            6.26         52      831
    ## 18 Indonesia               6.21       1351    21745
    ## 19 Mali                    6.11         62     1015
    ## 20 United States           5.99      94011  1568448

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                888.        9237    10.4
    ##  2 Spain                  617.       28678    46.5
    ##  3 United Kingdom         588.       36675    62.3
    ##  4 Italy                  543.       32735    60.3
    ##  5 France                 437.       28281    64.8
    ##  6 Netherlands            349.        5811    16.6
    ##  7 United States          303.       94011   310. 
    ##  8 Ecuador                209.        3096    14.8
    ##  9 Canada                 186.        6277    33.7
    ## 10 Portugal               122.        1302    10.7
    ## 11 Peru                   108.        3244    29.9
    ## 12 Brazil                 105.       21048   201. 
    ## 13 Germany                101.        8247    81.8
    ## 14 Iran                    95.7       7359    76.9
    ## 15 Mexico                  62.1       6989   112. 
    ## 16 Turkey                  55.4       4308    77.8
    ## 17 Romania                 53.3       1170    22.0
    ## 18 Chile                   40.2        673    16.7
    ## 19 Czech Republic          30.0        314    10.5
    ## 20 Poland                  25.8        993    38.5

EOL
