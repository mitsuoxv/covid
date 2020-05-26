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

Updated: 2020-05-27

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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

I later found [Johns Hopkins University, Coronavirus Resource
Center](https://coronavirus.jhu.edu/) and [Financial Times, Coronavirus
tracked](https://www.ft.com/content/a26fbf7e-48f8-11ea-aeb3-955839e06441)
are very informative, and that they provide some time-series charts of
the newly confirmed cases.

I added the United States page to [my Shiny
App](https://mitsuoxv.shinyapps.io/covid/) on May 25, 2020. I use data
from [USAFacts
page](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/).

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
    ##  1 United States           19270.  1618757             84
    ##  2 Russia                   5249.   362342             69
    ##  3 Brazil                   4974.   363211             73
    ##  4 United Kingdom           3184.   261188             82
    ##  5 Spain                    2768.   235400             85
    ##  6 Italy                    2473.   230158             93
    ##  7 Turkey                   2284.   157814             69
    ##  8 Germany                  2080.   179002             86
    ##  9 India                    1990.   145380             73
    ## 10 Peru                     1736.   119959             69
    ## 11 France                   1674.   142482             85
    ## 12 Iran                     1529.   137724             90
    ## 13 Canada                   1133.    85103             75
    ## 14 Chile                    1040.    73997             71
    ## 15 Saudi Arabia             1023.    74795             73
    ## 16 Mexico                   1007.    68620             68
    ## 17 Pakistan                  810.    57705             71
    ## 18 Bangladesh                709.    35585             50
    ## 19 Belgium                   707.    57342             81
    ## 20 China                     664.    84543            127

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       67.9               5512.             81
    ##  2 United States                 62.1               5218.             84
    ##  3 Chile                         62.1               4419.             71
    ##  4 Spain                         59.5               5062.             85
    ##  5 Peru                          58.1               4011.             69
    ##  6 United Kingdom                51.1               4189.             82
    ##  7 Italy                         41.0               3814.             93
    ##  8 Saudi Arabia                  39.8               2907.             73
    ##  9 Portugal                      38.8               2884.             74
    ## 10 Russia                        37.3               2575.             69
    ## 11 Ecuador                       36.5               2526.             69
    ## 12 Canada                        33.6               2527.             75
    ## 13 Netherlands                   33.6               2730.             81
    ## 14 Turkey                        29.4               2028.             69
    ## 15 France                        25.8               2200.             85
    ## 16 Germany                       25.4               2188.             86
    ## 17 Brazil                        24.7               1806.             73
    ## 18 Iran                          19.9               1790.             90
    ## 19 Romania                       11.3                833.             73
    ## 20 Czech Republic                11.3                859.             75

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.9       28379   142482
    ##  2 Yemen                  19.0          45      237
    ##  3 Belgium                16.2        9312    57342
    ##  4 Italy                  14.3       32877   230158
    ##  5 United Kingdom         14.1       36914   261188
    ##  6 Netherlands            12.8        5830    45445
    ##  7 Spain                  11.4       26834   235400
    ##  8 Mexico                 10.8        7394    68620
    ##  9 Chad                    8.88         61      687
    ## 10 Ecuador                 8.57       3203    37355
    ## 11 Canada                  7.58       6453    85103
    ## 12 Algeria                 7.16        609     8503
    ## 13 Romania                 6.55       1197    18283
    ## 14 Niger                   6.52         62      951
    ## 15 Mali                    6.33         67     1059
    ## 16 Brazil                  6.24      22666   363211
    ## 17 Burkina Faso            6.18         52      841
    ## 18 Indonesia               6.11       1391    22750
    ## 19 Philippines             6.10        873    14319
    ## 20 United States           5.99      96909  1618757

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                895.        9312    10.4
    ##  2 United Kingdom         592.       36914    62.3
    ##  3 Spain                  577.       26834    46.5
    ##  4 Italy                  545.       32877    60.3
    ##  5 France                 438.       28379    64.8
    ##  6 Netherlands            350.        5830    16.6
    ##  7 United States          312.       96909   310. 
    ##  8 Ecuador                217.        3203    14.8
    ##  9 Canada                 192.        6453    33.7
    ## 10 Portugal               125.        1330    10.7
    ## 11 Peru                   116.        3456    29.9
    ## 12 Brazil                 113.       22666   201. 
    ## 13 Germany                101.        8302    81.8
    ## 14 Iran                    96.9       7451    76.9
    ## 15 Mexico                  65.7       7394   112. 
    ## 16 Turkey                  56.2       4369    77.8
    ## 17 Romania                 54.5       1197    22.0
    ## 18 Chile                   45.4        761    16.7
    ## 19 Czech Republic          30.3        317    10.5
    ## 20 Russia                  27.1       3807   141.

EOL
